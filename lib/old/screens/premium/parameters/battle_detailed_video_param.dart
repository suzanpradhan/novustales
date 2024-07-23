import 'package:storyv2/old/screens/premium/models/submission_model.dart';
import 'package:video_player/video_player.dart';

class BDVParam {
  final VideoPlayerController videoController;
  final SubmissionModel submission;

  const BDVParam({required this.videoController, required this.submission});
}
