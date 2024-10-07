import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:storyv2/core/constants/app_colors.dart';
import 'package:storyv2/core/constants/ui_constants.dart';
import 'package:storyv2/layers/domain/entities/tale_entity.dart';

import '../../../../core/constants/assets.dart';
import '../widgets/menu_label_item_widget.dart';
import '../widgets/tales/leader_card_tab_widget.dart';
import '../widgets/tales/stories_card_tab_widget.dart';
import '../widgets/tales/tales_card_tab_widget.dart';

class TaleDetailScreen extends StatefulWidget {
  final TaleEntity tale;
  const TaleDetailScreen({super.key, required this.tale});

  @override
  State<TaleDetailScreen> createState() => _TaleDetailScreenState();
}

class _TaleDetailScreenState extends State<TaleDetailScreen> {
  int _currentIndex = 0;

  getTabs() {
    return [
      Center(
          child: TalesCardTabWidget(
        tale: widget.tale,
      )),
      Center(child: StoriesCardTabWidget()),
      Center(child: LeaderCardTabWidget()),
    ];
  }

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
            floating: true,
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
                          color: AppColors.white.withOpacity(.8)),
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
            expandedHeight: _currentIndex > 0 ? 0 : 400,
            stretch: true,
            flexibleSpace: SafeArea(
              child: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                double collapseFactor =
                    (constraints.maxHeight - kToolbarHeight) /
                        (200.0 - kToolbarHeight);
                collapseFactor = 1 - collapseFactor.clamp(0, 1);
                final double dynamicPadding = collapseFactor * 60.0;

                return FlexibleSpaceBar(
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
                      padding: EdgeInsets.fromLTRB(dynamicPadding,
                          UIConstants.minPadding, 0, UIConstants.minPadding),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            AppColors.taleBackground.withOpacity(0.0),
                            AppColors.taleBackground.withOpacity(0.2),
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
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: menuItems.map((cardIndexed) {
                              final int itemIndex =
                                  menuItems.indexOf(cardIndexed);
                              return Padding(
                                padding: EdgeInsets.only(
                                  left: UIConstants.minPadding,
                                  right: menuItems.indexOf(cardIndexed) ==
                                          menuItems.length - 1
                                      ? UIConstants.minPadding
                                      : 0,
                                ),
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _currentIndex = itemIndex;
                                    });
                                  },
                                  child: MenuLabelItemWidget(
                                      manuItem: cardIndexed,
                                      isActive: _currentIndex == itemIndex),
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                      // child: Container(
                      //   // color: AppColors.blueAccent,
                      //   child: TabBar(
                      //     padding: EdgeInsets.zero,
                      //     controller: _tabController,
                      //     indicatorColor: AppColors.white,
                      //     labelColor: AppColors.white,
                      //     unselectedLabelColor:
                      //         AppColors.white.withOpacity(0.6),
                      //     isScrollable: true,
                      //     indicatorPadding: EdgeInsets.zero,
                      //     labelPadding: EdgeInsets.symmetric(horizontal: 12.0),
                      //     tabAlignment: TabAlignment.center,
                      //     tabs: tabs.map((tab) => Tab(text: tab)).toList(),
                      //   ),
                      // ),
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
                );
              }),
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
              child: IndexedStack(
                index: _currentIndex, // Determines which child to display
                children: getTabs(),
              ),
              // child: TalesCardTabWidget()
            ),
          ),
        ],
      ),
    );
  }
}

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
  // MenuItem("Members"),
];

class MenuItem {
  final String name;

  MenuItem(this.name);
}

// final List<String> tabs = [
//   "Tales",
//   "Stories",
//   "Leaderboard",
//   "Members",
//   "Tab5",
//   "Tab6",
//   "Tab7"
// ];
