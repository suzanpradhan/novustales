// To parse this JSON data, do
//
//     final userResponse = userResponseFromJson(jsonString);

import 'dart:convert';

UserResponse userResponseFromJson(String str) =>
    UserResponse.fromJson(json.decode(str));

String userResponseToJson(UserResponse data) => json.encode(data.toJson());

class UserResponse {
  UserResponse(
      {this.email,
        this.id,
        this.isActive,
        this.isStaff,
        this.numberOfStories,
        this.numberOfViews,
        this.stories,
        this.success,
        this.firstName,
        this.lastName,
        this.nickName,
        this.avatar});

  String? email;
  String? firstName;
  String? lastName;
  String? nickName;
  String? avatar;
  num? id;
  bool? isActive;
  bool? isStaff;
  num? numberOfStories;
  num? numberOfViews;
  List<Story>? stories;
  bool? success;

  factory UserResponse.fromJson(Map<String, dynamic> json) => UserResponse(
    email: json["email"],
    firstName: json["first_name"],
    lastName: json["last_name"],
    nickName: json["nick_name"],
    avatar: json["avatar"],
    id: json["id"],
    success: json["success"],
    isActive: json["is_active"],
    isStaff: json["is_staff"],
    numberOfStories: json["number_of_stories"],
    numberOfViews: json["number_of_views"],
    stories:
    List<Story>.from(json["stories"].map((x) => Story.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "email": email,
    "first_name": firstName,
    "last_name": lastName,
    "nick_n ame": nickName,
    "avatar": avatar,
    "id": id,
    "is_active": isActive,
    "success": success,
    "is_staff": isStaff,
    "number_of_stories": numberOfStories,
    "number_of_views": numberOfViews,
    "stories": List<dynamic>.from(stories!.map((x) => x.toJson())),
  };
}

class Story {
  Story({
    this.id,
    this.userDetails,
    this.imageUrl,
    this.media,
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
  });

  num? id;
  UserDetails? userDetails;
  String? imageUrl;
  String? media;
  String? category;
  String? title;
  dynamic image;
  num? latitude;
  num? longitude;
  String? name;
  String? country;
  String? state;
  String? city;
  String? county;
  num? views;
  DateTime? createdAt;
  DateTime? updatedAt;
  num? user;

  factory Story.fromJson(Map<String, dynamic> json) => Story(
    id: json["id"],
    userDetails: UserDetails.fromJson(json["user_details"]),
    imageUrl: json["image_url"],
    media: json["media"],
    category: json["category"],
    title: json["title"],
    image: json["image"],
    latitude: json["latitude"],
    longitude: json["longitude"],
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
    "user_details": userDetails?.toJson(),
    "image_url": imageUrl,
    "media": media,
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
    this.name,
    this.nickName,
    this.avatar,
  });

  num? id;
  String? email;
  String? name;
  String? nickName;
  String? avatar;

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
