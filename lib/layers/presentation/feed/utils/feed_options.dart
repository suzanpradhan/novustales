import 'package:flutter/material.dart';
import 'package:storyv2/core/constants/app_icons.dart';

class FeedOptions {
  final String title;
  final IconData icon;
  const FeedOptions({
    required this.title,
    required this.icon,
  });
}

List<FeedOptions> feedOptions = const [
  FeedOptions(
    title: "Like",
    icon: AppIcons.heart,
  ),
  FeedOptions(
    title: "Share",
    icon: AppIcons.heart,
  ),
  FeedOptions(
    title: "Send",
    icon: AppIcons.heart,
  ),
  FeedOptions(
    title: "Options",
    icon: AppIcons.heart,
  ),
];
