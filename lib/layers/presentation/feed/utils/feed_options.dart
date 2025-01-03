import 'package:flutter/material.dart';
import 'package:storyv2/core/constants/app_icons.dart';
import 'package:storyv2/layers/presentation/feed/utils/kwargs.dart';

class FeedOptions {
  final String title;
  final IconData icon;
  final Function? actions;
  final Kwargs? kwargs;
  const FeedOptions({
    required this.title,
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
