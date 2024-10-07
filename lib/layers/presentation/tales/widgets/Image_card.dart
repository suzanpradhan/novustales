import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:storyv2/core/constants/ui_constants.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/assets.dart';
import '../../../../core/presentation/ui/spacer.dart';

class ImageCard extends StatelessWidget {
  final String? name;
  final String cover;
  final double? height;
  final String? time;
  final String? count;
  const ImageCard(
      {super.key,
      required this.cover,
      this.name,
      this.height,
      this.count,
      this.time});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: height ?? 194,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(UIConstants.borderRadius),
            image: DecorationImage(
              image: AssetImage(cover),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          height: height ?? 194,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(UIConstants.borderRadius),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.transparent,
                AppColors.black.withOpacity(0.6),
              ],
            ),
          ),
        ),
        Positioned(
          top: 0,
          left: 0,
          child: Padding(
            padding: const EdgeInsets.all(UIConstants.padding),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(UIConstants.minBorderRadius),
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.white.withOpacity(.1),
                  borderRadius:
                      BorderRadius.circular(UIConstants.minBorderRadius),
                ),
                child: Gapper.card2xMinPadding(
                  child: Row(
                    children: [
                      Icon(
                        Icons.play_arrow_outlined,
                        size: 30,
                        color: AppColors.white,
                      ),
                      Gapper.h2xmGap(),
                      Text(
                        count ?? "",
                        style: Theme.of(context)
                            .textTheme
                            .headlineLarge!
                            .copyWith(
                                color: AppColors.white,
                                fontFamily: "UberMedium"),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          child: Padding(
            padding: const EdgeInsets.all(UIConstants.padding),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(UIConstants.minBorderRadius),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.white.withOpacity(.1),
                    borderRadius:
                        BorderRadius.circular(UIConstants.minBorderRadius),
                  ),
                  child: Gapper.card2xMinPadding(
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(
                              UIConstants.minBorderRadius),
                          child: Container(
                            width:
                                35, // Image size (should be slightly smaller than the outer border)
                            height: 35,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                  UIConstants.minBorderRadius),
                            ),
                            child: Image.asset(Assets.cel5, fit: BoxFit.cover),
                          ),
                        ),
                        Gapper.hGap(),
                        Padding(
                          padding: const EdgeInsets.only(
                              right: UIConstants.x2minPadding),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                name ?? "",
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineLarge!
                                    .copyWith(
                                        color: AppColors.white,
                                        fontFamily: "UberMedium"),
                              ),
                              Text(
                                time ?? "",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium!
                                    .copyWith(
                                        color: AppColors.white,
                                        fontFamily: "UberMedium"),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
