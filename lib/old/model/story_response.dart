// To parse this JSON data, do
//
//     final storyResponse = storyResponseFromJson(jsonString);

import 'dart:convert';

StResponse StResponseFromJson(String str) =>
    StResponse.fromJson(json.decode(str));

String StResponseToJson(StResponse data) => json.encode(data.toJson());

class StResponse {
  StResponse(
      {this.count, this.next, this.previous, this.results,});

  num? count;
  String? next;
  String? previous;
  List<dynamic>? results;

  factory StResponse.fromJson(Map<String, dynamic> json) => StResponse(
      count: json["count"],
      next: json["next"],
      previous: json["previous"],
      results: json["results"]
      // List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "next": next,
        "previous": previous,
        "results": results,
      };

  StResponse.withError(String errorValue)
      : results = [];
}
