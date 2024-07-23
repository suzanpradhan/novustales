// To parse this JSON data, do
//
//     final CategoryResponse2 = CategoryResponse2FromJson(jsonString);

import 'dart:convert';

CategoryResponse2 categoryResponse2FromJson(String str) =>
    CategoryResponse2.fromJson(json.decode(str));

String categoryResponse2ToJson(CategoryResponse2 data) =>
    json.encode(data.toJson());

class CategoryResponse2 {
  CategoryResponse2(
      {this.count, this.next, this.previous, this.results, this.success});

  num? count;
  dynamic next;
  dynamic previous;
  List<Results>? results;
  bool? success;

  factory CategoryResponse2.fromJson(Map<String, dynamic> json) =>
      CategoryResponse2(
        count: json["count"],
        next: json["next"],
        previous: json["previous"],
        success: json["success"],
        results:
        List<Results>.from(json["results"].map((x) => Results.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
    "count": count,
    "success": success,
    "next": next,
    "previous": previous,
    "results": List<dynamic>.from(results!.map((x) => x.toJson())),
  };
}

class Results {
  Results({
    this.category,
    this.stories,
  });

  String? category;
  List<Story>? stories;

  factory Results.fromJson(Map<String, dynamic> json) => Results(
    category: json["category"],
    stories:
    List<Story>.from(json["stories"].map((x) => Story.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "category": category,
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
  String? image;
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
