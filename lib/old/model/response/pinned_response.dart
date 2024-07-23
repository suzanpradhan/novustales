// To parse this JSON data, do
//
//     final pinnedResponse = pinnedResponseFromJson(jsonString);

import 'dart:convert';

PinnedResponse pinnedResponseFromJson(String str) => PinnedResponse.fromJson(json.decode(str));

String pinnedResponseToJson(PinnedResponse data) => json.encode(data.toJson());

class PinnedResponse {
  PinnedResponse({
    this.count,
    this.next,
    this.previous,
    this.results,
    this.success
  });

  int? count;
  bool? success;
  dynamic next;
  dynamic previous;
  List<dynamic>? results;

  factory PinnedResponse.fromJson(Map<String, dynamic> json) => PinnedResponse(
    count: json["count"],
    next: json["next"],
    success: json["success"],
    previous: json["previous"],
    results: json["results"],
  );

  Map<String, dynamic> toJson() => {
    "count": count,
    "success": success,
    "next": next,
    "previous": previous,
    "results": results,
  };
}

class Story {
  Story({
    this.id,
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
  });

  int? id;
  dynamic userDetails;
  String? imageUrl;
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
  int? user;

  factory Story.fromJson(Map<String, dynamic> json) => Story(
    id: json["id"],
    userDetails: json["user_details"],
    imageUrl: json["image_url"],
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

