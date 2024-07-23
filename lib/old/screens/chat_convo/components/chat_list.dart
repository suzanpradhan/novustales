import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart' as provider;
import '../../../providers/common_provider.dart';

import '../../../constants/message_enum.dart';
import '../../../model/response/message.dart';
import '../../../providers/auth_view_model.dart';
import '../../../widgets/my_message_card.dart';
import '../../../widgets/sender_message_card.dart';
import '../controller/chat_convo_controller.dart';

class ChatList extends ConsumerStatefulWidget {
  final String recieverUserId;
  final bool isGroupChat;
  const ChatList({
    Key? key,
    required this.recieverUserId,
    required this.isGroupChat,
  }) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ChatListState();
}

class _ChatListState extends ConsumerState<ChatList> {
  final ScrollController messageController = ScrollController();

  @override
  void dispose() {
    super.dispose();
    messageController.dispose();
  }

  void onMessageSwipe(
    String message,
    bool isMe,
    MessageEnum messageEnum,
  ) {
    ref.read(messageReplyProvider.state).update(
          (state) => MessageReply(
            message,
            isMe,
            messageEnum,
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Message>>(
        stream: widget.isGroupChat
            ? ref
                .read(chatControllerProvider)
                .groupChatStream(widget.recieverUserId)
            : ref.read(chatControllerProvider).chatStream(
                widget.recieverUserId,
                provider.Provider.of<AuthViewModel>(context, listen: false)
                    .userData['id']
                    .toString()),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CupertinoActivityIndicator();
          }

          SchedulerBinding.instance.addPostFrameCallback((_) {
            messageController
                .jumpTo(messageController.position.maxScrollExtent);
          });

          return ListView.builder(
            controller: messageController,
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              final messageData = snapshot.data![index];
              var timeSent = DateFormat.Hm().format(messageData.timeSent);

              if (!messageData.isSeen &&
                  messageData.recieverid ==
                      provider.Provider.of<AuthViewModel>(context,
                              listen: false)
                          .userData['id']
                          .toString()) {
                ref.read(chatControllerProvider).setChatMessageSeen(
                      context,
                      widget.recieverUserId,
                      provider.Provider.of<AuthViewModel>(context,
                              listen: false)
                          .userData['id']
                          .toString(),
                      messageData.messageId,
                    );
              }
              if (messageData.senderId ==
                  provider.Provider.of<AuthViewModel>(context, listen: false)
                      .userData['id']
                      .toString()) {
                print("PRINTING USER NAME:::::${messageData.senderId}");
                return MyMessageCard(
                  message: messageData.text,
                  date: timeSent,
                  type: messageData.type,
                  repliedText: messageData.repliedMessage,
                  username: messageData.repliedTo,
                  repliedMessageType: messageData.repliedMessageType,
                  onLeftSwipe: () => onMessageSwipe(
                    messageData.text,
                    true,
                    messageData.type,
                  ),
                  isSeen: messageData.isSeen,
                );
              }
              return SenderMessageCard(
                senderId: messageData.senderId,
                message: messageData.text,
                date: timeSent,
                type: messageData.type,
                username: messageData.repliedTo,
                repliedMessageType: messageData.repliedMessageType,
                onRightSwipe: () => onMessageSwipe(
                  messageData.text,
                  false,
                  messageData.type,
                ),
                repliedText: messageData.repliedMessage,
              );
            },
          );
        });
  }
}
