import 'package:flutter/material.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/constants/ui_constants.dart';
import '../../../../../core/presentation/ui/spacer.dart';
import '../../../../../core/presentation/widgets/simple_button.dart';
import '../ShiftableImageHolderWidget.dart';

class LeaderCardTabWidget extends StatefulWidget {
  const LeaderCardTabWidget({super.key});

  @override
  State<LeaderCardTabWidget> createState() => _LeaderCardTabWidgetState();
}

class _LeaderCardTabWidgetState extends State<LeaderCardTabWidget> {
  @override
  Widget build(BuildContext context) {
    return Gapper.screenPadding(
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius:
                    BorderRadius.circular(UIConstants.maxBordeRadius)),
            width: double.maxFinite,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Gapper.cardPadding(
                  child: Text(
                    "Leaderboard",
                    style: Theme.of(context).textTheme.displayLarge!.copyWith(
                          fontFamily: "UberMedium",
                          color: AppColors.black,
                        ),
                  ),
                ),
                Row(
                  children: [
                    ShiftableimageholderWidget(
                      imageSize: 70,
                      count: 2,
                      title: Text(
                        "Daniel Apodaca",
                        style: Theme.of(context).textTheme.labelLarge!.copyWith(
                              fontFamily: "UberBold",
                              color: AppColors.black,
                            ),
                      ),
                      mainAxisAlignment: MainAxisAlignment.end,
                      ringColor: AppColors.ringColorYellow,
                      dropShadow: AppColors.ringColorYellow.withOpacity(0.7),
                    ),
                    Gapper.h2xmGap(),
                    ShiftableimageholderWidget(
                      imageSize: 100,
                      count: 1,
                      title: Text(
                        "Chester Wade",
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              fontFamily: "UberBold",
                              color: AppColors.black,
                            ),
                      ),
                      mainAxisAlignment: MainAxisAlignment.center,
                    ),
                    Gapper.h2xmGap(),
                    ShiftableimageholderWidget(
                      imageSize: 70,
                      count: 3,
                      title: Text(
                        "Daniel Apodaca",
                        style: Theme.of(context).textTheme.labelLarge!.copyWith(
                              fontFamily: "UberBold",
                              color: AppColors.black,
                            ),
                      ),
                      mainAxisAlignment: MainAxisAlignment.end,
                      ringColor: AppColors.ringColorPink,
                      dropShadow: AppColors.ringColorPink.withOpacity(0.7),
                    ),
                  ],
                ),
                Gapper.cardPadding(
                  child: SimpleButton(
                    buttonLabel: "",
                    label: Text(
                      "Check all",
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontFamily: "UberBold",
                            color: AppColors.white,
                          ),
                    ),
                    isFilled: true,
                    fillColor: AppColors.purpleAccent,
                    alignment: MainAxisAlignment.center,
                    handleTap: () {},
                  ),
                ),
              ],
            ),
          ),
          Gapper.vGap(),
          Container(
            decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(UIConstants.borderRadius)),
            child: Gapper.cardPadding(
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: UIConstants.minPadding),
                    child: Text(
                      "4",
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            fontFamily: "UberBold",
                            color: AppColors.black,
                          ),
                    ),
                  ),
                  Expanded(
                      child: Text(
                    "Chester Wade",
                    style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                          fontFamily: "UberMedium",
                          color: AppColors.black,
                        ),
                  )),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: UIConstants.minPadding),
                    child: Text(
                      "203 EXP",
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            fontFamily: "UberRegular",
                            color: AppColors.purpleAccent,
                          ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Gapper.vGap(),
          Container(
            decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(UIConstants.borderRadius)),
            child: Gapper.cardPadding(
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: UIConstants.minPadding),
                    child: Text(
                      "5",
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            fontFamily: "UberBold",
                            color: AppColors.black,
                          ),
                    ),
                  ),
                  Expanded(
                      child: Text(
                    "Chester Wade",
                    style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                          fontFamily: "UberMedium",
                          color: AppColors.black,
                        ),
                  )),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: UIConstants.minPadding),
                    child: Text(
                      "203 EXP",
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            fontFamily: "UberRegular",
                            color: AppColors.purpleAccent,
                          ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Gapper.vGap(),
          Container(
            decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(UIConstants.borderRadius)),
            child: Gapper.cardPadding(
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: UIConstants.minPadding),
                    child: Text(
                      "6",
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            fontFamily: "UberBold",
                            color: AppColors.black,
                          ),
                    ),
                  ),
                  Expanded(
                      child: Text(
                    "Chester Wade",
                    style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                          fontFamily: "UberMedium",
                          color: AppColors.black,
                        ),
                  )),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: UIConstants.minPadding),
                    child: Text(
                      "203 EXP",
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            fontFamily: "UberRegular",
                            color: AppColors.purpleAccent,
                          ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Gapper.vGap(),
          Container(
            decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(UIConstants.borderRadius)),
            child: Gapper.cardPadding(
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: UIConstants.minPadding),
                    child: Text(
                      "7",
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            fontFamily: "UberBold",
                            color: AppColors.black,
                          ),
                    ),
                  ),
                  Expanded(
                      child: Text(
                    "Chester Wade",
                    style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                          fontFamily: "UberMedium",
                          color: AppColors.black,
                        ),
                  )),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: UIConstants.minPadding),
                    child: Text(
                      "203 EXP",
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            fontFamily: "UberRegular",
                            color: AppColors.purpleAccent,
                          ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Gapper.vGap(),
        ],
      ),
    );
  }
}
