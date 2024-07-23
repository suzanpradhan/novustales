// To parse this JSON data, do
//
//     final storyResponse = storyResponseFromJson(jsonString);

import 'dart:convert';

CommonResponse storyResponseFromJson(String str) =>
    CommonResponse.fromJson(json.decode(str));

String commonResponseToJson(CommonResponse data) => json.encode(data.toJson());

class CommonResponse {
  CommonResponse(
      {this.count, this.next, this.previous, this.results, this.success});

  num? count;
  String? next;
  String? previous;
  List<dynamic>? results;
  bool? success;

  factory CommonResponse.fromJson(Map<String, dynamic> json) => CommonResponse(
      count: json["count"],
      next: json["next"],
      success: json["success"],
      previous: json["previous"],
      results: json["results"]
      // List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "next": next,
        "previous": previous,
        "success": success,
        "results": results,
      };
}
