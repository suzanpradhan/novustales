import 'package:storyv2/old/screens/premium/models/story_model.dart';
import 'package:video_player/video_player.dart';

class BDParam {
  final StoryModel story;
  final VideoPlayerController? videoController;

  const BDParam({
    required this.story,
    this.videoController,
  });
}
