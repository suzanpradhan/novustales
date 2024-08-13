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

class _TrendingPageState extends State<TrendingPage>
    with AutomaticKeepAliveClientMixin<TrendingPage> {
  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocBuilder<TrendingStoryBloc, TrendingStoryState>(
        builder: (context, state) {
      return state.whenOrNull(
            failed: (message) {
              return Container(
                color: Colors.black,
                child: Center(
                  child: Text(
                    message,
                    style: TextStyle(color: AppColors.white),
                  ),
                ),
              );
            },
            success: (story) {
              if (story.isEmpty) {
                return Container(
                  color: AppColors.black,
                  child: Center(
                    child: Text(
                      'No Trending Stories currently',
                      style: TextStyle(
                        color: AppColors.white,
                      ),
                    ),
                  ),
                );
              }
              return RefreshIndicator(
                onRefresh: () async {
                  BlocProvider.of<TrendingStoryBloc>(context)
                      .add(TrendingStoryEvent.request());
                },
                child: PageView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: story.length,
                  itemBuilder: (context, index) {
                    return StoryPage(
                      story: story[index],
                    );
                  },
                ),
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
    });
  }
}
