import 'package:flutter/material.dart';
import 'package:storyv2/core/constants/app_icons.dart';
import 'package:storyv2/layers/presentation/feed/utils/kwargs.dart';

import '../../../../core/constants/app_colors.dart';
import '../widgets/comment_modal_bottom_sheet.dart';

class FeedOptions {
  final String title;
  final IconData icon;
  final Function? actions;
  final Kwargs? kwargs;
  final BuildContext? context;
  const FeedOptions({
    required this.title,
    this.context,
    required this.icon,
    this.actions,
    this.kwargs,
  });
}

List<FeedOptions> feedOptions = [
  FeedOptions(
    title: "Like",
    icon: AppIcons.heart,
  ),
  FeedOptions(
    title: "Comment",
    icon: AppIcons.comment,
    actions: ((Kwargs kwargs) {
      showModalBottomSheet(
          useSafeArea: true,
          context: kwargs.data['context'],
          backgroundColor: AppColors.white,
          isScrollControlled: true,
          enableDrag: true,
          useRootNavigator: true,
          isDismissible: true,
          builder: (context) {
            return kwargs.data['storyId'] != null
                ? CommentModalBottomSheet(
                    storyId: kwargs.data['storyId'],
                  )
                : SizedBox();
          });
    }),
  ),
  FeedOptions(
    title: "Share",
    icon: AppIcons.shareSocial,
    actions: ((Kwargs kwargs) async {
      // await FlutterShare.share(
      //   title: kwargs.data['title'],
      //   text: kwargs.data['title'],
      //   linkUrl: kwargs.data['link'],
      //   chooserTitle: 'Share',
      // );
    }),
  ),
  FeedOptions(
    title: "Send",
    icon: AppIcons.sharePlane,
  ),
  FeedOptions(
    title: "Options",
    icon: AppIcons.options,
  ),
];
