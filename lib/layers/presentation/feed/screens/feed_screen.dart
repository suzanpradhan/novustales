import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:story_view/story_view.dart';
import 'package:storyv2/core/constants/app_colors.dart';
import 'package:storyv2/core/constants/ui_constants.dart';
import 'package:storyv2/core/presentation/ui/spacer.dart';
import 'package:storyv2/layers/presentation/feed/screens/for_you_page.dart';
import 'package:storyv2/layers/presentation/feed/screens/search_page.dart';
import 'package:storyv2/layers/presentation/feed/screens/trending_page.dart';

import '../../../../core/presentation/widgets/form_fields/chips_radio_field.dart';
import '../../../../utils/dependencies_injection.dart';
import '../blocs/get_categories/get_categories_bloc.dart';
import '../blocs/get_stories/get_stories_bloc.dart';
import '../blocs/search_stories/search_stories_bloc.dart';
import '../widgets/feed_tab_widget.dart';

const searchFilters = [
  "Music",
  "Food",
  "Technology",
  "Health",
  "Satisfying",
  "Dance Challenge",
  "Politics",
  "Science"
];

class CurrentFeedPage extends StatefulWidget {
  final String tab;
  const CurrentFeedPage({super.key, required this.tab});

  @override
  State<CurrentFeedPage> createState() => _CurrentFeedPageState();
}

class _CurrentFeedPageState extends State<CurrentFeedPage> {
  @override
  Widget build(BuildContext context) {
    switch (widget.tab) {
      case 'for_you':
        return ForYouPage();
      case 'trending':
        return TrendingPage();
      case 'search':
        return SearchPage();
      default:
        return Container(
          color: AppColors.black,
          child: Center(
            child: Text(
              'Work in progress',
              style: TextStyle(color: AppColors.white),
            ),
          ),
        );
    }
  }
}

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
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetStoriesBloc(sl()),
      child: SafeArea(
        child: Stack(
          children: [
            CurrentFeedPage(
              tab: currentTab,
            ),
            if (currentTab == 'search')
              Container(
                height: 300,
                width: double.maxFinite,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      AppColors.black.withOpacity(0.8),
                      AppColors.black.withOpacity(0.5),
                      AppColors.black.withOpacity(0)
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: [0.1, 0.6, 1],
                    tileMode: TileMode.repeated,
                  ),
                ),
              ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                        duration: Duration(milliseconds: 100),
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
                                            bottom: 2),
                                        child: TextField(
                                          style: TextStyle(color: Colors.white),
                                          onEditingComplete: () {
                                            context
                                                .read<SearchStoriesBloc>()
                                                .add(SearchStoriesEvent
                                                    .attempt());

                                            FocusScope.of(context).unfocus();
                                          },
                                          onChanged: (value) {
                                            context
                                                .read<SearchStoriesBloc>()
                                                .add(SearchStoriesEvent
                                                    .registerSearchString(
                                                        search: value));
                                          },
                                          decoration: InputDecoration(
                                            hintText: "Search",
                                            isDense: true,
                                            isCollapsed: true,
                                            border: InputBorder.none,
                                            hintStyle: Theme.of(context)
                                                .textTheme
                                                .bodySmall
                                                ?.copyWith(
                                                  color: AppColors.greyWhite,
                                                ),
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
                              )),
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
                if (currentTab == "search") Gapper.vGap(),
                // if (currentTab == "search") SearchCategoriesWidget()
                if (currentTab == "search")
                  BlocBuilder<SearchStoriesBloc, SearchStoriesState>(
                    builder: (context, searchState) {
                      return BlocBuilder<GetCategoriesBloc, GetCategoriesState>(
                        builder: (context, state) {
                          return state.mapOrNull(
                                success: (value) {
                                  return Gapper.screenPadding(
                                      child: ChipsRadioField(
                                    items: [
                                      ...value.categories.map((item) =>
                                          ChipItemData(
                                              label: item.name,
                                              value: item.name))
                                    ],
                                    chipBuilder: (item) {
                                      return GestureDetector(
                                        onTap: () {
                                          context.read<SearchStoriesBloc>().add(
                                              SearchStoriesEvent
                                                  .registerCategoryName(
                                                      categoryName:
                                                          item.value));
                                        },
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(
                                                  (UIConstants.minPadding +
                                                      24))),
                                          child: BackdropFilter(
                                            filter: ImageFilter.blur(
                                                sigmaX: 5, sigmaY: 5),
                                            child: Container(
                                              padding: EdgeInsets.symmetric(
                                                  vertical:
                                                      UIConstants.minPadding,
                                                  horizontal:
                                                      UIConstants.maxPadding),
                                              decoration: BoxDecoration(
                                                color: searchState.categoryNames
                                                                .value !=
                                                            null &&
                                                        searchState
                                                            .categoryNames
                                                            .value!
                                                            .contains(
                                                                item.value)
                                                    ? AppColors.white
                                                    : null,
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular((UIConstants
                                                            .minPadding +
                                                        24))),
                                                border: Border.all(
                                                    color: AppColors.border
                                                        .withOpacity(0.2)),
                                              ),
                                              child: Text(
                                                item.label,
                                                style: TextStyle(
                                                    color: searchState
                                                                    .categoryNames
                                                                    .value !=
                                                                null &&
                                                            searchState
                                                                .categoryNames
                                                                .value!
                                                                .contains(
                                                                    item.value)
                                                        ? AppColors.black
                                                        : AppColors.white),
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                    context: context,
                                  ));
                                },
                              ) ??
                              SizedBox();
                        },
                      );
                    },
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
