// To parse this JSON data, do
//
//     final pinUserResponse = pinUserResponseFromJson(jsonString);

import 'dart:convert';

PinUserResponse pinUserResponseFromJson(String str) => PinUserResponse.fromJson(json.decode(str));

String pinUserResponseToJson(PinUserResponse data) => json.encode(data.toJson());

class PinUserResponse {
  PinUserResponse({
    this.message,
    this.success,
  });

  String? message;
  bool? success;

  factory PinUserResponse.fromJson(Map<String, dynamic> json) => PinUserResponse(
    message: json["message"],
    success: json["success"],
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "success": success,
  };
}
