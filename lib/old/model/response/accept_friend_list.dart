// To parse this JSON data, do
//
//     final acceptFriendList = acceptFriendListFromJson(jsonString);

import 'dart:convert';

AcceptFriendList acceptFriendListFromJson(String str) => AcceptFriendList.fromJson(json.decode(str));

String acceptFriendListToJson(AcceptFriendList data) => json.encode(data.toJson());

class AcceptFriendList {
  int? id;
  User? user;
  List<User>? friends;
  String? detail;

  AcceptFriendList({
    this.id,
    this.user,
    this.friends,
    this.detail
  });

  factory AcceptFriendList.fromJson(Map<String, dynamic> json) => AcceptFriendList(
    id: json["id"],
    detail: json["detail"],
    user: User.fromJson(json["user"]),
    friends: List<User>.from(json["friends"].map((x) => User.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "detail": detail,
    "user": user?.toJson(),
    "friends": List<dynamic>.from(friends!.map((x) => x.toJson())),
  };
}

class User {
  int? id;
  String? nickName;
  String? avatar;
  String? fullName;
  String? email;

  User({
    this.id,
    this.nickName,
    this.avatar,
    this.fullName,
    this.email,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    nickName: json["nick_name"],
    avatar: json["avatar"],
    fullName: json["full_name"],
    email: json["email"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "nick_name": nickName,
    "avatar": avatar,
    "full_name": fullName,
    "email": email,
  };
}
