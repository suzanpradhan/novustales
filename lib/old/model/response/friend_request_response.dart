// To parse this JSON data, do
//
//     final friendRequestResponse = friendRequestResponseFromJson(jsonString);

import 'dart:convert';

List<FriendRequestResponse> friendRequestResponseFromJson(String str) => List<FriendRequestResponse>.from(json.decode(str).map((x) => FriendRequestResponse.fromJson(x)));

String friendRequestResponseToJson(List<FriendRequestResponse> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class FriendRequestResponse {
  int? id;
  User? toUser;
  User? fromUser;
  String? detail;

  FriendRequestResponse({
    this.id,
    this.toUser,
    this.detail,
    this.fromUser,
  });

  factory FriendRequestResponse.fromJson(Map<String, dynamic> json) => FriendRequestResponse(
    id: json["id"],
    detail: json["detail"],
    toUser: User.fromJson(json["to_user"]),
    fromUser: User.fromJson(json["from_user"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "detail": detail,
    "to_user": toUser?.toJson(),
    "from_user": fromUser?.toJson(),
  };
}

class User {
  int? id;
  String? nickName;
  String? avatar;

  User({
    this.id,
    this.nickName,
    this.avatar,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    nickName: json["nick_name"],
    avatar: json["avatar"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "nick_name": nickName,
    "avatar": avatar,
  };
}
