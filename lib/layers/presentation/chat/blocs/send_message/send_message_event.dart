part of 'send_message_bloc.dart';

@freezed
class SendMessageEvent with _$SendMessageEvent {
  const factory SendMessageEvent.valudateContent(
      {@Default("") String content}) = _ValidateContent;
  const factory SendMessageEvent.sendMessage(
      {required String senderId, required String roomId}) = _SendMessage;
}
