part of 'send_message_bloc.dart';

@freezed
class SendMessageState with _$SendMessageState {
  const factory SendMessageState(
      {@Default(FormzSubmissionStatus.initial) FormzSubmissionStatus status,
      @Default(RequiredTextInput.pure()) RequiredTextInput content,
      String? failedMessage}) = _SendMessageState;
}
