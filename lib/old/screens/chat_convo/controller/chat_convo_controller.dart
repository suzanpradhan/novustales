import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../providers/common_provider.dart';
import '../../../constants/message_enum.dart';
import '../../../model/response/chat_contact.dart';
import '../../../model/response/group.dart';
import '../../../model/response/message.dart';
import '../../../model/response/user_firebase_model.dart';
import '../repository/chat_convo_repo.dart';

final chatControllerProvider = Provider((ref) {
  final chatRepository = ref.watch(chatRepositoryProvider);
  return ChatController(
    chatRepository: chatRepository,
    ref: ref,
  );
});

class ChatController {
  final ChatRepository chatRepository;
  final ProviderRef ref;
  ChatController({
    required this.chatRepository,
    required this.ref,
  });

  Stream<List<ChatContact>> chatContacts(senderId) {
    return chatRepository.getChatContacts(senderId);
  }

  Stream<List<Group>> chatGroups(senderId) {
    return chatRepository.getChatGroups(senderId);
  }

  Stream<List<Message>> chatStream(String recieverUserId, senderId) {
    return chatRepository.getChatStream(recieverUserId, senderId);
  }

  Stream<List<Message>> groupChatStream(String groupId) {
    return chatRepository.getGroupChatStream(groupId);
  }

  void sendTextMessage(BuildContext context, String text, String recieverUserId,
      String senderId, bool isGroupChat, UserFirebaseModel senderUser) {
    print({
      "text": text,
      "recieverUserId": recieverUserId,
      "senderuser": senderUser.toJson(),
      "isGroupChat": isGroupChat,
      "senderId": senderId,
      "username": senderUser.name,
      "image": senderUser.image,
    });
    final messageReply = ref.read(messageReplyProvider);
    chatRepository.sendTextMessage(
      context: context,
      text: text,
      recieverUserId: recieverUserId,
      senderUser: senderUser,
      messageReply: messageReply,
      isGroupChat: isGroupChat,
      senderId: senderId,
    );
    ref.read(messageReplyProvider.state).update((state) => null);
  }

  void sendFileMessage(
      BuildContext context,
      File file,
      String recieverUserId,
      String senderId,
      MessageEnum messageEnum,
      bool isGroupChat,
      UserFirebaseModel senderUser) {
    final messageReply = ref.read(messageReplyProvider);
    chatRepository.sendFileMessage(
      context: context,
      file: file,
      recieverUserId: recieverUserId,
      senderId: senderId,
      senderUserData: senderUser,
      messageEnum: messageEnum,
      ref: ref,
      messageReply: messageReply,
      isGroupChat: isGroupChat,
    );

    ref.read(messageReplyProvider.state).update((state) => null);
  }

  void sendGIFMessage(
      BuildContext context,
      String gifUrl,
      String recieverUserId,
      String senderId,
      bool isGroupChat,
      UserFirebaseModel senderUser) {
    final messageReply = ref.read(messageReplyProvider);
    int gifUrlPartIndex = gifUrl.lastIndexOf('-') + 1;
    String gifUrlPart = gifUrl.substring(gifUrlPartIndex);
    String newgifUrl = 'https://i.giphy.com/media/$gifUrlPart/200.gif';
    chatRepository.sendGIFMessage(
      context: context,
      gifUrl: newgifUrl,
      recieverUserId: recieverUserId,
      senderId: senderId,
      senderUser: senderUser,
      messageReply: messageReply,
      isGroupChat: isGroupChat,
    );
    ref.read(messageReplyProvider.state).update((state) => null);
  }

  void setChatMessageSeen(
    BuildContext context,
    String recieverUserId,
    String senderId,
    String messageId,
  ) {
    chatRepository.setChatMessageSeen(
        context, recieverUserId, messageId, senderId);
  }
}
