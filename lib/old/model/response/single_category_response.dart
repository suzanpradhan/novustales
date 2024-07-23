// To parse this JSON data, do
//
//     final singleCategoryResponse = singleCategoryResponseFromJson(jsonString);

import 'dart:convert';

SingleCategoryResponse singleCategoryResponseFromJson(String str) => SingleCategoryResponse.fromJson(json.decode(str));

String singleCategoryResponseToJson(SingleCategoryResponse data) => json.encode(data.toJson());

class SingleCategoryResponse {
  SingleCategoryResponse({
    this.count,
    this.next,
    this.previous,
    this.results,
    this.success
  });

  num? count;
  dynamic next;
  dynamic previous;
  List<Result>? results;
  bool? success;

  factory SingleCategoryResponse.fromJson(Map<String, dynamic> json) => SingleCategoryResponse(
    count: json["count"],
    next: json["next"],
    success: json["success"],
    previous: json["previous"],
    results: List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "count": count,
    "next": next,
    "success": success,
    "previous": previous,
    "results": List<dynamic>.from(results!.map((x) => x.toJson())),
  };
}

class Result {
  Result({
    this.id,
    this.name,
    this.image,
  });

  int? id;
  String? name;
  dynamic image;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    id: json["id"],
    name: json["name"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "image": image,
  };
}
