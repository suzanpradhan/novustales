import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:storyv2/old/routes/route_name.dart';
import 'package:storyv2/old/screens/premium/cusWidgets/image_builder.dart';
import 'package:storyv2/old/screens/premium/models/war_model.dart';
import 'package:storyv2/old/screens/premium/parameters/war_param.dart';
import 'package:storyv2/old/screens/premium/providers/war_view_model.dart';
import 'package:storyv2/old/screens/premium/utils/int_extension.dart';

import 'package:storyv2/old/screens/premium/widget/top_notification_bar.dart';
import 'package:video_player/video_player.dart';

import '../../constants/app_color.dart';
import '../../constants/font_size.dart';
import '../../constants/font_weight.dart';
import '../../network/api_response.dart';
import 'cusWidgets/cus_video_player.dart';
import 'models/story_model.dart';
import 'parameters/battle_detailed_video_param.dart';
import 'repositories/premium_repo.dart';

class BattleOverview extends StatefulWidget {
  final WarParam prm;
  const BattleOverview({super.key, required this.prm});

  @override
  State<BattleOverview> createState() => _BattleOverviewState();
}

class _BattleOverviewState extends State<BattleOverview> {
  late WarModel war;
  final premiumRepo = PremiumRepo();
  bool submissionLoading = true;

  @override
  void initState() {
    super.initState();
    getWarSubmissions();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            if (submissionLoading)
              ImageBuilder(
                width: double.maxFinite,
                height: double.maxFinite,
                fit: BoxFit.cover,
                imageUrl: war.thumbnailUrl,
              )
            else
              Column(
                children: List.generate(
                  2,
                  (index) {
                    final submission = war.submissions[index];
                    final story = submission.story;
                    String avatar =
                        "http://viewtoryapp.com${story.userDetails.avatar}";
                    bool isImage = story.mediaType == StoryMediaType.image;

                    late Widget child;

                    if (isImage) {
                      child = InkWell(
                        onTap: () => Navigator.pushNamed(
                          context,
                          routeBattleDetailed,
                          arguments: submission,
                        ),
                        child: ImageBuilder(
                          width: double.maxFinite,
                          height: double.maxFinite,
                          fit: BoxFit.cover,
                          imageUrl: story.mediaUrls,
                        ),
                      );
                    } else {
                      final videoController =
                          VideoPlayerController.network(story.mediaUrls);

                      child = InkWell(
                        onTap: () {
                          if (!videoController.value.isInitialized) return;

                          Navigator.pushNamed(
                            context,
                            routeBattleDetailedVideo,
                            arguments: BDVParam(
                              videoController: videoController,
                              submission: submission,
                            ),
                          );
                        },
                        child: CusVideoPlayer(
                          width: double.maxFinite,
                          height: double.maxFinite,
                          controller: videoController,
                          showButton: true,
                        ),
                      );
                    }

                    Widget userDetails = Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ImageBuilder(
                          height: 50.pW,
                          width: 50.pW,
                          circular: true,
                          imageUrl: avatar,
                        ),
                        SizedBox(width: 10),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              story.userDetails.name,
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
                                Icon(
                                  Icons.remove_red_eye_rounded,
                                  color: storyTeal,
                                  size: 18,
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 5, right: 8),
                                  child: Text(
                                    story.views.view(),
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
                                    story.category,
                                    style: TextStyle(
                                        color: white, fontSize: sfont_10),
                                  ),
                                )
                              ],
                            ),
                          ],
                        )
                      ],
                    );

                    return Expanded(
                      child: Stack(
                        alignment: Alignment.bottomLeft,
                        children: [
                          child,
                          Padding(
                            padding: EdgeInsets.all(10),
                            child: userDetails,
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            TopNotificationBar(showBackButton: true),
          ],
        ),
      ),
    );
  }

  getWarSubmissions() async {
    war = widget.prm.war;
    if (war.submissions.isNotEmpty) {
      return setState(() => submissionLoading = false);
    }

    final res = await premiumRepo.getWarDetail("${war.id}");
    if (res.status == Status.COMPLETED) {
      war = res.data!;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        final warModel = Provider.of<WarViewModel>(context, listen: false);
        warModel.addSubmissions(
            type: widget.prm.type, warId: war.id, submissions: war.submissions);
      });
    }

    setState(() => submissionLoading = false);
  }
}
