part of 'chat_rooms_bloc.dart';

@freezed
class ChatRoomsState with _$ChatRoomsState {
  const factory ChatRoomsState.initial() = _Initial;

  const factory ChatRoomsState.loading() = _Loading;
  const factory ChatRoomsState.success({required List<RoomEntity> rooms}) =
      _Success;
  const factory ChatRoomsState.failure(String message) = _Failure;
}
