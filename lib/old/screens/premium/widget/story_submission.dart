import 'package:flutter/material.dart';
import 'package:storyv2/old/constants/app_color.dart';
import 'package:storyv2/old/routes/route_name.dart';
import 'package:storyv2/old/screens/premium/models/submission_model.dart';
import 'package:storyv2/old/screens/premium/utils/int_extension.dart';
import 'package:storyv2/old/screens/premium/utils/injection.dart';

import '../../../constants/font_size.dart';
import '../cusWidgets/image_builder.dart';

class StorySubmission extends StatefulWidget {
  final SubmissionModel submission;
  const StorySubmission({super.key, required this.submission});

  @override
  State<StorySubmission> createState() => _StorySubmissionState();
}

class _StorySubmissionState extends State<StorySubmission> {
  late final SubmissionModel submission;
  late final String mediaUrl;
  late final String view;
  late final String avatar;
  bool isImage = true;
  final isPlaying = ValueNotifier(false);

  @override
  void initState() {
    super.initState();
    initStory();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(10),
      onTap: () => Navigator.pushNamed(
        context,
        routeBattleDetailed,
        arguments: submission,
      ),
      child: Container(
        width: (sCon.width - 80.pW) / 3,
        height: (sCon.width - 80.pW) / 2,
        decoration: BoxDecoration(
          border: Border.all(color: white),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            ImageBuilder(
              height: double.maxFinite,
              width: double.maxFinite,
              fit: BoxFit.cover,
              borderRadius: BorderRadius.circular(10),
              imageUrl: mediaUrl,
              showErrorBorder: false,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 5, top: isImage ? 5 : 0),
                      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                      decoration: BoxDecoration(
                        color: black.withOpacity(.5),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CircleAvatar(radius: 5, backgroundColor: solidRed2),
                          SizedBox(width: 5),
                          Text(view,
                              style:
                                  TextStyle(color: white, fontSize: sfont_10)),
                        ],
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.all(5),
                  child: Row(
                    children: [
                      ImageBuilder(
                        width: 30.pW,
                        height: 30.pW,
                        fit: BoxFit.cover,
                        circular: true,
                        imageUrl: avatar,
                      ),
                      SizedBox(width: 5),
                      Flexible(
                        child: Text(
                          submission.story.userDetails.name,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(color: white, fontSize: sfont_8),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  initStory() {
    submission = widget.submission;
    mediaUrl = widget.submission.thumbnailUrl;
    avatar = "http://viewtoryapp.com${submission.story.userDetails.avatar}";
    view = submission.story.views.view();
  }
}
