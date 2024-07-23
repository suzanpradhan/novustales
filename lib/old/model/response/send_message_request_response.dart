// To parse this JSON data, do
//
//     final sendMessageRequestResponse = sendMessageRequestResponseFromJson(jsonString);

import 'dart:convert';

SendMessageRequestResponse sendMessageRequestResponseFromJson(String str) => SendMessageRequestResponse.fromJson(json.decode(str));

String sendMessageRequestResponseToJson(SendMessageRequestResponse data) => json.encode(data.toJson());

class SendMessageRequestResponse {
  bool? success;
  User? user;
  List<User>? friends;
  String? detail;

  SendMessageRequestResponse({
    this.success,
    this.user,
    this.friends,
    this.detail
  });

  factory SendMessageRequestResponse.fromJson(Map<String, dynamic> json) => SendMessageRequestResponse(
    success: json["success"],
    detail: json["detail"],
    user: User.fromJson(json["user"]),
    friends: List<User>.from(json["friends"].map((x) => User.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "detail": detail,
    "user": user?.toJson(),
    "friends": List<dynamic>.from(friends!.map((x) => x.toJson())),
  };
}

class User {
  String? nickName;
  String? avatar;

  User({
    this.nickName,
    this.avatar,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    nickName: json["nick_name"],
    avatar: json["avatar"],
  );

  Map<String, dynamic> toJson() => {
    "nick_name": nickName,
    "avatar": avatar,
  };
}
