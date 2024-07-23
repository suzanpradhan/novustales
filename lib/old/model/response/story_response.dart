// To parse this JSON data, do
//
//     final storyResponse = storyResponseFromJson(jsonString);

import 'dart:convert';

StoryResponse storyResponseFromJson(String str) =>
    StoryResponse.fromJson(json.decode(str));

String storyResponseToJson(StoryResponse data) => json.encode(data.toJson());

class StoryResponse {
  StoryResponse(
      {this.count,
        this.next,
        this.previous,
        this.results,
        this.success});

  num? count;
  String? next;
  String? previous;
  List<Result>? results;
  bool? success;

  factory StoryResponse.fromJson(Map<String, dynamic> json) => StoryResponse(
    count: json["count"],
    next: json["next"],
    success: json["success"],
    previous: json["previous"],
    results:
    List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "count": count,
    "next": next,
    "previous": previous,
    "success": success,
    "results": List<dynamic>.from(results!.map((x) => x.toJson())),
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
  String? image;
  num? latitude;
  num? longitude;
  dynamic name;
  dynamic country;
  dynamic state;
  dynamic city;
  dynamic county;
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

class Result {
  Result({
    this.id,
    this.email,
    this.avatar,
    this.stories,
  });

  num? id;
  String? email;
  String? avatar;
  List<Story>? stories;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    id: json["id"],
    email: json["email"],
    avatar: json["avatar"],
    stories:
    List<Story>.from(json["stories"].map((x) => Story.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "email": email,
    "avatar": avatar,
    "stories": List<dynamic>.from(stories!.map((x) => x.toJson())),
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
