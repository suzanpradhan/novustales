import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/login_entity.dart';

part 'generated/user_credential.freezed.dart';

@Freezed(fromJson: false, toJson: false)
class UserCredential with _$UserCredential {
  const UserCredential._();

  const factory UserCredential({String? accessToken, String? uuid}) =
      _UserCredential;

  factory UserCredential.fromJson(Map<String, dynamic> json) =>
      UserCredential(accessToken: json["access"]);

  LoginEntity toEntity() => LoginEntity(token: accessToken);
}
