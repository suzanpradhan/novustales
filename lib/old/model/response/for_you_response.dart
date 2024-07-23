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
  List<dynamic>? results;

  StoryForYouResponse({
    this.count,
    this.results,
  });

  factory StoryForYouResponse.fromJson(Map<String, dynamic> json) =>
      StoryForYouResponse(
        count: json["count"],
        results: json["results"],
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "results": results,
      };
}
