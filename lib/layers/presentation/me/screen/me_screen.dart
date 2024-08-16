import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:storyv2/core/constants/app_colors.dart';
import 'package:storyv2/core/constants/app_icons.dart';
import 'package:storyv2/core/constants/ui_constants.dart';
import 'package:storyv2/core/presentation/ui/number_to_string.dart';
import 'package:storyv2/layers/presentation/me/bloc/profile_bloc/get_profile_bloc.dart';
import 'package:storyv2/layers/presentation/me/screen/bookmarks_page.dart';
import 'package:storyv2/layers/presentation/me/screen/story_page.dart';

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
        title: Text('Profile'),
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
            return state.whenOrNull(
                  failed: (message) {
                    return Container(
                      color: AppColors.black,
                      child: Center(
                        child: Text(
                          message,
                          style: TextStyle(color: AppColors.white),
                        ),
                      ),
                    );
                  },
                  success: (profile) {
                    return Column(
                      children: [
                        SizedBox(height: 20),
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: UIConstants.padding),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CircleAvatar(
                                radius: 50,
                                backgroundColor: Colors.grey,
                                backgroundImage: NetworkImage(profile.avatar),
                              ),
                              SizedBox(width: UIConstants.minPadding),
                              Expanded(
                                flex: 1,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: UIConstants.xminPadding),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '${profile.firstName} ${profile.lastName}',
                                        style: TextStyle(
                                          fontFamily: 'Raleway',
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16,
                                          color: Color(0xff27282D),
                                        ),
                                      ),
                                      Text(
                                        '@${profile.nickName}',
                                        style: TextStyle(
                                          fontFamily: 'Raleway',
                                          fontWeight: FontWeight.normal,
                                          fontSize: 14,
                                          color: Color(0xff4E4E4E),
                                        ),
                                      ),
                                      SizedBox(height: UIConstants.minPadding),
                                      Text(
                                        'Sorcerer',
                                        style: TextStyle(
                                          fontFamily: 'Raleway',
                                          fontWeight: FontWeight.normal,
                                          fontSize: 12,
                                          color: Color(0xff0e0e0e),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(width: UIConstants.minPadding),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: UIConstants.xminPadding),
                                child: InkWell(
                                  onTap: () {},
                                  child: Container(
                                    padding:
                                        EdgeInsets.all(UIConstants.minPadding),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                          UIConstants.borderRadius),
                                      color: AppColors.gray,
                                    ),
                                    child: Text(
                                      'Edit Profile',
                                      style: TextStyle(
                                        fontFamily: 'Satoshi',
                                        fontSize: 14,
                                        fontWeight: FontWeight.normal,
                                        color: Color(0xff27282d),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(height: 20),
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: UIConstants.padding),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              UserInfoCard(
                                title: 'posts',
                                num: numberToString(profile.numberOfStories),
                              ),
                              UserInfoCard(
                                title: 'followers',
                                num: numberToString(1000000),
                              ),
                              UserInfoCard(
                                title: 'following',
                                num: numberToString(4200),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 20),
                        RichText(
                          text: TextSpan(
                            text: '',
                          ),
                        ),
                        Divider(),
                        SizedBox(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              ProfileTabs(
                                currentTab: currentTab,
                                tabKey: 'stories',
                                onChange: changeTab,
                                icon: AppIcons.film,
                              ),
                              ProfileTabs(
                                currentTab: currentTab,
                                tabKey: 'bookmarks',
                                onChange: changeTab,
                                icon: AppIcons.bookmarks,
                              ),
                            ],
                          ),
                        ),
                        currentTab == 'bookmarks'
                            ? BookmarksPage()
                            : MyStoryPage(stories: profile.stories),
                      ],
                    );
                  },
                ) ??
                Container();
          },
        ),
      ),
    );
  }
}

class ProfileTabs extends StatelessWidget {
  const ProfileTabs({
    super.key,
    this.onChange,
    required this.icon,
    required this.tabKey,
    required this.currentTab,
  });

  final Function(String)? onChange;
  final String tabKey;
  final String currentTab;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: InkWell(
        onTap: () {
          if (onChange != null) {
            onChange!(tabKey);
          }
        },
        child: Column(
          children: [
            Icon(
              icon,
              size: 24,
            ),
            SizedBox(height: UIConstants.xminPadding),
            if (currentTab == tabKey)
              Container(
                width: 60,
                height: 2,
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class UserInfoCard extends StatelessWidget {
  const UserInfoCard({
    super.key,
    required this.title,
    required this.num,
  });
  final String title;
  final String num;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: RichText(
        text: TextSpan(
          text: '$num\n',
          style: TextStyle(
            fontFamily: 'Satoshi',
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Color(0xff0B0046),
          ),
          children: [
            TextSpan(
              text: title,
              style: TextStyle(
                fontFamily: 'Satoshi',
                fontSize: 13,
                fontWeight: FontWeight.normal,
                color: Color(0xff414357),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
