import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:storyv2/core/constants/ui_constants.dart';

import '../../../../core/constants/app_colors.dart';

class CommentCardShimmer extends StatelessWidget {
  const CommentCardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.grayDark.withOpacity(0.2),
      highlightColor: AppColors.greyWhite.withOpacity(0.5),
      period: const Duration(milliseconds: 1500), // Adjust speed
      child: Container(
        margin: EdgeInsets.symmetric(vertical: UIConstants.xminPadding),
        width: double.infinity,
        height: 40.0,
        decoration: BoxDecoration(
          color: AppColors.grayDark,
          borderRadius: BorderRadius.circular(8.0), // Consistent radius
        ),
      ),
    );
  }
}
