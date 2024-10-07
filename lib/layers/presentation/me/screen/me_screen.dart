import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:storyv2/core/constants/ui_constants.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_icons.dart';
import '../../../../core/constants/assets.dart';
import '../../../../core/presentation/ui/spacer.dart';
import '../../../../core/presentation/widgets/simple_button.dart';
import '../../../../core/routes/app_routes.dart';
import '../../../../utils/secure_storage.dart';
import '../bloc/profile_bloc/get_profile_bloc.dart';
import '../widgets/profile_tabs.dart';
import '../widgets/shimmer/profile_shimmer.dart';
import '../widgets/user_info_widget.dart';
import 'bookmarks_page.dart';
import 'story_page.dart';

class MeScreen extends StatefulWidget {
  const MeScreen({super.key});

  @override
  State<MeScreen> createState() => _MeScreenState();
}

class _MeScreenState extends State<MeScreen> {
  String currentTab = 'stories';
  final SecureStorageMixin secureStorageMixin = SecureStorageMixin();
  changeTab(String tab) {
    setState(() {
      currentTab = tab;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        title: Text(
          'Profile',
          style: TextStyle(
            fontFamily: 'UberBold',
            fontSize: 16,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              context.push(SETTIN_SCREEN_ROUTE);
            },
            icon: Icon(Icons.settings),
          ),
        ],
        shadowColor: Colors.black,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: BlocBuilder<GetProfileBloc, GetProfileState>(
          builder: (context, state) {
            return state.mapOrNull(
                  loading: (value) => ProfileShimmer(),
                  failed: (value) {
                    return Container(
                      padding: EdgeInsets.symmetric(
                          vertical: UIConstants.minPadding),
                      color: AppColors.red,
                      child: Center(
                        child: Text(
                          "Server Error",
                          style: TextStyle(color: AppColors.white),
                        ),
                      ),
                    );
                  },
                  success: (value) {
                    return Column(
                      children: [
                        Gapper.cardPadding(
                          child: Column(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Row(
                                      children: [
                                        Stack(
                                          alignment: Alignment.center,
                                          children: [
                                            Container(
                                              width: 72,
                                              height: 72,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                border: Border.all(
                                                  color: AppColors.purpleAccent,
                                                  width: 2,
                                                ),
                                              ),
                                            ),
                                            Container(
                                              width: 64,
                                              height: 64,
                                              clipBehavior: Clip.hardEdge,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                              ),
                                              child: value.me.avatar != null &&
                                                      value
                                                          .me.avatar!.isNotEmpty
                                                  ? Image.network(
                                                      value.me.avatar!,
                                                      fit: BoxFit.cover,
                                                    )
                                                  : Image.asset(
                                                      Assets.noProfile,
                                                      fit: BoxFit.cover),
                                            ),
                                          ],
                                        ),
                                        Gapper.hmGap(),
                                        Expanded(
                                          child: Row(
                                            children: [
                                              Expanded(
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                        "${value.me.firstName} ${value.me.lastName}",
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .bodyLarge),
                                                    // if (value.me.nickName != "")
                                                    //   Text(
                                                    //     "@${value.me.nickName}",
                                                    //     style: Theme.of(context)
                                                    //         .textTheme
                                                    //         .bodyMedium,
                                                    //   ),
                                                    Text(value.me.email,
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .bodySmall),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SimpleButton(
                                    buttonLabel: "Login",
                                    label: Text(
                                      "Edit Profile",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(
                                            color: AppColors.dark,
                                          ),
                                    ),
                                    height: 36,
                                    isFilled: true,
                                    fillColor:
                                        AppColors.greyWhite.withOpacity(.5),
                                    alignment: MainAxisAlignment.center,
                                    handleTap: () {
                                      context.push(EDIT_PROFILE_SCREEN_ROUTE);
                                    },
                                  ),
                                ],
                              ),
                              Gapper.vGap(),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  UserInfoCard(
                                    title: "posts",
                                    count: value.me.numberOfStories,
                                  ),
                                  UserInfoCard(
                                    title: "followers",
                                    count: value.me.followers,
                                  ),
                                  UserInfoCard(
                                    title: "following",
                                    count: value.me.following,
                                  )
                                ],
                              ),
                              if (value.me.bio != null)
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: UIConstants.minPadding),
                                  child: Text(value.me.bio!,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium),
                                )
                            ],
                          ),
                        ),
                        Divider(
                          height: 0.0,
                          thickness: 1,
                          color: AppColors.greyWhite,
                        ),
                        SizedBox(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              ProfileTabs(
                                currentTab: currentTab,
                                tabKey: 'stories',
                                onChange: changeTab,
                                icon: Icon(
                                  AppIcons.film,
                                  size: 20,
                                ),
                              ),
                              ProfileTabs(
                                currentTab: currentTab,
                                tabKey: 'bookmarks',
                                onChange: changeTab,
                                icon: Icon(
                                  AppIcons.bookmarks,
                                  size: 20,
                                ),
                              ),
                            ],
                          ),
                        ),
                        currentTab == 'bookmarks'
                            ? BookmarksPage()
                            : MyStoryPage(),
                      ],
                    );
                  },
                ) ??
                SizedBox();
          },
        ),
      ),
    );
  }
}

List<Map<String, dynamic>> userInfo = [
  {'title': 'posts', 'count': 3},
  {'title': 'followers', 'count': 1000000},
  {'title': 'following', 'count': 42000},
];
