import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/logout_entity.dart';

part 'generated/logout_response.freezed.dart';

@Freezed(fromJson: false, toJson: false)
class LogoutResponse with _$LogoutResponse {
  const LogoutResponse._();

  const factory LogoutResponse({String? message}) = _LogoutResponse;

  factory LogoutResponse.fromJson(Map<String, dynamic> json) =>
      LogoutResponse(message: json["message"]);

  LogoutEntity toEntity() => LogoutEntity(message: message);
}
