import 'package:freezed_annotation/freezed_annotation.dart';

import 'chat_profile_entity.dart';

part 'generated/room_entity.freezed.dart';

@Freezed(toJson: false, fromJson: false)
class RoomEntity with _$RoomEntity {
  const factory RoomEntity(
      {required String uuid,
      String? name,
      DateTime? createdAt,
      String? lastMessage,
      List<ChatProfileEntity>? receiverUser}) = _RoomEntity;
}