import 'story_param.dart';

class SubmissionPrm {
  final StoryPrm story;
  final int warStory;
  final String thumbnailUrl;
  final int rating;

  SubmissionPrm({
    required this.story,
    required this.warStory,
    required this.thumbnailUrl,
    this.rating = 0,
  });

  Map<String, dynamic> toJson() => {
        "story": story.toJson(),
        "war_story": warStory,
        "thumbnail_url": thumbnailUrl,
        "rating": rating,
      };
}
