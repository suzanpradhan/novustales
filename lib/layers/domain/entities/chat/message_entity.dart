import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/message_entity.freezed.dart';

@Freezed(fromJson: false, toJson: false)
class MessageEntity with _$MessageEntity {
  const factory MessageEntity(
      {required String id,
      required String profileId,
      required String roomId,
      String? content,
      String? createdAt,
      bool? read}) = _MessageEntity;
}
