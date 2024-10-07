import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:storyv2/core/constants/app_colors.dart';
import 'package:storyv2/layers/presentation/feed/blocs/trending_story/trending_story_bloc.dart';
import 'package:storyv2/layers/presentation/feed/screens/story_page.dart';

class TrendingPage extends StatefulWidget {
  const TrendingPage({super.key});

  @override
  State<TrendingPage> createState() => _TrendingPageState();
}

class _TrendingPageState extends State<TrendingPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TrendingStoryBloc, TrendingStoryState>(
      builder: (context, state) {
        return state.whenOrNull(
              failed: (stories, hasMoreData, message) {
                if (stories == null || stories.isEmpty) {
                  return Container(
                    color: AppColors.black,
                    child: Center(
                      child: Text(
                        message ?? "",
                        style: TextStyle(color: AppColors.white),
                      ),
                    ),
                  );
                }
                return PageView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: stories.length,
                  itemBuilder: (context, index) {
                    return StoryPage(
                      story: stories[index],
                    );
                  },
                );
              },
              loading: (stories, hasMoreData) {
                if (stories == null || stories.isEmpty) {
                  return Container(
                    color: AppColors.black,
                    child: Center(
                      child: Text(
                        'No Stories for you currently.',
                        style: TextStyle(color: AppColors.white),
                      ),
                    ),
                  );
                }
                return PageView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: stories.length,
                  itemBuilder: (context, index) {
                    return StoryPage(
                      story: stories[index],
                    );
                  },
                );
              },
              success: (stories, hasMoreData) {
                if (stories == null || stories.isEmpty) {
                  return Container(
                    color: AppColors.black,
                    child: Center(
                      child: Text(
                        'No Stories for you currently.',
                        style: TextStyle(color: AppColors.white),
                      ),
                    ),
                  );
                }
                return PageView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: stories.length,
                  itemBuilder: (context, index) {
                    return StoryPage(
                      story: stories[index],
                    );
                  },
                );
              },
            ) ??
            Container(
              color: AppColors.black,
              child: Center(
                child: Text(
                  'Failed to load',
                  style: TextStyle(color: AppColors.white),
                ),
              ),
            );
      },
    );
  }
}
