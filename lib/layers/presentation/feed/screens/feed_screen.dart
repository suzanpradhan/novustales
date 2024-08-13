import 'package:flutter/material.dart';
import 'package:story_view/story_view.dart';
import 'package:storyv2/core/constants/app_colors.dart';
import 'package:storyv2/core/constants/ui_constants.dart';
import 'package:storyv2/core/presentation/ui/spacer.dart';
import 'package:storyv2/layers/presentation/feed/screens/for_you_page.dart';
import 'package:storyv2/layers/presentation/feed/screens/trending_page.dart';

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
            height: 38,
            margin: EdgeInsets.only(top: 20),
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(
                horizontal: UIConstants.screenPadding,
              ),
              children: [
                InkWell(
                  onTap: () {
                    changeTab('search');
                  },
                  child: AnimatedContainer(
                    width: currentTab == 'search'
                        ? (MediaQuery.of(context).size.width -
                            (UIConstants.screenPadding * 2))
                        : null,
                    duration: Duration(seconds: 300),
                    padding: EdgeInsets.only(
                        left: UIConstants.maxPadding,
                        right: UIConstants.maxPadding),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(42),
                      border: Border.all(color: AppColors.gray),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.search,
                          color: Colors.white,
                        ),
                        if (currentTab == 'search')
                          Expanded(
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
                                  border: InputBorder.none,
                                  hintStyle:
                                      TextStyle(color: AppColors.greyWhite),
                                ),
                              ),
                            ),
                          ),
                        if (currentTab == "search")
                          InkWell(
                            onTap: () {
                              changeTab("for_you");
                            },
                            child: SizedBox(
                              width: 38,
                              height: 38,
                              child: Icon(
                                Icons.close,
                                color: Colors.white,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
                if (currentTab != 'search') ...[
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

class FeedTabWidget extends StatelessWidget {
  final String currentTab;
  final String tabKey;
  final Function(String)? onChange;
  final Color chipColor;
  final Color selectedTextColor;
  final Color unselectedTextColor;
  const FeedTabWidget({
    super.key,
    required this.currentTab,
    required this.tabKey,
    required this.onChange,
    this.chipColor = AppColors.dark,
    this.selectedTextColor = AppColors.white,
    this.unselectedTextColor = AppColors.black,
  });

  String tabKeyToTitle(String text) {
    return text
        .split('_')
        .map((word) => word.isNotEmpty
            ? word[0].toUpperCase() + word.substring(1).toLowerCase()
            : '')
        .join(' ');
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (onChange != null) {
          onChange!(tabKey);
        }
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: UIConstants.maxPadding),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(42),
          color: currentTab == tabKey ? chipColor : null,
          border: Border.all(
            color: currentTab == tabKey ? AppColors.dark : AppColors.gray,
          ),
        ),
        child: Center(
          child: Text(
            tabKeyToTitle(tabKey),
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: currentTab == tabKey
                      ? selectedTextColor
                      : unselectedTextColor,
                ),
          ),
        ),
      ),
    );
  }
}
