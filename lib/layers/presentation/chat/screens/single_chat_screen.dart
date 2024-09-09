import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

import '../../../../core/constants/ui_constants.dart';
import '../../../../core/presentation/ui/spacer.dart';
import '../../../../core/presentation/widgets/form_fields/form_input_field.dart';
import '../../../../utils/dependencies_injection.dart';
import '../../../domain/entities/chat/room_entity.dart';
import '../../me/bloc/profile_bloc/get_profile_bloc.dart';
import '../blocs/message_stream/message_stream_bloc.dart';
import '../blocs/send_message/send_message_bloc.dart';
import '../widget/texting_box_card.dart';

class SignleChatScreen extends StatefulWidget {
  final RoomEntity room;

  const SignleChatScreen({super.key, required this.room});

  @override
  State<SignleChatScreen> createState() => _SignleChatScreenState();
}

class _SignleChatScreenState extends State<SignleChatScreen> {
  @override
  final TextEditingController _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SendMessageBloc(sl()),
        ),
        BlocProvider(
          create: (context) => MessageStreamBloc(sl())
            ..add(MessageStreamEvent.attempted(roomId: widget.room.uuid)),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.room.receiverUser?.name ?? "-"),
        ),
        body: Gapper.screenPadding(
          child: Column(
            children: [
              Expanded(
                child: BlocBuilder<MessageStreamBloc, MessageStreamState>(
                  builder: (context, state) {
                    return state.mapOrNull(
                          success: (value) {
                            return ListView.builder(
                                shrinkWrap: true,
                                reverse: true,
                                itemCount: value.messages.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: EdgeInsets.only(
                                        top:
                                            index == (value.messages.length - 1)
                                                ? UIConstants.padding
                                                : 0,
                                        bottom: index == 0
                                            ? UIConstants.padding
                                            : UIConstants.xminPadding),
                                    child: TextingBox(
                                        message: value.messages[index]),
                                  );
                                });
                          },
                        ) ??
                        SizedBox();
                  },
                ),
              ),
              BlocListener<SendMessageBloc, SendMessageState>(
                listener: (context, state) {
                  // if (state.status == FormzSubmissionStatus.success ) {
                  //   context.read<ChatRoomsBloc>()..add(event);
                  // }
                  if (state.status == FormzSubmissionStatus.success ||
                      state.status == FormzSubmissionStatus.failure) {
                    _messageController.text = "";
                  }
                },
                child: BlocBuilder<SendMessageBloc, SendMessageState>(
                  builder: (context, state) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: UIConstants.screenPadding),
                      child: FormInputField(
                        placeholder: "Type a message",
                        height: 50,
                        controller: _messageController,
                        border: Border.all(width: 0, color: Colors.transparent),
                        suffix: BlocBuilder<GetProfileBloc, GetProfileState>(
                          builder: (context, userSessionState) {
                            return InkWell(
                              onTap: () {
                                userSessionState.whenOrNull(
                                  success: (userSession) {
                                    if (state.content.isValid) {
                                      context.read<SendMessageBloc>().add(
                                          SendMessageEvent.sendMessage(
                                              senderId: userSession.uuid,
                                              roomId: widget.room.uuid));
                                    }
                                  },
                                );
                              },
                              child: Container(
                                margin: const EdgeInsets.only(
                                    right: UIConstants.xminPadding),
                                width: 36,
                                height: 36,
                                decoration: BoxDecoration(
                                    color:
                                        Theme.of(context).colorScheme.secondary,
                                    borderRadius: BorderRadius.circular(
                                        UIConstants.minBorderRadius)),
                                child: Icon(
                                  Icons.send,
                                  size: 20,
                                  color: state.content.isValid
                                      ? Theme.of(context).colorScheme.onSurface
                                      : Theme.of(context).colorScheme.onPrimary,
                                ),
                              ),
                            );
                          },
                        ),
                        onChanged: (value) {
                          context.read<SendMessageBloc>().add(
                              SendMessageEvent.valudateContent(content: value));
                        },
                        context: context,
                        alignment: InputAlignment.vertical,
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
