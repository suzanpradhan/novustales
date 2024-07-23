// To parse this JSON data, do
//
//     final loginRequest = loginRequestFromJson(jsonString);

import 'dart:convert';

LoginRequest loginRequestFromJson(String str) =>
    LoginRequest.fromJson(json.decode(str));

String loginRequestToJson(LoginRequest data) => json.encode(data.toJson());

class LoginRequest {
  String? email;
  String? password;

  FcmDeviceInfo? fcmDeviceInfo;

  LoginRequest({this.email, this.password, this.fcmDeviceInfo});

  factory LoginRequest.fromJson(Map<String, dynamic> json) => LoginRequest(
        email: json["email"],
        password: json["password"],
        fcmDeviceInfo: FcmDeviceInfo.fromJson(json["fcm_device_info"]),
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
        "fcm_device_info": fcmDeviceInfo?.toJson(),
      };
}

class FcmDeviceInfo {
  FcmDeviceInfo({
    this.registrationId,
    this.deviceId,
    this.type,
  });

  String? registrationId;
  String? deviceId;
  String? type;

  factory FcmDeviceInfo.fromJson(Map<String, dynamic> json) => FcmDeviceInfo(
        registrationId: json["registration_id"],
        deviceId: json["device_id"],
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "registration_id": registrationId,
        "device_id": deviceId,
        "type": type,
      };
}
