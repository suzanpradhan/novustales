import 'package:flutter/material.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/constants/assets.dart';
import '../../../../../core/constants/ui_constants.dart';
import '../../../../../core/presentation/ui/easy_description.dart';
import '../../../../../core/presentation/ui/spacer.dart';
import '../../../../../core/presentation/widgets/count_info_card_widget.dart';
import '../../../../../core/presentation/widgets/simple_button.dart';
import '../../screens/tale_detail_screen.dart';
import '../Image_card.dart';
import '../ShiftableImageHolderWidget.dart';

class TalesCardTabWidget extends StatefulWidget {
  const TalesCardTabWidget({super.key});

  @override
  State<TalesCardTabWidget> createState() => _TalesCardTabWidgetState();
}

class _TalesCardTabWidgetState extends State<TalesCardTabWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Gapper.vmxGap(),
        Gapper.screenPadding(
          child: Container(
            decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius:
                    BorderRadius.circular(UIConstants.maxBordeRadius)),
            width: double.maxFinite,
            child: Gapper.cardPadding(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Boom Town Fair",
                    style: Theme.of(context).textTheme.displayLarge!.copyWith(
                          fontFamily: "UberBold",
                          color: AppColors.black,
                        ),
                  ),
                  Gapper.v2xmGap(),
                  Text(
                    "Music and Festival",
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontFamily: "UberRegular",
                          color: AppColors.black.withOpacity(.6),
                        ),
                  ),
                  Gapper.vmGap(),
                  Row(
                    children: [
                      Container(
                        width:
                            25, // Image size (should be slightly smaller than the outer border)
                        height: 25,
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: Image.asset(Assets.test, fit: BoxFit.cover),
                      ),
                      Gapper.h2xmGap(),
                      Text(
                        "Niwesh Shrestha",
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                              fontFamily: "UberMedium",
                              color: AppColors.black,
                            ),
                      )
                    ],
                  ),
                  Gapper.vmGap(),
                  Row(
                    children: [
                      CountInfoCardWidget(text1: "1124", text2: "Daily Visit"),
                      Gapper.hmGap(),
                      CountInfoCardWidget(text1: "2.4k", text2: "Followers"),
                      Gapper.hmGap(),
                      CountInfoCardWidget(text1: "12 Oct", text2: "Started on"),
                    ],
                  ),
                  Gapper.vmGap(),
                  EasyDescription(
                    description:
                        "Join us for an unforgettable party festival event! Experience a vibrant celebration filled with live music, delicious food, exciting games, and fantastic entertainment. Dance the night away with friends, enjoy stunning performances, and create memories that will last a lifetime.",
                    wordLimits: 30,
                    showIsMore: false,
                  ),
                ],
              ),
            ),
          ),
        ),
        Gapper.vmxGap(),
        SingleChildScrollView(
          physics: const PageScrollPhysics(),
          controller: PageController(
            initialPage: 0,
            viewportFraction: 0.6,
          ),
          scrollDirection: Axis.horizontal,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: cardItems.map((cardIndexed) {
              return SizedBox(
                width: MediaQuery.of(context).size.width * 0.6,
                child: Padding(
                  padding: EdgeInsets.only(
                      left: UIConstants.screenPadding,
                      right:
                          cardItems.indexOf(cardIndexed) == cardItems.length - 1
                              ? UIConstants.screenPadding
                              : 0),
                  child: ImageCard(
                    cover: cardIndexed.cover,
                    name: cardIndexed.name,
                    time: "7m ago",
                    count: "857 k",
                    height: 300,
                  ),
                ),
              );
            }).toList(),
          ),
        ),
        Gapper.vmxGap(),
        Gapper.screenPadding(
          child: Container(
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
                      flex: 1,
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
                      isLead: true,
                      flex: 2,
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
                      flex: 1,
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
        ),
        Gapper.vmxGap(),
        Gapper.screenPadding(
          child: Container(
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
                    "Gallery",
                    style: Theme.of(context).textTheme.displayLarge!.copyWith(
                          fontFamily: "UberMedium",
                          color: AppColors.black,
                        ),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
