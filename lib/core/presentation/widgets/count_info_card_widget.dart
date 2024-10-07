import 'package:flutter/material.dart';
import 'package:storyv2/core/constants/ui_constants.dart';

import '../../constants/app_colors.dart';
import '../ui/spacer.dart';

class CountInfoCardWidget extends StatelessWidget {
  const CountInfoCardWidget({
    super.key,
    required this.text1,
    required this.text2,
  });
  final String text1;
  final String text2;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(UIConstants.minBorderRadius),
            color: AppColors.greyAccent),
        width: double.maxFinite,
        height: 80,
        padding: EdgeInsets.all(UIConstants.minPadding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              text1,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(fontSize: 18),
            ),
            Gapper.v2xmGap(),
            Text(text2, style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
      ),
    );
  }
}
