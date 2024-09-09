part of 'message_stream_bloc.dart';

@freezed
class MessageStreamEvent with _$MessageStreamEvent {
  const factory MessageStreamEvent.attempted({required String roomId}) =
      _Attempted;
}
