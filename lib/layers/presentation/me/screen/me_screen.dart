import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:storyv2/core/constants/ui_constants.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_icons.dart';
import '../../../../core/constants/assets.dart';
import '../../../../core/presentation/ui/spacer.dart';
import '../bloc/profile_bloc/get_profile_bloc.dart';
import '../widgets/profile_tabs.dart';
import '../widgets/user_info_widget.dart';
import 'bookmarks_page.dart';
import 'story_page.dart';

class MeScreen extends StatefulWidget {
  const MeScreen({super.key});

  @override
  State<MeScreen> createState() => _MeScreenV4State();
}

class _MeScreenV4State extends State<MeScreen> {
  double _bottomSheetHeight = 0.55;
  double _containerSizeFactor = 0;
  String _currentTab = 'stories';
  double _opacityFactor = 0;
  final DraggableScrollableController _draggableController =
      DraggableScrollableController();

  _changeTab(String tab) {
    setState(() {
      _currentTab = tab;
    });
  }

  @override
  void dispose() {
    _draggableController.dispose();
    _draggableController.removeListener(_scrollListener);
    _draggableController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _draggableController.addListener(_scrollListener);
  }

  void _scrollListener() {
    setState(() {
      _containerSizeFactor =
          ((_draggableController.pixels - 462) / 210).clamp(0, 1);
      _opacityFactor = ((_draggableController.pixels - 462) / 100).clamp(0, 1);
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final top = 330 - (_containerSizeFactor * 210);
      return BlocBuilder<GetProfileBloc, GetProfileState>(
        builder: (context, state) {
          return state.mapOrNull(
                success: (value) {
                  return Stack(
                    children: [
                      SizedBox(
                        width: double.maxFinite,
                        height: (constraints.maxHeight -
                                (constraints.maxHeight * 0.55)) +
                            20,
                        child: Stack(
                          children: [
                            Stack(
                              children: [
                                Container(
                                  height: double.maxFinite,
                                  width: double.maxFinite,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: NetworkImage(
                                            value.me.avatar != null &&
                                                    value.me.avatar!.isNotEmpty
                                                ? value.me.avatar!
                                                : Assets.noProfile,
                                          ))),
                                  child: ClipRRect(
                                    // make sure we apply clip it properly
                                    child: BackdropFilter(
                                      filter: ImageFilter.blur(
                                          sigmaX: 5 * _containerSizeFactor,
                                          sigmaY: 5 * _containerSizeFactor),
                                      child: Container(
                                        alignment: Alignment.center,
                                        color: Colors.grey.withOpacity(0.1),
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  bottom: 0,
                                  top: 300,
                                  left: 0,
                                  right: 0,
                                  child: Container(
                                    height: double.maxFinite,
                                    width: double.maxFinite,
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        begin: Alignment.bottomCenter,
                                        end: Alignment.topCenter,
                                        colors: [
                                          Colors.black.withOpacity(0.6),
                                          Colors.transparent,
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SafeArea(
                              child: Gapper.screenPadding(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Icon(Icons.edit),
                                        Gapper.hmGap(),
                                        Icon(Icons.settings),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          bottom: UIConstants.max2padding),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                              "${value.me.firstName} ${value.me.lastName}",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .displayLarge!
                                                  .copyWith(
                                                      fontSize: 36,
                                                      color: AppColors.white)),
                                          Text(value.me.email,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleSmall!
                                                  .copyWith(
                                                      color: AppColors.white)),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: NotificationListener<
                            DraggableScrollableNotification>(
                          onNotification: (notification) {
                            setState(() {
                              _bottomSheetHeight = notification.extent;
                            });
                            return true;
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: AppColors.white,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(
                                        UIConstants.borderRadius),
                                    topRight: Radius.circular(
                                        UIConstants.borderRadius))),
                            child: DraggableScrollableSheet(
                              initialChildSize: _bottomSheetHeight,
                              minChildSize: 0.55,
                              snap: false,
                              maxChildSize: 0.8,
                              expand: false,
                              snapAnimationDuration: Duration(microseconds: 1),
                              controller: _draggableController,
                              builder: (context, scrollController) {
                                return Column(
                                  children: [
                                    GestureDetector(
                                      onVerticalDragUpdate: (details) {
                                        if (_draggableController.isAttached) {
                                          // Ensure the controller is attached before calling jumpTo
                                          final newSize =
                                              _draggableController.size -
                                                  (details.primaryDelta! /
                                                      MediaQuery.of(context)
                                                          .size
                                                          .height);
                                          _draggableController.jumpTo(newSize);
                                        }
                                      },
                                      child: Container(),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: UIConstants.padding +
                                              UIConstants.max2padding *
                                                  2 *
                                                  _containerSizeFactor),
                                    ),
                                    Expanded(
                                      child: SingleChildScrollView(
                                        controller: scrollController,
                                        child: Container(
                                          padding: EdgeInsets.only(
                                              top: UIConstants.padding),
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(
                                                    UIConstants.borderRadius),
                                                topRight: Radius.circular(
                                                    UIConstants.borderRadius),
                                              ),
                                              color: Colors.transparent),
                                          child: Gapper.screenPadding(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                IntrinsicHeight(
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      UserInfoCard(
                                                        title: "Posts",
                                                        count: value
                                                            .me.numberOfStories,
                                                      ),
                                                      VerticalDivider(
                                                        // width: 10,
                                                        thickness: 1,
                                                        color: AppColors.dark
                                                            .withOpacity(0.5),
                                                      ),
                                                      UserInfoCard(
                                                        title: "Groups",
                                                        count:
                                                            value.me.followers,
                                                      ),
                                                      VerticalDivider(
                                                        // width: 10,
                                                        thickness: 1,
                                                        color: AppColors.dark
                                                            .withOpacity(0.5),
                                                      ),
                                                      UserInfoCard(
                                                        title: "Following",
                                                        count:
                                                            value.me.following,
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                Gapper.vGap(),
                                                if (value.me.bio != null)
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: UIConstants
                                                                .minPadding),
                                                    child: Text(value.me.bio!,
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .bodyMedium),
                                                  ),
                                                Gapper.vGap(),
                                                Divider(
                                                  height: 0.0,
                                                  thickness: 1,
                                                  color: AppColors.greyWhite,
                                                ),
                                                SizedBox(
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceAround,
                                                    children: [
                                                      ProfileTabs(
                                                        currentTab: _currentTab,
                                                        tabKey: 'stories',
                                                        onChange: _changeTab,
                                                        icon: Icon(
                                                          AppIcons.film,
                                                          size: 20,
                                                        ),
                                                      ),
                                                      ProfileTabs(
                                                        currentTab: _currentTab,
                                                        tabKey: 'bookmarks',
                                                        onChange: _changeTab,
                                                        icon: Icon(
                                                          AppIcons.bookmarks,
                                                          size: 20,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                _currentTab == 'bookmarks'
                                                    ? BookmarksPage()
                                                    : MyStoryPage(),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                          left: (MediaQuery.of(context).size.width -
                                  (_containerSizeFactor * 100)) /
                              2,
                          top: top,
                          // top: 120,
                          child: SizedBox(
                            height: _containerSizeFactor * 100,
                            width: _containerSizeFactor * 100,
                            // duration: Duration(milliseconds: 10),
                            child: Opacity(
                              opacity: _opacityFactor,
                              child: CircleAvatar(
                                radius: double.maxFinite,
                                backgroundImage: NetworkImage(
                                  value.me.avatar != null &&
                                          value.me.avatar!.isNotEmpty
                                      ? value.me.avatar!
                                      : Assets.noProfile,
                                ),
                              ),
                            ),
                          )),
                    ],
                  );
                },
              ) ??
              SizedBox();
        },
      );
    });
  }
}
