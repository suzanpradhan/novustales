import 'story_model.dart';

class SubmissionModel {
  final int id;
  final int warId;
  final bool isWinner;
  final bool isAccepted;
  final StoryModel story;
  final String thumbnailUrl;
  final double rating;
  final int ratingByMe;

  SubmissionModel({
    required this.id,
    required this.warId,
    required this.isWinner,
    required this.isAccepted,
    required this.story,
    required this.thumbnailUrl,
    required this.rating,
    required this.ratingByMe,
  });

  SubmissionModel setWarID(int newWarId) => SubmissionModel(
        id: id,
        warId: newWarId,
        isWinner: isWinner,
        isAccepted: isAccepted,
        story: story,
        thumbnailUrl: thumbnailUrl,
        rating: rating,
        ratingByMe: ratingByMe,
      );

  factory SubmissionModel.fromJson(Map<String, dynamic> json) => SubmissionModel(
        id: json["id"],
        warId: json["war_id"] ?? 0,
        isWinner: json["is_winner"],
        isAccepted: json["is_accepted"],
        story: StoryModel.fromJson(json["story"]),
        thumbnailUrl: json["thumbnail_url"] ?? "",
        rating: json["rating"] ?? 0,
        ratingByMe: json["rating_by_me"] ?? 0,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "war_id": warId,
        "is_winner": isWinner,
        "is_accepted": isAccepted,
        "story": story.toJson(),
        "thumbnail_url": thumbnailUrl,
        "rating": rating,
        "rating_by_me": ratingByMe,
      };
}
