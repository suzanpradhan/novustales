import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:storyv2/old/network/repo/story_repo.dart';

import '../../../config/api_response_config.dart';
import '../../../constants/app_color.dart';
import '../../../helper/overlay_notification.dart';
import '../../../model/response/comment_response.dart';
import '../../../providers/auth_view_model.dart';
import '../../../providers/comment_view_model.dart';
import '../../../providers/story_view_model.dart';
import '../../../widgets/calculate_time_difference.dart';
import '../../../widgets/entry_field.dart';

void commentSheet(
    StoryViewModel model, BuildContext context, String storyId) async {
  TextEditingController commentController = TextEditingController();

  bool isloading = false;
  String replyToUser = "";
  String commentIdToReply = "";
  bool viewReplies = false;
  int replyCommentIndex = 0;

  await showModalBottomSheet(
    enableDrag: false,
    isScrollControlled: true,
    backgroundColor: backgroundColor,
    shape: const OutlineInputBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
      borderSide: BorderSide.none,
    ),
    context: context,
    builder: (context) => StatefulBuilder(builder: (context, setState) {
      return Consumer2<CommentViewModel, AuthViewModel>(
        builder: (context, commentApi, authApi, child) {
          Future.delayed(Duration.zero, () {
            model.updateIsCommentTapped(true);
          });
          return KeyboardVisibilityBuilder(
              builder: (context, isKeyboardVisible) {
            return SizedBox(
              height: isKeyboardVisible ? 1000 : 500.0,
              child: SingleChildScrollView(
                reverse: true,
                child: Container(
                  padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      SizedBox(
                        height: isKeyboardVisible ? 500 : 400,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.all(5.0),
                              child: Row(
                                children: [
                                  viewReplies == true
                                      ? IconButton(
                                          onPressed: () {
                                            setState(() {
                                              viewReplies = false;
                                            });
                                          },
                                          icon: Icon(
                                            Icons.arrow_back_ios_new,
                                            color: lightTextColor,
                                            size: 20,
                                          ))
                                      : SizedBox(),
                                  Center(
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: Text(
                                        "Comments",
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium
                                            ?.copyWith(color: lightTextColor),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            isLoading(commentApi.allCommentApiResponse)
                                ? const Center(
                                    child: CircularProgressIndicator())
                                : commentApi.allComment.isEmpty
                                    ? const Center(
                                        child: Text(
                                        "No Comments",
                                        style: TextStyle(color: Colors.white),
                                      ))
                                    : viewReplies == true
                                        ? Expanded(
                                            child: Builder(builder: (context) {
                                              final datas =
                                                  commentApi.allComment[
                                                      replyCommentIndex];
                                              return SingleChildScrollView(
                                                child: Container(
                                                  // height: 300,
                                                  child: Column(
                                                    children: <Widget>[
                                                      Divider(
                                                        color: darkColor,
                                                        thickness: 1,
                                                      ),
                                                      singleUserComment(
                                                        likeCommentFunc: () {
                                                          commentApi
                                                              .postLikeComment(
                                                                  datas.id
                                                                      .toString());

                                                          commentApi
                                                              .toggleLikeComment(
                                                                  datas.id
                                                                      .toString());

                                                          // commentApi
                                                          //     .commentLikeFunc();
                                                        },
                                                        commentApi: commentApi,
                                                        secondReplyCheck: false,
                                                        borderRadiusClipRRect:
                                                            60,
                                                        userImageHeightSize:
                                                            double.maxFinite,
                                                        userImageWidthSize:
                                                            double.infinity,
                                                        isReplyClicked: true,
                                                        context: context,
                                                        datas: commentApi
                                                                .allComment[
                                                            replyCommentIndex],
                                                        replyFunc: () {
                                                          setState(() {
                                                            replyToUser = datas
                                                                .userDetails!
                                                                .name
                                                                .toString();
                                                            commentIdToReply =
                                                                datas.id
                                                                    .toString();
                                                            print(
                                                                " Inner OUTER INDEX COMMENT:::${datas.id.toString()}");
                                                          });
                                                        },
                                                        viewReplyFunc: () {
                                                          setState(() {
                                                            datas.children!
                                                                    .isNotEmpty
                                                                ? viewReplies =
                                                                    true
                                                                : viewReplies =
                                                                    false;
                                                          });
                                                        },
                                                      ),

                                                      // inner reply comment box
                                                      Container(
                                                        // height: 500,
                                                        child: ListView.builder(
                                                            shrinkWrap: true,
                                                            physics:
                                                                NeverScrollableScrollPhysics(),
                                                            // physics:
                                                            //     ScrollPhysics(),
                                                            padding:
                                                                EdgeInsets.only(
                                                                    bottom:
                                                                        60.0,
                                                                    left: 40),
                                                            itemCount: commentApi
                                                                .allComment[
                                                                    replyCommentIndex]
                                                                .children
                                                                ?.length,
                                                            itemBuilder:
                                                                (context,
                                                                    innerIndex) {
                                                              final childrenData = commentApi
                                                                      .allComment[
                                                                          replyCommentIndex]
                                                                      .children![
                                                                  innerIndex];
                                                              return Column(
                                                                children: <Widget>[
                                                                  Divider(
                                                                    color:
                                                                        darkColor,
                                                                    thickness:
                                                                        1,
                                                                  ),
                                                                  singleUserComment(
                                                                    likeCommentFunc:
                                                                        () {
                                                                      commentApi.postLikeComment(
                                                                          childrenData
                                                                              .id
                                                                              .toString());
                                                                      commentApi.toggleLikeComment(
                                                                          childrenData
                                                                              .id
                                                                              .toString());
                                                                      //
                                                                      // commentApi.commentLikeFunc();
                                                                    },
                                                                    commentApi:
                                                                        commentApi,
                                                                    secondReplyCheck:
                                                                        true,
                                                                    borderRadiusClipRRect:
                                                                        60,
                                                                    userImageHeightSize:
                                                                        30,
                                                                    userImageWidthSize:
                                                                        30,
                                                                    isReplyClicked:
                                                                        true,
                                                                    context:
                                                                        context,
                                                                    datas:
                                                                        childrenData,
                                                                    replyFunc:
                                                                        () {
                                                                      setState(
                                                                          () {
                                                                        replyToUser = childrenData
                                                                            .userDetails!
                                                                            .name
                                                                            .toString();
                                                                        commentIdToReply = childrenData
                                                                            .id
                                                                            .toString();
                                                                        print(
                                                                            "INNER INDEX COMMENT:::${childrenData.id.toString()}");
                                                                      });
                                                                    },
                                                                    viewReplyFunc:
                                                                        () {
                                                                      setState(
                                                                          () {
                                                                        childrenData.children!.isNotEmpty
                                                                            ? viewReplies =
                                                                                true
                                                                            : viewReplies =
                                                                                false;
                                                                        replyCommentIndex =
                                                                            innerIndex;
                                                                      });
                                                                    },
                                                                  )
                                                                ],
                                                              );
                                                            }),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              );
                                            }),
                                          )
                                        : Expanded(
                                            child: SizedBox(
                                              height: 500,
                                              child: ListView.builder(
                                                  shrinkWrap: true,
                                                  physics:
                                                      BouncingScrollPhysics(),
                                                  padding: EdgeInsets.only(
                                                      bottom: 60.0),
                                                  itemCount: commentApi
                                                      .allComment.length,
                                                  itemBuilder:
                                                      (context, index) {
                                                    final datas = commentApi
                                                        .allComment[index];
                                                    return Column(
                                                      children: <Widget>[
                                                        Divider(
                                                          color: darkColor,
                                                          thickness: 1,
                                                        ),
                                                        singleUserComment(
                                                          likeCommentFunc: () {
                                                            commentApi
                                                                .postLikeComment(
                                                                    datas.id
                                                                        .toString());

                                                            // commentApi
                                                            //     .commentLikeFunc();
                                                            commentApi
                                                                .toggleLikeComment(
                                                                    datas.id
                                                                        .toString());
                                                          },
                                                          commentApi:
                                                              commentApi,
                                                          secondReplyCheck:
                                                              false,
                                                          borderRadiusClipRRect:
                                                              60,
                                                          userImageHeightSize:
                                                              double.maxFinite,
                                                          userImageWidthSize:
                                                              double.infinity,
                                                          isReplyClicked: false,
                                                          context: context,
                                                          datas: commentApi
                                                                  .allComment[
                                                              index],
                                                          replyFunc: () {
                                                            setState(() {
                                                              replyToUser = datas
                                                                  .userDetails!
                                                                  .name
                                                                  .toString();
                                                              commentIdToReply =
                                                                  datas.id
                                                                      .toString();
                                                            });
                                                          },
                                                          viewReplyFunc: () {
                                                            setState(() {
                                                              datas.children!
                                                                      .isNotEmpty
                                                                  ? viewReplies =
                                                                      true
                                                                  : viewReplies =
                                                                      false;
                                                              replyCommentIndex =
                                                                  index;
                                                            });
                                                          },
                                                        )
                                                      ],
                                                    );
                                                  }),
                                            ),
                                          )
                          ],
                        ),
                      ),
                      // beginOffset: Offset(0, 0.3),
                      // endOffset: Offset(0, 0),
                      // slideCurve: Curves.linearToEaseOut,

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          // FadedSlideAnimation(
                          replyToUser == ""
                              ? SizedBox()
                              : Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Replying to $replyToUser",
                                        style: TextStyle(color: lightTextColor),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            replyToUser = "";
                                          });
                                        },
                                        child: Icon(
                                          Icons.close,
                                          color: lightTextColor,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                          // beginOffset: Offset(0, 0.3),
                          // endOffset: Offset(0, 0),
                          // slideCurve: Curves.linearToEaseOut,

                          EntryField(
                            counter: null,
                            controller: commentController,
                            padding: EdgeInsets.zero,
                            hint: "Write Your Comment",
                            fillColor: darkColor,
                            prefix: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16.0, vertical: 8.0),
                              child: CircleAvatar(
                                radius: 16,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: CachedNetworkImage(
                                    fit: BoxFit.cover,
                                    height: double.maxFinite,
                                    width: double.infinity,
                                    imageUrl:
                                        authApi.userData["avatar"].toString(),
                                    placeholder: (context, url) => const Center(
                                        child: CircularProgressIndicator(
                                      color: white,
                                    )),
                                    errorWidget: (context, url, error) =>
                                        const ImageIcon(
                                            size: 10,
                                            AssetImage(
                                              'assets/icons/ic_profile.png',
                                            )),
                                  ),
                                ),
                              ),
                            ),
                            suffixIcon: InkWell(
                              onTap: () async {
                                print("BUTTON CLICKED::$storyId");
                                setState(() {
                                  isloading = true;
                                });
                                if (commentController.text == "" ||
                                    commentController.text.isEmpty) {
                                  setState(() {
                                    isloading = false;
                                  });
                                  showTopOverlayNotificationError(
                                      title: "Please enter comment.");
                                } else {
                                  try {
                                    Map<String, dynamic> request = {
                                      "content": commentController.text,
                                    };

                                    if (replyToUser != null ||
                                        replyToUser != "" ||
                                        commentIdToReply != "") {
                                      // If replying to a specific user, set the "reply_to" field
                                      request["parent_id"] = commentIdToReply;
                                    }

                                    var response = await StoryRepo()
                                        .saveSingleStoryComment(
                                            request, storyId);
                                    if (response["id"] != null &&
                                        context.mounted) {
                                      // Navigator.pop(context);
                                      setState(() {
                                        isloading = false;
                                      });
                                      commentApi
                                          .fetchAllComment(storyId.toString());

                                      commentController.clear();
                                      showTopOverlayNotification(
                                        title: "Success",
                                      );
                                    } else {
                                      setState(() {
                                        isloading = false;
                                      });
                                      showTopOverlayNotificationError(
                                        title: "Failed",
                                      );
                                    }
                                  } catch (e) {
                                    setState(() {
                                      isloading = false;
                                    });
                                    showTopOverlayNotificationError(
                                      title: e.toString(),
                                    );
                                  }
                                }
                              },
                              child: isloading == true
                                  ? Transform.scale(
                                      scale:
                                          0.4, // Adjust the scale factor as needed
                                      child: CircularProgressIndicator(
                                        strokeWidth: 2,
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                                mainColor),
                                      ),
                                    )
                                  : Icon(
                                      Icons.send,
                                      color: mainColor,
                                    ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          });
        },
      );
    }),
  );
  model.updateIsCommentTapped(false);
}

Widget singleUserComment({
  required BuildContext context,
  required CommentResponse datas,
  required bool isReplyClicked,
  required VoidCallback replyFunc,
  required VoidCallback viewReplyFunc,
  required VoidCallback likeCommentFunc,
  required double userImageHeightSize,
  required double userImageWidthSize,
  required double borderRadiusClipRRect,
  required bool secondReplyCheck,
  // required bool isCommetLiked,
  required CommentViewModel commentApi,
}) {
  String decodeEmojiText(String encodedText) {
    return utf8.decode(encodedText.runes.toList());
  }

  return ListTile(
    leading: CircleAvatar(
      backgroundColor: Colors.transparent,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadiusClipRRect),
        clipBehavior: Clip.antiAlias,
        child: CachedNetworkImage(
          fit: BoxFit.cover,
          height: userImageHeightSize,
          width: userImageWidthSize,
          imageUrl:
              "http://brain.novutales.com${datas.userDetails!.avatar.toString()}",
          placeholder: (context, url) => const Center(
              child: CircularProgressIndicator(
            color: white,
          )),
          errorWidget: (context, url, error) =>
              const ImageIcon(AssetImage('assets/icons/ic_profile.png')),
        ),
      ),
    ),
    title: Row(
      children: [
        Text(
            datas.userDetails == null
                ? "N/A"
                : datas.userDetails!.name.toString(),
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(height: 2, color: Colors.white)),
        const SizedBox(
          width: 7,
        ),
        Text(calculateTimeDifference(datas.createdAt.toString()),
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(height: 2, color: lightTextColor)),
      ],
    ),
    subtitle: Builder(builder: (context) {
      final decodedEmoji = decodeEmojiText(datas.content.toString());
      return RichText(
        text: TextSpan(children: [
          TextSpan(
              text: "$decodedEmoji\n",
              style: TextStyle(fontWeight: FontWeight.normal)),
          !secondReplyCheck
              ? TextSpan(
                  recognizer: TapGestureRecognizer()..onTap = replyFunc,
                  text: "Reply\n",
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      height: 2, fontSize: 13, color: lightTextColor))
              : TextSpan(),
          datas.children!.isNotEmpty && !isReplyClicked && !secondReplyCheck
              ? WidgetSpan(
                  child: InkWell(
                    onTap: viewReplyFunc,
                    child: Text(
                      "      - View ${datas.children?.length} replies",
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            height: 2,
                            fontSize: 13,
                            color: lightTextColor,
                          ),
                    ),
                  ),
                )
              : WidgetSpan(child: SizedBox())
        ]),
      );
    }),
    trailing: InkWell(
      onTap: likeCommentFunc,
      child: ImageIcon(
        const AssetImage('assets/icons/ic_like.png'),
        color: commentApi.isCommentLiked(datas.id.toString())
            ? Colors.red
            : disabledTextColor,
      ),
    ),
  );
}
