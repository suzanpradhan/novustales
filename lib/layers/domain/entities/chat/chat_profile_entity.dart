import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/chat_profile_entity.freezed.dart';

@Freezed(fromJson: false, toJson: false)
class ChatProfileEntity with _$ChatProfileEntity {
  const factory ChatProfileEntity(
      {required String id,
      String? email,
      String? name,
      String? avatar,
      DateTime? createdAt}) = _ChatProfileEntity;
}
