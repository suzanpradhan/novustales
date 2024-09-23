part of 'read_message_bloc.dart';

@freezed
class ReadMessageEvent with _$ReadMessageEvent {
  const factory ReadMessageEvent.readMessage(
      {required String senderId, required String roomId}) = _ReadMessage;
}
