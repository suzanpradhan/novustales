import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_icons.dart';
import '../../../../core/constants/assets.dart';
import '../../../../core/presentation/ui/spacer.dart';
import '../../../../core/presentation/widgets/simple_button.dart';
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
            onPressed: () {},
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
                      color: AppColors.black,
                      child: Center(
                        child: Text(
                          value.message,
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
                                              width: 90,
                                              height: 90,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                border: Border.all(
                                                  color: AppColors.purpleAccent,
                                                  width: 2,
                                                ),
                                              ),
                                            ),
                                            // Circular image inside the border
                                            Container(
                                              width:
                                                  84, // Image size (should be slightly smaller than the outer border)
                                              height: 84,
                                              clipBehavior: Clip.hardEdge,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                              ),
                                              child: Image.asset(Assets.test,
                                                  fit: BoxFit.cover),
                                            ),
                                          ],
                                        ),
                                        Gapper.hGap(),
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
                                                          .bodyMedium!
                                                          .copyWith(
                                                            color:
                                                                AppColors.black,
                                                            fontFamily:
                                                                'RalewayBold',
                                                          ),
                                                    ),
                                                    if (value.me.nickName != "")
                                                      Text(
                                                        "@${value.me.nickName}",
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .bodyMedium!
                                                            .copyWith(
                                                              color: AppColors
                                                                  .grayDark,
                                                              fontFamily:
                                                                  'RalewayRegular',
                                                            ),
                                                      ),
                                                    Gapper.v2xmGap(),
                                                    Text(
                                                      "Entrepreneur",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodySmall!
                                                          .copyWith(
                                                            color:
                                                                AppColors.dark,
                                                            fontFamily:
                                                                'RalewayRegular',
                                                          ),
                                                    ),
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
                                    handleTap: () {},
                                  ),
                                ],
                              ),
                              Gapper.vGap(),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: userInfo.map(
                                  (info) {
                                    return UserInfoCard(
                                      title: info['title'],
                                      count: info['count'],
                                    );
                                  },
                                ).toList(),
                              ),
                              Gapper.vGap(),
                              SizedBox(
                                child: RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text:
                                            "Entrepreneur | Innovator | [Industry/Field] Enthusiast | Turning ideas into success stories. 🚀 ",
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelSmall!
                                            .copyWith(
                                              fontFamily: "SatoshiRegular",
                                              color: AppColors.dark,
                                            ),
                                      ),
                                      TextSpan(
                                        text: "#StartupLife #Innovation",
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelSmall!
                                            .copyWith(
                                              fontFamily: "SatoshiBold",
                                              color: AppColors.purpleAccent,
                                            ),
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Divider(
                          height: 0.0,
                          thickness: 2,
                          color: AppColors.greyWhite.withOpacity(.6),
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
                                  size: 24,
                                ),
                              ),
                              ProfileTabs(
                                currentTab: currentTab,
                                tabKey: 'bookmarks',
                                onChange: changeTab,
                                icon: Icon(
                                  AppIcons.bookmarks,
                                  size: 24,
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
