import 'package:bloc/bloc.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../core/presentation/ui/text_input.dart';
import '../../../../domain/usecases/chat/send_message.dart';

part 'generated/send_message_bloc.freezed.dart';
part 'send_message_event.dart';
part 'send_message_state.dart';

class SendMessageBloc extends Bloc<SendMessageEvent, SendMessageState> {
  final SendMessage sendMessage;
  SendMessageBloc(this.sendMessage) : super(const SendMessageState()) {
    on<SendMessageEvent>((event, emit) {});
    on<_ValidateContent>(
      (event, emit) {
        final content = RequiredTextInput.dirty(event.content);
        emit(state.copyWith(
          content: content,
          status: FormzSubmissionStatus.initial,
        ));
      },
    );
    on<_SendMessage>((event, emit) async {
      emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
      if (Formz.validate([state.content])) {
        (await sendMessage.call(SendMessageParams(
                senderId: event.senderId,
                roomId: event.roomId,
                content: state.content.value)))
            .fold(
                (l) => {
                      emit(state.copyWith(
                          content: const RequiredTextInput.pure(),
                          status: FormzSubmissionStatus.failure,
                          failedMessage: "Failed to send message"))
                    },
                (r) => {
                      emit(state.copyWith(
                          content: const RequiredTextInput.pure(),
                          status: FormzSubmissionStatus.success))
                    });
      }
    });
  }
}
