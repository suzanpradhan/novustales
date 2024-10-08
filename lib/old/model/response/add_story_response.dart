// To parse this JSON data, do
//
//     final addStoryResponse = addStoryResponseFromJson(jsonString);

import 'dart:convert';

AddStoryResponse addStoryResponseFromJson(String str) =>
    AddStoryResponse.fromJson(json.decode(str));

String addStoryResponseToJson(AddStoryResponse data) =>
    json.encode(data.toJson());

class AddStoryResponse {
  AddStoryResponse(
      {this.id,
      this.userDetails,
      this.imageUrl,
      this.category,
      this.title,
      this.image,
      this.latitude,
      this.longitude,
      this.name,
      this.country,
      this.state,
      this.city,
      this.county,
      this.views,
      this.createdAt,
      this.updatedAt,
      this.user,
      this.success});

  int? id;
  bool? success;
  UserDetails? userDetails;
  String? imageUrl;
  String? category;
  String? title;
  String? image;
  num? latitude;
  num? longitude;
  String? name;
  String? country;
  String? state;
  String? city;
  String? county;
  int? views;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? user;

  factory AddStoryResponse.fromJson(Map<String, dynamic> json) =>
      AddStoryResponse(
        id: json["id"],
        success: json["success"],
        userDetails: UserDetails.fromJson(json["user_details"]),
        imageUrl: json["image_url"],
        category: json["category"],
        title: json["title"],
        image: json["image"],
        latitude: json["latitude"].toDouble(),
        longitude: json["longitude"].toDouble(),
        name: json["name"],
        country: json["country"],
        state: json["state"],
        city: json["city"],
        county: json["county"],
        views: json["views"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        user: json["user"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "success": success,
        "user_details": userDetails?.toJson(),
        "image_url": imageUrl,
        "category": category,
        "title": title,
        "image": image,
        "latitude": latitude,
        "longitude": longitude,
        "name": name,
        "country": country,
        "state": state,
        "city": city,
        "county": county,
        "views": views,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "user": user,
      };
}

class UserDetails {
  UserDetails({
    this.id,
    this.email,
    this.avatar,
  });

  int? id;
  String? email;
  String? avatar;

  factory UserDetails.fromJson(Map<String, dynamic> json) => UserDetails(
        id: json["id"],
        email: json["email"],
        avatar: json["avatar"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "avatar": avatar,
      };
}
