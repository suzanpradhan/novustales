import 'user_detail_model.dart';

class StoryModel {
  final int id;
  final UserDetailModel userDetails;
  final String category;
  final int views;
  final String title;
  final String mediaUrls;
  final StoryMediaType mediaType;

  const StoryModel({
    required this.id,
    required this.userDetails,
    required this.category,
    required this.views,
    required this.title,
    required this.mediaUrls,
    required this.mediaType,
  });

  static StoryMediaType getMediaType(String url) {
    final sub = url.split(".");
    if (sub.isEmpty) return StoryMediaType.unknown;
    if (["jpeg", "png", "jpg"].contains(sub.last)) return StoryMediaType.image;
    if (["mp4", "mkv"].contains(sub.last)) return StoryMediaType.video;
    return StoryMediaType.unknown;
  }

  factory StoryModel.fromJson(Map<String, dynamic> json) => StoryModel(
        id: json["id"],
        userDetails: UserDetailModel.fromJson(json["user_details"]),
        category: json["category"],
        views: json["views"],
        title: json["title"],
        mediaUrls: json["media_urls"] ?? "",
        mediaType: getMediaType(json["media_urls"] ?? ""),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_details": userDetails.toJson(),
        "category": category,
        "views": views,
        "title": title,
        "media_urls": mediaUrls,
      };
}

enum StoryMediaType {
  image,
  video,
  unknown,
}
