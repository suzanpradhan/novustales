import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:storyv2/old/constants/app_color.dart';
import 'package:storyv2/old/constants/font_size.dart';
import 'package:storyv2/old/network/api_response.dart';
import 'package:storyv2/old/routes/route_name.dart';
import 'package:storyv2/old/screens/premium/cusWidgets/circular_loading.dart';
import 'package:storyv2/old/screens/premium/models/user_detail_model.dart';
import 'package:storyv2/old/screens/premium/models/war_model.dart';
import 'package:storyv2/old/screens/premium/parameters/war_param.dart';
import 'package:storyv2/old/screens/premium/repositories/premium_repo.dart';
import 'package:storyv2/old/screens/premium/utils/int_extension.dart';
import 'package:storyv2/old/screens/premium/cusWidgets/cus_icon_button.dart';
import 'package:storyv2/old/screens/premium/cusWidgets/outlined_button.dart';
import 'package:storyv2/old/screens/premium/widget/story_submission.dart';
import 'package:storyv2/old/screens/premium/widget/top_notification_bar.dart';
import '../../helper/overlay_notification.dart';
import 'cusWidgets/image_builder.dart';
import 'providers/war_view_model.dart';

class CommunityWars extends StatefulWidget {
  final WarParam prm;
  const CommunityWars({super.key, required this.prm});

  @override
  State<CommunityWars> createState() => _CommunityWarsState();
}

class _CommunityWarsState extends State<CommunityWars> {
  late WarViewModel warModel;
  late WarModel war;
  final premiumRepo = PremiumRepo();
  bool submissionLoading = true;
  UserDetailModel? winner;
  ValueNotifier<bool> followed = ValueNotifier<bool>(false);

  @override
  void initState() {
    super.initState();
    getWarSubmissions();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TopNotificationBar(showBackButton: false),
              Container(
                margin: EdgeInsets.only(
                    top: 10.pH, bottom: 20.pH, left: 20.pW, right: 20.pW),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ImageBuilder(
                      width: 150.pW,
                      height: 230.pH,
                      fit: BoxFit.cover,
                      imageUrl: war.thumbnailUrl,
                    ),
                    SizedBox(width: 15.pW),
                    Flexible(
                      child: SizedBox(
                        height: 230.pH,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              war.title,
                              style:
                                  TextStyle(color: white, fontSize: sfont_12),
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(vertical: 20.pH),
                              child: Row(
                                children: [
                                  Text(
                                    "${war.totalViews.view()} views",
                                    style: TextStyle(
                                        color: white, fontSize: sfont_12),
                                  ),
                                  SizedBox(width: 25.pW),
                                  Text(
                                    "20k Followers",
                                    style: TextStyle(
                                        color: white, fontSize: sfont_12),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 4),
                              decoration: BoxDecoration(
                                color: grey1,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Text(
                                war.categoryName,
                                style:
                                    TextStyle(color: white, fontSize: sfont_12),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                margin: EdgeInsets.symmetric(vertical: 15.pH),
                                child: Text(
                                  war.description,
                                  overflow: TextOverflow.ellipsis,
                                  softWrap: true,
                                  maxLines: 3,
                                  style: TextStyle(
                                      color: grey2, fontSize: sfont_12),
                                ),
                              ),
                            ),
                            if (winner == null)
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  ValueListenableBuilder<bool>(
                                      valueListenable: followed,
                                      builder: (context, value, child) {
                                        return CusOutB(
                                          onPressed: () {
                                            String msg = followed.value
                                                ? "Unfollowed"
                                                : "Followed";
                                            showTopOverlayNotification(
                                                title: msg);

                                            followed.value = !followed.value;
                                            premiumRepo.toggleFollow(
                                                war.id.toString());
                                          },
                                          backgroundColor: storyBrown,
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          padding: EdgeInsets.symmetric(
                                              vertical: 10, horizontal: 15),
                                          text: value ? "Unfollow" : "Follow",
                                          textStyle: TextStyle(
                                              color: white, fontSize: sfont_12),
                                        );
                                      }),
                                  CusOutB(
                                    onPressed: () => Navigator.pushNamed(
                                      context,
                                      routeAddWarPost,
                                      arguments: war,
                                    ),
                                    backgroundColor: storyBrown,
                                    borderRadius: BorderRadius.circular(8),
                                    padding: EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 15),
                                    text: "Add post",
                                    textStyle: TextStyle(
                                        color: white, fontSize: sfont_12),
                                  ),
                                  CusIconBtn(
                                    onPressed: () => Navigator.pushNamed(
                                      context,
                                      routePendingSubmissions,
                                      arguments: war,
                                    ),
                                    icon: Icon(Icons.settings, color: white),
                                  )
                                ],
                              )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              if (winner != null)
                Container(
                  margin: EdgeInsets.only(top: 30.pH),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.pushNamed(
                          context,
                          routeUserProfile,
                          arguments: winner!.id.toString(),
                        ),
                        child: ImageBuilder(
                          height: 30.pW,
                          width: 30.pW,
                          imageUrl: winner!.avatar,
                          circular: true,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(width: 5),
                      Text(
                        winner!.name,
                        style: TextStyle(color: white),
                      ),
                      SizedBox(width: 8),
                      Text(
                        "🏆 Winner",
                        style: TextStyle(color: storyBrown),
                      )
                    ],
                  ),
                ),
              Container(
                margin:
                    EdgeInsets.symmetric(horizontal: 20.pW, vertical: 30.pH),
                child: Text(
                  "Videos",
                  style: TextStyle(
                    color: white,
                    fontSize: sfont_16,
                    decoration: TextDecoration.underline,
                    decorationColor: white,
                  ),
                ),
              ),
              if (submissionLoading)
                Loading()
              else
                Container(
                  margin: EdgeInsets.only(
                    left: 20.pW,
                    right: 20.pW,
                    bottom: 20.pH,
                  ),
                  child: Wrap(
                    spacing: 20.pW,
                    runSpacing: 20.pW,
                    children: List.generate(
                      war.submissions.length,
                      (index) {
                        final sub = war.submissions[index];
                        return StorySubmission(
                            submission: sub.setWarID(war.id));
                      },
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  getWarSubmissions() async {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final warModel = Provider.of<WarViewModel>(context, listen: false);
      followed.value =
          warModel.followedWars.indexWhere((element) => element.id == war.id) !=
              -1;
    });

    war = widget.prm.war;
    if (war.submissions.isNotEmpty) {
      for (final sub in war.submissions) {
        if (sub.isWinner) return setState(() => winner = sub.story.userDetails);
      }
      return setState(() => submissionLoading = false);
    }

    final res = await premiumRepo.getWarDetail("${war.id}");
    if (res.status == Status.COMPLETED) {
      war = res.data!;
    }

    setState(() => submissionLoading = false);

    for (final sub in war.submissions) {
      if (sub.isWinner) return setState(() => winner = sub.story.userDetails);
    }
  }
}
