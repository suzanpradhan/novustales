// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/entities/chat/message_entity.dart';

part 'generated/message_modal.freezed.dart';
part 'generated/message_modal.g.dart';

@Freezed(toJson: false)
class MessageModel with _$MessageModel {
  const MessageModel._();

  const factory MessageModel(
      {required String id,
      @JsonKey(name: "profile_id") required String profileId,
      @JsonKey(name: "room_id") required String roomId,
      String? content,
      @JsonKey(name: "created_at") String? createdAt,
      bool? read}) = _MessageModel;

  factory MessageModel.fromJson(Map<String, dynamic> json) =>
      _$MessageModelFromJson(json);

  MessageEntity toEntity() => MessageEntity(
      id: id,
      profileId: profileId,
      read: read,
      roomId: roomId,
      createdAt: createdAt,
      content: content);
}
