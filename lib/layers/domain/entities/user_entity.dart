import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/user_entity.freezed.dart';

@freezed
class UserEntity with _$UserEntity {
  const factory UserEntity({
    int? id,
    String? nickName,
    String? firstName,
    String? lastName,
    String? avatar,
  }) = _UserEntity;
}
