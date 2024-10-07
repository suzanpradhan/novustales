import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:storyv2/core/constants/app_colors.dart';
import 'package:storyv2/core/constants/ui_constants.dart';
import 'package:storyv2/layers/domain/entities/tale_entity.dart';

import '../../../../core/constants/assets.dart';
import '../../../../core/presentation/ui/easy_description.dart';
import '../../../../core/presentation/ui/spacer.dart';
import '../../../../core/presentation/widgets/count_info_card_widget.dart';
import '../../../../core/presentation/widgets/simple_button.dart';
import '../widgets/Image_card.dart';
import '../widgets/ShiftableImageHolderWidget.dart';
import '../widgets/menu_label_item_widget.dart';

class TaleDetailScreen extends StatefulWidget {
  final TaleEntity tale;
  const TaleDetailScreen({super.key, required this.tale});

  @override
  State<TaleDetailScreen> createState() => _TaleDetailScreenState();
}

class _TaleDetailScreenState extends State<TaleDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.taleBackground,
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            backgroundColor: AppColors.taleBackground,
            systemOverlayStyle:
                SystemUiOverlayStyle(statusBarBrightness: Brightness.dark),
            automaticallyImplyLeading: false,
            toolbarHeight: 60,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(50.0),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
                    child: Container(
                      height: 38.0,
                      width: 38.0,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.white.withOpacity(.2)),
                      child: GestureDetector(
                        onTap: () {
                          // Define your action here
                          context.pop();
                        },
                        child: Padding(
                          padding: EdgeInsets.all(UIConstants.x2minPadding),
                          child: Icon(
                            Icons.arrow_back,
                            color: AppColors.dark,
                            size: 25,
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            elevation: 0,
            pinned: true,
            centerTitle: false,
            expandedHeight: 400,
            stretch: true,
            flexibleSpace: SafeArea(
              child: FlexibleSpaceBar(
                expandedTitleScale: 1.1,
                stretchModes: [
                  StretchMode.zoomBackground,
                  StretchMode.blurBackground
                ],
                titlePadding: EdgeInsets.zero,
                title: Align(
                  alignment: Alignment.bottomLeft,
                  child: Container(
                    constraints: BoxConstraints(
                        maxHeight: kToolbarHeight,
                        minWidth: MediaQuery.of(context).size.width),
                    padding: EdgeInsets.fromLTRB(
                        0, UIConstants.minPadding, 0, UIConstants.minPadding),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          AppColors.taleBackground.withOpacity(0.0),
                          AppColors.taleBackground.withOpacity(0.5),
                          AppColors.taleBackground.withOpacity(1),
                        ],
                        stops: [0.1, 0.7, 1.0],
                      ),
                    ),
                    child: SizedBox(
                      // height: double.maxFinite,
                      child: SingleChildScrollView(
                        physics: const PageScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: menuItems.map((cardIndexed) {
                            return MenuLabelItemWidget(manuItem: cardIndexed);
                          }).toList(),
                        ),
                      ),
                    ),
                  ),
                ),
                background: Stack(
                  children: [
                    Positioned(
                      top: 0,
                      left: 0,
                      right: 0,
                      child: ClipRRect(
                        child: Image.network(
                          widget.tale.thumbnail!,
                          height: MediaQuery.of(context).size.height *
                              0.7, // Half of the screen height
                          width: MediaQuery.of(context).size.width,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    ClipRRect(
                      child: Image.network(
                        widget.tale.thumbnail!,
                        height: MediaQuery.of(context).size.height * 0.75,
                        width: MediaQuery.of(context).size.width,
                        fit: BoxFit.cover,
                      ),
                    ),
                    // Gradient for fade effect
                    Container(
                      height: MediaQuery.of(context).size.height * 0.75,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.transparent, // Start with transparent
                            AppColors.taleBackground.withOpacity(0.4),
                            AppColors.taleBackground.withOpacity(0.6),
                            AppColors.taleBackground.withOpacity(
                                0.7), // Adjust the opacity for smoother fade
                            AppColors
                                .taleBackground, // Fully white at the bottom
                          ],
                          stops: [
                            0.1,
                            0.4,
                            0.6,
                            0.8,
                            1.0,
                          ], // Smoothen the gradient transition
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // bottom: PreferredSize(
            //     preferredSize: Size.fromHeight(2), child: SizedBox()),
            // bottom: PreferredSize(
            //   preferredSize: Size.fromHeight(50.0),
            //   child: Container(
            //     height: 60,
            //     decoration: BoxDecoration(
            //       gradient: LinearGradient(
            //         begin: Alignment.topCenter,
            //         end: Alignment.bottomCenter,
            //         colors: [
            //           AppColors.taleBackground.withOpacity(0.0),
            //           AppColors.taleBackground.withOpacity(0.5),
            //           AppColors.taleBackground.withOpacity(1),
            //         ],
            //         stops: [0.1, 0.7, 1.0],
            //       ),
            //     ),
            //     child: SizedBox(
            //       height: double.maxFinite,
            //       child: Padding(
            //         padding: const EdgeInsets.symmetric(
            //             vertical: UIConstants.minPadding),
            //         child: SingleChildScrollView(
            //           physics: const PageScrollPhysics(),
            //           controller: PageController(
            //             initialPage: 0,
            //             viewportFraction: 0.6,
            //           ),
            //           scrollDirection: Axis.horizontal,
            //           child: Row(
            //             crossAxisAlignment: CrossAxisAlignment.start,
            //             children: menuItems.map((cardIndexed) {
            //               return MenuLabelItemWidget(manuItem: cardIndexed);
            //             }).toList(),
            //           ),
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
          ),
          // SliverPersistentHeader(
          //   pinned: true,
          //   delegate: _SliverPersistentHeaderDelegate(
          //     minHeight: 60.0,
          //     maxHeight: 60.0,
          //     child: Container(
          //       color: AppColors.taleBackground,
          //       child: Row(
          //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //         children: [
          //           Expanded(
          //             child: Text('Your Title',
          //                 style: TextStyle(color: Colors.white)),
          //           ),
          //           Expanded(
          //             child: SingleChildScrollView(
          //               scrollDirection: Axis.horizontal,
          //               child: Row(
          //                 children: menuItems.map((cardIndexed) {
          //                   return MenuLabelItemWidget(manuItem: cardIndexed);
          //                 }).toList(),
          //               ),
          //             ),
          //           ),
          //         ],
          //       ),
          //     ),
          //   ),
          // ), // main
          SliverToBoxAdapter(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    AppColors.taleBackground.withOpacity(.1),
                    AppColors.taleBackground.withOpacity(1),
                  ],
                  stops: [0.1, 1.0],
                ),
              ),
              child: Column(
                children: [
                  Gapper.vmxGap(),
                  Gapper.screenPadding(
                    child: Container(
                      decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(
                              UIConstants.maxBordeRadius)),
                      width: double.maxFinite,
                      child: Gapper.cardPadding(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Boom Town Fair",
                              style: Theme.of(context)
                                  .textTheme
                                  .displayLarge!
                                  .copyWith(
                                    fontFamily: "UberBold",
                                    color: AppColors.black,
                                  ),
                            ),
                            Gapper.v2xmGap(),
                            Text(
                              "Music and Festival",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
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
                                  child: Image.asset(Assets.test,
                                      fit: BoxFit.cover),
                                ),
                                Gapper.h2xmGap(),
                                Text(
                                  "Niwesh Shrestha",
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleLarge!
                                      .copyWith(
                                        fontFamily: "UberMedium",
                                        color: AppColors.black,
                                      ),
                                )
                              ],
                            ),
                            Gapper.vmGap(),
                            Row(
                              children: [
                                CountInfoCardWidget(
                                    text1: "1124", text2: "Daily Visit"),
                                Gapper.hmGap(),
                                CountInfoCardWidget(
                                    text1: "2.4k", text2: "Followers"),
                                Gapper.hmGap(),
                                CountInfoCardWidget(
                                    text1: "12 Oct", text2: "Started on"),
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
                                  right: cardItems.indexOf(cardIndexed) ==
                                          cardItems.length - 1
                                      ? UIConstants.screenPadding
                                      : 0),
                              child: ImageCard(
                                cover: cardIndexed.cover,
                                name: cardIndexed.name,
                                time: "7m ago",
                                count: "857 k",
                                height: 300,
                              )),
                        );
                      }).toList(),
                    ),
                  ),
                  Gapper.vmxGap(),
                  Gapper.screenPadding(
                    child: Container(
                      decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(
                              UIConstants.maxBordeRadius)),
                      width: double.maxFinite,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Gapper.cardPadding(
                            child: Text(
                              "Leaderboard",
                              style: Theme.of(context)
                                  .textTheme
                                  .displayLarge!
                                  .copyWith(
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
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelLarge!
                                      .copyWith(
                                        fontFamily: "UberBold",
                                        color: AppColors.black,
                                      ),
                                ),
                                mainAxisAlignment: MainAxisAlignment.end,
                                ringColor: AppColors.ringColorYellow,
                                dropShadow:
                                    AppColors.ringColorYellow.withOpacity(0.7),
                              ),
                              Gapper.h2xmGap(),
                              ShiftableimageholderWidget(
                                imageSize: 100,
                                count: 1,
                                title: Text(
                                  "Chester Wade",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(
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
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelLarge!
                                      .copyWith(
                                        fontFamily: "UberBold",
                                        color: AppColors.black,
                                      ),
                                ),
                                mainAxisAlignment: MainAxisAlignment.end,
                                ringColor: AppColors.ringColorPink,
                                dropShadow:
                                    AppColors.ringColorPink.withOpacity(0.7),
                              ),
                            ],
                          ),
                          Gapper.cardPadding(
                            child: SimpleButton(
                              buttonLabel: "",
                              label: Text(
                                "Check all",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
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
                          borderRadius: BorderRadius.circular(
                              UIConstants.maxBordeRadius)),
                      width: double.maxFinite,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Gapper.cardPadding(
                            child: Text(
                              "Gallery",
                              style: Theme.of(context)
                                  .textTheme
                                  .displayLarge!
                                  .copyWith(
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
              ),
            ),
          ),

          // SliverList(
          //   delegate: SliverChildBuilderDelegate(
          //     (BuildContext context, int index) {
          //       return Column(
          //         children: [
          //           Gapper.screenPadding(
          //             child: Container(
          //               color: AppColors.red,
          //               height: 200,
          //               width: MediaQuery.of(context).size.width,
          //             ),
          //           ),
          //           Gapper.vGap(),
          //         ],
          //       );
          //     },
          //   ),
          // ),
        ],
      ),
    );
  }
}

