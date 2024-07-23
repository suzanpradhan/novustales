import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:storyv2/old/helper/custom_loader.dart';
import 'package:storyv2/old/providers/for_you_view_model.dart';

import '../../../constants/app_color.dart';
import '../../../providers/category_view_model.dart';
import '../../../providers/comment_view_model.dart';
import '../../../providers/story_view_model.dart';

class TrendingAppBar extends StatefulWidget {
  const TrendingAppBar({super.key});

  @override
  State<TrendingAppBar> createState() => _TrendingAppBarState();
}

class _TrendingAppBarState extends State<TrendingAppBar>
    with SingleTickerProviderStateMixin {
  bool _isFollowingSelected = true;
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;
  final ScrollController _scrollController = ScrollController();
  bool isListVisible = false;
  bool scrolled = false;
  bool isCategorySelected = false;

  @override
  void initState() {
    // TODO: implement initState
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _offsetAnimation = Tween<Offset>(
      begin: const Offset(-1, 0),
      end: const Offset(0, 0),
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    _scrollController.addListener(() {
      // Check if the user has scrolled
      if (_scrollController.position.pixels > 0) {
        setState(() {
          scrolled = true;
        });
      } else {
        setState(() {
          scrolled = false;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer4<CategoryViewModel, ForYouViewModel, StoryViewModel,
            CommentViewModel>(
        builder: (context, values, foryou, story, commentApi, child) {
      return DefaultTabController(
        length: 2,
        child: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: story.isLongPressed
              ? const SizedBox()
              : isCategorySelected
                  ? Text(
                      story.category ?? "",
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          color: Colors.white),
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        GestureDetector(
                            onTap: () {
                              story.baseController.jumpToPage(0);
                              setState(() {
                                _isFollowingSelected = true;
                              });
                            },
                            child: Column(
                              children: [
                                Text(
                                  "Trending",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(
                                          // fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                          color: Colors.white),
                                ),
                                Container(
                                  height: 3,
                                  width: 25,
                                  decoration: BoxDecoration(
                                      color: _isFollowingSelected
                                          ? buttonColor
                                          : Colors.transparent,
                                      borderRadius: BorderRadius.circular(15)),
                                )
                              ],
                            )),
                        Text(
                          " | ",
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge
                              ?.copyWith(fontSize: 18, color: Colors.white),
                        ),
                        GestureDetector(
                            onTap: () {
                              story.baseController.jumpToPage(1);
                              setState(() {
                                _isFollowingSelected = false;
                              });
                              final mediaItem =
                                  foryou.forYou[foryou.activeIndex];
                              final preloadedContent = foryou
                                  .getPreloadedContent(mediaItem['media_url'] ??
                                      "https://i.stack.imgur.com/Q3vyk.png");
                              preloadedContent.play();
                            },
                            child: Column(
                              children: [
                                Text(
                                  "For You",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(
                                          fontSize: 16, color: Colors.white),
                                ),
                                Container(
                                  height: 3,
                                  width: 25,
                                  decoration: BoxDecoration(
                                      color: !_isFollowingSelected
                                          ? buttonColor
                                          : Colors.transparent,
                                      borderRadius: BorderRadius.circular(15)),
                                )
                              ],
                            )),
                        Text(
                          " | ",
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge
                              ?.copyWith(fontSize: 18, color: Colors.white),
                        ),
                        GestureDetector(
                            onTap: () {
                              story.baseController.jumpToPage(2);
                              // setState(() {
                              //   _isFollowingSelected = false;
                              // });
                            },
                            child: Column(
                              children: [
                                Text(
                                  "Near Me",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(
                                          fontSize: 16, color: Colors.white),
                                ),
                                SizedBox(
                                  height: 3,
                                  width: 25,
                                  // decoration: BoxDecoration(
                                  //     color: !_isFollowingSelected
                                  //         ? buttonColor
                                  //         : Colors.transparent,
                                  //     borderRadius: BorderRadius.circular(15)
                                  //     ),
                                )
                              ],
                            )),
                      ],
                    ),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(35),
            child: story.isLongPressed
                ? const SizedBox()
                : !_isFollowingSelected
                    ? const SizedBox()
                    : Container(
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: isListVisible
                              ? Colors.transparent
                              : Colors.transparent,
                        ),
                        child: Row(
                          children: [
                            // Sliding drawer icon
                            Expanded(
                              flex: scrolled ? 1 : 2,
                              child: Container(
                                height: 70,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  color: !isListVisible
                                      ? Colors.transparent
                                      : Colors.transparent,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                    left: 10.0,
                                    right: 10,
                                    top: 5,
                                    bottom: 5,
                                  ),
                                  child: scrolled
                                      ? GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              scrolled = false;
                                              isListVisible = false;
                                            });
                                            if (story.category.isNotEmpty) {
                                              story.updateCategory("");
                                              isCategorySelected = false;
                                              story
                                                  .fetchTrendingStory()
                                                  .then((value) {
                                                for (int i = 0; i < 3; i++) {
                                                  story.preload(
                                                      story.storyPerCategory[i]
                                                          ['media_url'],
                                                      context);
                                                }
                                              });
                                            }
                                          },
                                          child: const Icon(
                                              Icons.arrow_back_ios_new_outlined,
                                              color: white,
                                              size: 16),
                                        )
                                      : GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              isListVisible = !isListVisible;
                                              if (isListVisible) {
                                                _controller.forward();
                                              } else {
                                                _controller.reverse();
                                              }
                                            });
                                            if (story.category.isNotEmpty) {
                                              story.updateCategory("");

                                              isCategorySelected = false;
                                              story
                                                  .fetchTrendingStory()
                                                  .then((value) {
                                                for (int i = 0; i < 3; i++) {
                                                  story.preload(
                                                      story.storyPerCategory[i]
                                                          ['media_url'],
                                                      context);
                                                }
                                                commentApi.changedStoryId(story
                                                    .storyPerCategory[0]['id']
                                                    .toString());
                                              });
                                            }
                                          },
                                          child: Row(
                                            children: [
                                              Icon(
                                                  isListVisible
                                                      ? Icons
                                                          .arrow_back_ios_new_outlined
                                                      : Icons.arrow_forward_ios,
                                                  color: white,
                                                  size: 16),
                                              Container(
                                                height: 25,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(12),
                                                  color: story.category.isEmpty
                                                      ? buttonColor
                                                      : Colors.white60,
                                                ),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                    left: 9.0,
                                                    right: 9,
                                                    bottom: 7,
                                                    top: 3,
                                                  ),
                                                  child: Text(
                                                    "All",
                                                    style: TextStyle(
                                                      color:
                                                          story.category.isEmpty
                                                              ? white
                                                              : Colors.black,
                                                      fontSize: 13,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                ),
                              ),
                            ),
                            // List
                            Expanded(
                              flex: 9,
                              child: SlideTransition(
                                position: _offsetAnimation,
                                child: AnimatedContainer(
                                  duration: const Duration(milliseconds: 300),
                                  height: isListVisible ? 25 : 0,
                                  child: isListVisible
                                      ? ListView.builder(
                                          padding:
                                              const EdgeInsets.only(right: 10),
                                          controller: _scrollController,
                                          scrollDirection: Axis.horizontal,
                                          itemCount: values.categories.length,
                                          itemBuilder: (context, index) {
                                            var data = values.categories[index];
                                            return GestureDetector(
                                              onTap: () async {
                                                customLoadStart();

                                                if (story.category.isNotEmpty) {
                                                  await story
                                                      .postUserInteraction();
                                                }

                                                story.updateCategory(
                                                    data.name ?? "");
                                                setState(() {
                                                  story.pageController
                                                      .jumpToPage(0);

                                                  // story.loadInitialData();
                                                });

                                                setState(() {
                                                  // isListVisible = false;
                                                  isCategorySelected = true;
                                                });

                                                await story
                                                    .fetchTrendingStory()
                                                    .then((value) => {
                                                          for (int i = 0;
                                                              i < 3;
                                                              i++)
                                                            {
                                                              story.preload(
                                                                  story.storyPerCategory[
                                                                          i][
                                                                      'media_url'],
                                                                  context)
                                                            },
                                                          commentApi
                                                              .changedStoryId(story
                                                                  .storyPerCategory[
                                                                      0]['id']
                                                                  .toString())
                                                        });

                                                customLoadStop();
                                              },
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 12.0),
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12),
                                                    color: story.category ==
                                                            data.name
                                                        ? buttonColor
                                                        : Colors.white60,
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 8.0,
                                                            right: 8,
                                                            top: 3),
                                                    child: Text(
                                                      data.name ?? "",
                                                      style: TextStyle(
                                                        color: story.category ==
                                                                data.name
                                                            ? white
                                                            : black,
                                                        fontSize: 13,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            );
                                          })
                                      : null,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
          ),
        ),
      );
    });
  }
}
