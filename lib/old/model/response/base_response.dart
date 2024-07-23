// To parse this JSON data, do
//
//     final pinUserResponse = pinUserResponseFromJson(jsonString);

import 'dart:convert';

BaseResponse baseResponseFromJson(String str) => BaseResponse.fromJson(json.decode(str));

String baseResponseToJson(BaseResponse data) => json.encode(data.toJson());

class BaseResponse {
  BaseResponse({
    this.message,
    this.success,
  });

  String? message;
  bool? success;

  factory BaseResponse.fromJson(Map<String, dynamic> json) => BaseResponse(
    message: json["message"],
    success: json["success"],
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "success": success,
  };
}