// class _SliverPersistentHeaderDelegate extends SliverPersistentHeaderDelegate {
//   final double minHeight;
//   final double maxHeight;
//   final Widget child;

//   _SliverPersistentHeaderDelegate({
//     required this.minHeight,
//     required this.maxHeight,
//     required this.child,
//   });

//   @override
//   Widget build(
//       BuildContext context, double shrinkOffset, bool overlapsContent) {
//     return SizedBox.expand(child: child); // Use the child widget directly here
//   }

//   @override
//   double get maxExtent => maxHeight;

//   @override
//   double get minExtent => minHeight;

//   @override
//   bool shouldRebuild(covariant _SliverPersistentHeaderDelegate oldDelegate) {
//     return oldDelegate.maxHeight != maxHeight ||
//         oldDelegate.minHeight != minHeight ||
//         oldDelegate.child != child;
//   }
// }

final List<CardItem> cardItems = [
  CardItem("Alex Brooker", Assets.cel1),
  CardItem("Alex Brooker", Assets.cel2),
  CardItem("Alex Brooker", Assets.cel3),
];

class CardItem {
  final String name;
  final String cover;

  CardItem(this.name, this.cover);
}

final List<MenuItem> menuItems = [
  MenuItem("Tales"),
  MenuItem("Stories"),
  MenuItem("Leaderboard"),
  MenuItem("Members"),
];

class MenuItem {
  final String name;

  MenuItem(this.name);
}
