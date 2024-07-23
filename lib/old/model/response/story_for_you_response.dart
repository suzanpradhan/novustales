// To parse this JSON data, do
//
//     final storyForYouResponse = storyForYouResponseFromJson(jsonString);

import 'dart:convert';

StoryForYouResponse storyForYouResponseFromJson(String str) =>
    StoryForYouResponse.fromJson(json.decode(str));

String storyForYouResponseToJson(StoryForYouResponse data) =>
    json.encode(data.toJson());

class StoryForYouResponse {
  int? count;
  List<Result>? results;

  StoryForYouResponse({
    this.count,
    this.results,
  });

  factory StoryForYouResponse.fromJson(Map<String, dynamic> json) =>
      StoryForYouResponse(
        count: json["count"],
        results:
        List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
    "count": count,
    "results": List<dynamic>.from(results!.map((x) => x.toJson())),
  };
}

class Result {
  int? id;
  UserDetails? userDetails;
  String? mediaUrl;
  String? category;
  String? title;
  String? media;
  dynamic blobRef;
  double? latitude;
  double? longitude;
  String? name;
  String? country;
  String? state;
  String? city;
  String? county;
  int? views;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? user;

  Result({
    this.id,
    this.userDetails,
    this.mediaUrl,
    this.category,
    this.title,
    this.media,
    this.blobRef,
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

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    id: json["id"],
    userDetails: UserDetails.fromJson(json["user_details"]),
    mediaUrl: json["media_url"],
    category: json["category"],
    title: json["title"],
    media: json["media"],
    blobRef: json["blob_ref"],
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
    "media_url": mediaUrl,
    "category": category,
    "title": title,
    "media": media,
    "blob_ref": blobRef,
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
