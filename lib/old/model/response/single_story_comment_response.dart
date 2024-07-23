// To parse this JSON data, do
//
//     final singleStoryCommentResponse = singleStoryCommentResponseFromJson(jsonString);

import 'dart:convert';

SingleStoryCommentResponse singleStoryCommentResponseFromJson(String str) => SingleStoryCommentResponse.fromJson(json.decode(str));

String singleStoryCommentResponseToJson(SingleStoryCommentResponse data) => json.encode(data.toJson());

class SingleStoryCommentResponse {
  int? id;
  UserDetails? userDetails;
  List<dynamic>? children;
  String? content;
  int? likes;
  DateTime? createdAt;
  DateTime? updatedAt;

  SingleStoryCommentResponse({
    this.id,
    this.userDetails,
    this.children,
    this.content,
    this.likes,
    this.createdAt,
    this.updatedAt,
  });

  factory SingleStoryCommentResponse.fromJson(Map<String, dynamic> json) => SingleStoryCommentResponse(
    id: json["id"],
    userDetails: UserDetails.fromJson(json["user_details"]),
    children: List<dynamic>.from(json["children"].map((x) => x)),
    content: json["content"],
    likes: json["likes"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_details": userDetails?.toJson(),
    "children": List<dynamic>.from(children!.map((x) => x)),
    "content": content,
    "likes": likes,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}

class UserDetails {
  int? id;
  String? email;
  String? name;
  String? nickName;
  String? avatar;

  UserDetails({
    this.id,
    this.email,
    this.name,
    this.nickName,
    this.avatar,
  });

  factory UserDetails.fromJson(Map<String, dynamic> json) => UserDetails(
    id: json["id"],
    email: json["email"],
    name: json["name"],
    nickName: json["nick_name"],
    avatar: json["avatar"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "email": email,
    "name": name,
    "nick_name": nickName,
    "avatar": avatar,
  };
}
