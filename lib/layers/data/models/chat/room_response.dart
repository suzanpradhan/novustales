// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/entities/chat/chat_profile_entity.dart';
import '../../../domain/entities/chat/room_entity.dart';
import 'chat_user.dart';

part 'generated/room_response.freezed.dart';
part 'generated/room_response.g.dart';

@Freezed(toJson: false, fromJson: true)
class RoomModel with _$RoomModel {
  const factory RoomModel({
    required String id,
    String? name,
    DateTime? createdAt,
    @JsonKey(includeFromJson: false) String? lastMessage,
    @JsonKey(includeFromJson: false) ChatUser? receiverUser,
  }) = _RoomModel;

  const RoomModel._();

  factory RoomModel.fromJson(Map<String, dynamic> json) =>
      _$RoomModelFromJson(json);

  RoomEntity toEntity() => RoomEntity(
      uuid: id,
      name: name,
      createdAt: createdAt,
      lastMessage: lastMessage,
      receiverUser: receiverUser != null
          ? ChatProfileEntity(
              id: receiverUser!.id,
              avatar: receiverUser?.avatar,
              createdAt: receiverUser?.createdAt,
              email: receiverUser!.email,
              name: receiverUser!.name)
          : null);
}
