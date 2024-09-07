// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/chat_user.freezed.dart';
part 'generated/chat_user.g.dart';

@Freezed(toJson: false)
class ChatUser with _$ChatUser {
  const ChatUser._();
  const factory ChatUser(
      {required String id,
      String? email,
      String? name,
      String? avatar,
      @JsonKey(name: "created_at") DateTime? createdAt}) = _ChatUser;

  factory ChatUser.fromJson(Map<String, dynamic> json) =>
      _$ChatUserFromJson(json);
}
