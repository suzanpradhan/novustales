// To parse this JSON data, do
//
//     final registerRequest = registerRequestFromJson(jsonString);

import 'dart:convert';

RegisterRequest registerRequestFromJson(String str) => RegisterRequest.fromJson(json.decode(str));

String registerRequestToJson(RegisterRequest data) => json.encode(data.toJson());

class RegisterRequest {
  String ? email;
  String ? password;
  String ? firstName;
  String ? lastName;

  RegisterRequest({
    this.email,
    this.password,
    this.firstName,
    this.lastName,
  });

  factory RegisterRequest.fromJson(Map<String, dynamic> json) => RegisterRequest(
    email: json["email"],
    password: json["password"],
    firstName: json["first_name"],
    lastName: json["last_name"],
  );

  Map<String, dynamic> toJson() => {
    "email": email,
    "password": password,
    "first_name": firstName,
    "last_name": lastName,
  };
}
