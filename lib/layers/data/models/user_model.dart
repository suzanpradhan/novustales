import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/user_entity.dart';

part 'generated/user_model.freezed.dart';
part 'generated/user_model.g.dart';

@Freezed(toJson: false)
class UserModel with _$UserModel {
  const factory UserModel({
    int? id,
    @JsonKey(name: "nick_name") String? nickName,
    String? avatar,
    @JsonKey(name: "first_name") String? firstName,
    @JsonKey(name: "last_name") String? lastName,
  }) = _UserModel;

  const UserModel._();

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);

  UserEntity toEntity() => UserEntity(
        id: id,
        nickName: nickName,
        avatar: avatar,
        firstName: firstName,
        lastName: lastName,
      );
}
