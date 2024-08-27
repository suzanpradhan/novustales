import 'package:flutter/material.dart';
import 'package:story_view/story_view.dart';
import 'package:storyv2/core/constants/app_colors.dart';
import 'package:storyv2/core/constants/ui_constants.dart';
import 'package:storyv2/core/presentation/ui/spacer.dart';
import 'package:storyv2/layers/presentation/feed/screens/for_you_page.dart';
import 'package:storyv2/layers/presentation/feed/screens/trending_page.dart';

import '../widgets/feed_tab_widget.dart';

class FeedScreen extends StatefulWidget {
  const FeedScreen({super.key});

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  final StoryController controller = StoryController();
  String currentTab = 'for_you';

  changeTab(String tab) {
    setState(() {
      currentTab = tab;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          currentTab == 'for_you'
              ? ForYouPage()
              : currentTab == 'trending'
                  ? TrendingPage()
                  : Container(
                      color: AppColors.black,
                      child: Center(
                        child: Text(
                          'Work in progess',
                          style: TextStyle(color: AppColors.white),
                        ),
                      ),
                    ),
          Container(
            height: 36,
            margin: EdgeInsets.only(top: 20),
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(
                horizontal: UIConstants.screenPadding,
              ),
              children: [
                AnimatedContainer(
                  width: currentTab == 'search'
                      ? (MediaQuery.of(context).size.width -
                          (UIConstants.screenPadding * 2))
                      : 54,
                  clipBehavior: Clip.hardEdge,
                  duration: Duration(milliseconds: 250),
                  padding: EdgeInsets.symmetric(
                    horizontal: UIConstants.padding,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(42),
                    border: Border.all(color: AppColors.gray),
                  ),
                  child: InkWell(
                    onTap: () {
                      changeTab('search');
                    },
                    child: ClipRect(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.search,
                            size: 24,
                            color: Colors.white,
                          ),
                          if (currentTab == 'search')
                            Expanded(
                              flex: 10,
                              child: Padding(
                                padding: EdgeInsets.only(
                                  left: UIConstants.xminPadding,
                                ),
                                child: TextField(
                                  style: TextStyle(color: Colors.white),
                                  onEditingComplete: () {
                                    FocusScope.of(context).unfocus();
                                  },
                                  decoration: InputDecoration(
                                    hintText: "Search",
                                    isDense: true,
                                    isCollapsed: true,
                                    border: InputBorder.none,
                                    hintStyle:
                                        TextStyle(color: AppColors.greyWhite),
                                  ),
                                ),
                              ),
                            ),
                          if (currentTab == "search")
                            Expanded(
                              flex: 1,
                              child: SizedBox(
                                width: 38,
                                height: 38,
                                child: InkWell(
                                  onTap: () {
                                    changeTab("for_you");
                                  },
                                  child: Icon(
                                    Icons.close,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                ),
                ...[
                  Gapper.hmGap(),
                  FeedTabWidget(
                    currentTab: currentTab,
                    tabKey: 'for_you',
                    onChange: changeTab,
                    chipColor: AppColors.white,
                    selectedTextColor: AppColors.black,
                    unselectedTextColor: AppColors.white,
                  ),
                  Gapper.hmGap(),
                  FeedTabWidget(
                    currentTab: currentTab,
                    tabKey: 'trending',
                    onChange: changeTab,
                    chipColor: AppColors.white,
                    selectedTextColor: AppColors.black,
                    unselectedTextColor: AppColors.white,
                  ),
                  Gapper.hmGap(),
                  FeedTabWidget(
                    currentTab: currentTab,
                    tabKey: 'near_me',
                    onChange: changeTab,
                    chipColor: AppColors.white,
                    selectedTextColor: AppColors.black,
                    unselectedTextColor: AppColors.white,
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}
