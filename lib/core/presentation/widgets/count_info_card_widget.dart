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
            color: AppColors.purpleAccent.withOpacity(0.1)),
        width: double.maxFinite,
        height: 75,
        padding: EdgeInsets.all(UIConstants.minPadding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              text1,
              style: Theme.of(context).textTheme.displayLarge!.copyWith(
                    fontFamily: "UberBold",
                    color: AppColors.black,
                  ),
            ),
            Gapper.v2xmGap(),
            Text(
              text2,
              style: Theme.of(context).textTheme.labelSmall!.copyWith(
                    fontFamily: "UberMedium",
                    color: AppColors.black.withOpacity(.6),
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
