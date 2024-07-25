import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/register_entity.dart';

part 'generated/register_response.freezed.dart';

@Freezed(fromJson: false, toJson: false)
class RegisterResponse with _$RegisterResponse {
  const RegisterResponse._();

  const factory RegisterResponse({String? message}) = _RegisterResponse;

  factory RegisterResponse.fromJson(Map<String, dynamic> json) =>
      RegisterResponse(message: json["message"]);

  RegisterEntity toEntity() => RegisterEntity(message: message);
}
