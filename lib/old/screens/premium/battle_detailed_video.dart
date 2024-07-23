import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:storyv2/old/constants/app_color.dart';
import 'package:storyv2/old/constants/font_size.dart';
import 'package:storyv2/old/constants/font_weight.dart';
import 'package:storyv2/old/network/api_response.dart';
import 'package:storyv2/old/providers/story_view_model.dart';
import 'package:storyv2/old/screens/premium/models/submission_model.dart';
import 'package:storyv2/old/screens/premium/parameters/rate_param.dart';
import 'package:storyv2/old/screens/premium/repositories/premium_repo.dart';
import 'package:storyv2/old/screens/premium/utils/int_extension.dart';
import 'package:storyv2/old/screens/premium/cusWidgets/cus_icon_button.dart';
import 'package:storyv2/old/screens/premium/cusWidgets/image_builder.dart';
import 'package:storyv2/old/screens/premium/utils/injection.dart';

import 'package:storyv2/old/screens/premium/widget/top_notification_bar.dart';
import 'package:video_player/video_player.dart';

import '../trending/components/comment_sheet.dart';
import 'parameters/battle_detailed_video_param.dart';

class BattleDetailedVideo extends StatefulWidget {
  final BDVParam param;
  const BattleDetailedVideo({super.key, required this.param});

  @override
  State<BattleDetailedVideo> createState() => _BattleDetailedVideoState();
}

class _BattleDetailedVideoState extends State<BattleDetailedVideo> {
  final premiumRepo = PremiumRepo();
  late final SubmissionModel submission;
  late final VideoPlayerController videoController;
  ValueNotifier<int> rateByMe = ValueNotifier<int>(0);
  ValueNotifier<double> rating = ValueNotifier<double>(0);

  final showMore = ValueNotifier(false);

  @override
  void initState() {
    super.initState();
    initStory();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            InkWell(
              onTap: () => videoController.value.isPlaying
                  ? videoController.pause()
                  : videoController.play(),
              child: SizedBox(
                width: double.maxFinite,
                height: double.maxFinite,
                child: VideoPlayer(videoController),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TopNotificationBar(showBackButton: true),
                Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.pW, vertical: 20.pH),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ImageBuilder(
                            height: 50.pW,
                            width: 50.pW,
                            circular: true,
                            imageUrl: submission.story.userDetails.avatar,
                          ),
                          SizedBox(width: 10),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                submission.story.userDetails.name,
                                style: TextStyle(
                                  color: white,
                                  fontSize: sfont_14,
                                  fontWeight: kW6,
                                ),
                              ),
                              SizedBox(height: 5),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(Icons.remove_red_eye_rounded,
                                      color: storyTeal, size: 18),
                                  Container(
                                    margin: EdgeInsets.only(left: 5, right: 8),
                                    child: Text(
                                      submission.story.views.view(),
                                      style: TextStyle(
                                          color: storyTeal, fontSize: sfont_12),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 5, vertical: 3),
                                    decoration: BoxDecoration(
                                      color: storyBrown.withOpacity(.6),
                                      borderRadius: BorderRadius.circular(3),
                                    ),
                                    child: Text(
                                      submission.story.category,
                                      style: TextStyle(
                                          color: white, fontSize: sfont_10),
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                width: sCon.wP(.6),
                                child: ValueListenableBuilder(
                                  valueListenable: showMore,
                                  builder: (context, value, child) {
                                    return Wrap(
                                      crossAxisAlignment:
                                          WrapCrossAlignment.center,
                                      children: [
                                        Container(
                                          width: value ? null : sCon.wP(.4),
                                          margin: EdgeInsets.only(right: 5),
                                          child: Text(
                                            submission.story.title,
                                            overflow: value
                                                ? null
                                                : TextOverflow.ellipsis,
                                            softWrap: true,
                                            style: TextStyle(
                                                color: white,
                                                fontSize: sfont_12),
                                          ),
                                        ),
                                        TextButton(
                                          onPressed: () =>
                                              showMore.value = !showMore.value,
                                          style: TextButton.styleFrom(
                                            padding: EdgeInsets.zero,
                                            visualDensity: VisualDensity(
                                              horizontal: -4,
                                              vertical: -4,
                                            ),
                                          ),
                                          child: Text(
                                            value ? "See Less" : "See More...",
                                            style: TextStyle(
                                                color: grey2,
                                                fontSize: sfont_12),
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      Container(
                        height: sCon.hP(.35),
                        constraints: BoxConstraints(
                          minHeight: 165,
                          maxHeight: 200,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            PopupMenuButton(
                              icon: Column(
                                children: [
                                  ValueListenableBuilder<int>(
                                    valueListenable: rateByMe,
                                    builder: (context, value, child) {
                                      return Icon(
                                        Icons.star,
                                        color: value < 1 ? white : storyBrown,
                                        size: 22,
                                      );
                                    },
                                  ),
                                  SizedBox(height: 2),
                                  ValueListenableBuilder<double>(
                                    valueListenable: rating,
                                    builder: (context, value, child) {
                                      return Text(
                                        "${value == 0 ? 0 : value}",
                                        style: TextStyle(
                                            color: white, fontSize: sfont_14),
                                      );
                                    },
                                  ),
                                ],
                              ),
                              surfaceTintColor: grey_200,
                              color: grey_200,
                              itemBuilder: popupMenuItemBuilder,
                            ),
                            CusIconBtn(
                              onPressed: () {},
                              icon: FaIcon(FontAwesomeIcons.share,
                                  color: white, size: 22),
                            ),
                            CusIconBtn(
                              onPressed: () {
                                final storyViewModel =
                                    Provider.of<StoryViewModel>(context);
                                commentSheet(storyViewModel, context,
                                    "${submission.story.id}");
                              },
                              icon: Icon(Icons.chat_bubble_rounded,
                                  color: white, size: 22),
                            ),
                            CusIconBtn(
                              onPressed: () {},
                              icon: Icon(Icons.more_horiz_rounded,
                                  color: white, size: 22),
                            ),
                            CusIconBtn(
                              onPressed: () {},
                              icon: FaIcon(FontAwesomeIcons.compactDisc,
                                  color: white, size: 22),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  List<PopupMenuEntry<dynamic>> popupMenuItemBuilder(mCtx) {
    return [
      PopupMenuItem(
        height: 20,
        padding: EdgeInsets.symmetric(horizontal: 2),
        child: ValueListenableBuilder<int>(
          valueListenable: rateByMe,
          builder: (context, value, child) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(5, (index) {
                Color color = value >= index + 1 ? storyBrown : white;
                return CusIconBtn(
                  onPressed: submission.ratingByMe != 0
                      ? () {}
                      : () async {
                          rateByMe.value = index + 1;
                          await Future.delayed(Duration(milliseconds: 200));
                          if (mCtx.mounted) Navigator.pop(mCtx);

                          final prm = RatePrm(
                            warId: "${submission.warId}",
                            submissionId: "${submission.id}",
                            rating: "${rateByMe.value}",
                          );
                          final res = await premiumRepo.rateSubmission(prm);
                          if (res.status != Status.COMPLETED)
                            return rateByMe.value = 0;
                          rating.value = res.data!;
                        },
                  icon: Icon(Icons.star, color: color, size: 22),
                );
              }),
            );
          },
        ),
      ),
    ];
  }

  initStory() async {
    submission = widget.param.submission;
    videoController = widget.param.videoController;
    rateByMe.value = submission.ratingByMe.toInt();
    rating.value = submission.rating;
  }
}
