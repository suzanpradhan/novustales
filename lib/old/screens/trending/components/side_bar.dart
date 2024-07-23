import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:provider/provider.dart';
import 'package:storyv2/old/providers/comment_view_model.dart';
import 'package:storyv2/old/providers/story_view_model.dart';

import '../../../config/api_response_config.dart';
import '../../../constants/app_color.dart';
import '../../../constants/app_image.dart';
import '../../../helper/dyamic_link_service.dart';
import '../../../providers/coin_view_model.dart';
import '../../chat/group/create_group_screen.dart';
import '../../chat/request/chat_request_screen.dart';
import 'comment_sheet.dart';

class SideBar extends StatefulWidget {
  String storyId;
  String? userId;
  SideBar({super.key, required this.storyId, this.userId});

  @override
  State<SideBar> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  @override
  Widget build(BuildContext context) {
    return Consumer3<StoryViewModel, CommentViewModel, CoinViewModel>(
        builder: (context, story, commentApi, coinApi, chid) {
      return Padding(
        padding: const EdgeInsets.only(right: 10.0, bottom: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            _sideBarItem(Icons.star, "", onDoubleTab: () async {
              await coinApi
                  .transferCoinU(1, widget.userId.toString())
                  .then((_) {
                coinApi.fetchOwnCoins();
              });
            }, onTap: null),
            _sideBarItem(
                Icons.message,
                isLoading(commentApi.allCommentApiResponse)
                    ? ""
                    : commentApi.totalComment.toString(), onTap: () {
              commentApi.fetchAllComment(widget.storyId.toString());
              commentSheet(story, context, widget.storyId.toString());
              print("STORY ID::${widget.storyId}");
            }),
            _sideBarItem(Icons.reply, "Share", onTap: () async {
              String deepLink =
                  await FirebaseDynamicLinkService.createReferralLink(
                      true, widget.storyId);

              await FlutterShare.share(
                title: 'Share Story',
                linkUrl: deepLink,
              );
            }),
            PopupMenuButton<int>(
              onSelected: (item) async {
                if (item == 1) {
                  Navigator.pushNamed(context, ChatRequestScreen.routeName);
                } else if (item == 2) {
                  Navigator.pushNamed(context, CreateChatGroupScreen.routeName,
                      arguments: "${widget.userId}");
                }
              },
              itemBuilder: (context2) => [
                PopupMenuItem(
                  onTap: () async {},
                  value: 1,
                  child: Row(
                    children: [
                      Image.asset(
                        kUserAdd,
                        height: 25,
                        width: 25,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text("Request DM")
                    ],
                  ),
                ),
                const PopupMenuItem(
                  value: 2,
                  child: Row(
                    children: [
                      Icon(Icons.group),
                      SizedBox(
                        width: 10,
                      ),
                      Text("Create group")
                    ],
                  ),
                ),
              ],
              offset: const Offset(-30, -100),
              color: const Color(0xffF1F1F1),
              elevation: 2,
              child: Icon(Icons.more_horiz, size: 27, color: secondaryColor),
            ),
            Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  height: 30,
                  width: 30,
                  child: Image.asset(appLogo),
                ),
                CircleAvatar(
                  radius: 12,
                  backgroundImage: AssetImage(appLogo),
                )
              ],
            )
          ],
        ),
      );
    });
  }

  _sideBarItem(IconData icon, String label,
      {Function()? onTap, Function()? onDoubleTab}) {
    return GestureDetector(
      onTap: onTap,
      onDoubleTap: onDoubleTab,
      child: Column(
        children: [
          Icon(
            icon,
            color: white,
            shadows: const [
              Shadow(
                color: Colors.black,
                offset: Offset(0, 5),
                blurRadius: 8,
              ),
            ],
            size: 27,
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            label,
            style: const TextStyle(color: white, shadows: [
              Shadow(
                color: Colors.black,
                offset: Offset(0, 5),
                blurRadius: 8,
              ),
            ]),
          ),
        ],
      ),
    );
  }

  _profileImageButton() {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
              border: Border.all(color: white),
              borderRadius: BorderRadius.circular(25),
              image: DecorationImage(image: AssetImage(appLogo))),
        ),
        Positioned(
            bottom: -10,
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.red, borderRadius: BorderRadius.circular(25)),
              child: const Icon(
                Icons.add,
                color: white,
                size: 20,
              ),
            ))
      ],
    );
  }
}
