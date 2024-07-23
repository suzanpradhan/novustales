// // // To parse this JSON data, do
// // //
// // //     final commentResponse = commentResponseFromJson(jsonString);
// //
// // import 'dart:convert';
// //
// // List<CommentResponse> commentResponseFromJson(String str) =>
// //     List<CommentResponse>.from(
// //         json.decode(str).map((x) => CommentResponse.fromJson(x)));
// //
// // String commentResponseToJson(List<CommentResponse> data) =>
// //     json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
// //
// // class CommentResponse {
// //   int? id;
// //   UserDetails? userDetails;
// //   List<CommentResponse>? children;
// //   String? content;
// //   int? likes;
// //   DateTime? createdAt;
// //   DateTime? updatedAt;
// //
// //   CommentResponse({
// //     this.id,
// //     this.userDetails,
// //     this.children,
// //     this.content,
// //     this.likes,
// //     this.createdAt,
// //     this.updatedAt,
// //   });
// //
// //   factory CommentResponse.fromJson(Map<String, dynamic> json) =>
// //       CommentResponse(
// //         id: json["id"],
// //         userDetails: UserDetails.fromJson(json["user_details"]),
// //         children: List<CommentResponse>.from(json["children"].map((x) => CommentResponse.fromJson(x))),
// //         content: json["content"],
// //         likes: json["likes"],
// //         createdAt: DateTime.parse(json["created_at"]),
// //         updatedAt: DateTime.parse(json["updated_at"]),
// //       );
// //
// //   Map<String, dynamic> toJson() => {
// //         "id": id,
// //         "user_details": userDetails?.toJson(),
// //         "children": List<CommentResponse>.from(children!.map((x) => x)),
// //         "content": content,
// //         "likes": likes,
// //         "created_at": createdAt?.toIso8601String(),
// //         "updated_at": updatedAt?.toIso8601String(),
// //       };
// // }
// //
// // class UserDetails {
// //   int? id;
// //   String? email;
// //   String? name;
// //   String? nickName;
// //   String? avatar;
// //
// //   UserDetails({
// //     this.id,
// //     this.email,
// //     this.name,
// //     this.nickName,
// //     this.avatar,
// //   });
// //
// //   factory UserDetails.fromJson(Map<String, dynamic> json) => UserDetails(
// //         id: json["id"],
// //         email: json["email"],
// //         name: json["name"],
// //         nickName: json["nick_name"],
// //         avatar: json["avatar"],
// //       );
// //
// //   Map<String, dynamic> toJson() => {
// //         "id": id,
// //         "email": email,
// //         "name": name,
// //         "nick_name": nickName,
// //         "avatar": avatar,
// //       };
// // }
//
// // To parse this JSON data, do
// //
// //     final commentResponse = commentResponseFromJson(jsonString);
//
// import 'dart:convert';
//
// List<CommentResponse> commentResponseFromJson(String str) =>
//     List<CommentResponse>.from(
//         json.decode(str).map((x) => CommentResponse.fromJson(x)));
//
// String commentResponseToJson(List<CommentResponse> data) =>
//     json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
//
// class CommentResponse {
//   int? id;
//   UserDetails? userDetails;
//   List<CommentResponse>? children;
//   String? content;
//   int? likes;
//   DateTime? createdAt;
//   DateTime? updatedAt;
//
//   CommentResponse({
//     this.id,
//     this.userDetails,
//     this.children,
//     this.content,
//     this.likes,
//     this.createdAt,
//     this.updatedAt,
//   });
//
//   factory CommentResponse.fromJson(Map<String, dynamic> json) =>
//       CommentResponse(
//         id: json["id"],
//         userDetails: UserDetails.fromJson(json["user_details"]),
//         children: List<CommentResponse>.from(
//             json["children"].map((x) => CommentResponse.fromJson(x))),
//         content: json["content"],
//         likes: json["likes"],
//         // createdAt: DateTime.parse(json["created_at"]),
//         // updatedAt: DateTime.parse(json["updated_at"]),
//       );
//
//   Map<String, dynamic> toJson() => {
//     "id": id,
//     "user_details": userDetails?.toJson(),
//     "children":
//     List<CommentResponse>.from(children!.map((x) => x.toJson())),
//     "content": content,
//     "likes": likes,
//     "created_at": createdAt?.toIso8601String(),
//     "updated_at": updatedAt?.toIso8601String(),
//   };
// }
//
// class UserDetails {
//   int? id;
//   String? email;
//   String? name;
//   String? nickName;
//   String? avatar;
//
//   UserDetails({
//     this.id,
//     this.email,
//     this.name,
//     this.nickName,
//     this.avatar,
//   });
//
//   factory UserDetails.fromJson(Map<String, dynamic> json) => UserDetails(
//     id: json["id"],
//     email: json["email"],
//     name: json["name"],
//     nickName: json["nick_name"],
//     avatar: json["avatar"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "id": id,
//     "email": email,
//     "name": name,
//     "nick_name": nickName,
//     "avatar": avatar,
//   };
// }


// To parse this JSON data, do
//
//     final commentResponse = commentResponseFromJson(jsonString);

import 'dart:convert';

List<CommentResponse> commentResponseFromJson(String str) => List<CommentResponse>.from(json.decode(str).map((x) => CommentResponse.fromJson(x)));

String commentResponseToJson(List<CommentResponse> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CommentResponse {
  int? id;
  UserDetails? userDetails;
  List<CommentResponse>? children;
  String? content;
  int? likes;
  bool? isLiked;
  DateTime? createdAt;
  DateTime? updatedAt;

  CommentResponse({
    this.id,
    this.userDetails,
    this.children,
    this.content,
    this.likes,
    this.isLiked,
    this.createdAt,
    this.updatedAt,
  });

  factory CommentResponse.fromJson(Map<String, dynamic> json) => CommentResponse(
    id: json["id"],
    userDetails: UserDetails.fromJson(json["user_details"]),
    children: List<CommentResponse>.from(json["children"].map((x) => CommentResponse.fromJson(x))),
    content: json["content"],
    likes: json["likes"],
    isLiked: json["is_liked"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_details": userDetails?.toJson(),
    "children": List<dynamic>.from(children!.map((x) => x.toJson())),
    "content": content,
    "likes": likes,
    "is_liked": isLiked,
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
