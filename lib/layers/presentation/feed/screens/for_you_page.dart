import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:storyv2/core/constants/app_colors.dart';

import '../blocs/for_you_story/for_you_story_bloc.dart';
import 'story_page.dart';

class ForYouPage extends StatefulWidget {
  const ForYouPage({super.key});

  @override
  State<ForYouPage> createState() => _ForYouPageState();
}

class _ForYouPageState extends State<ForYouPage> {
  @override
  void initState() {
    BlocProvider.value(
      value: context.read<ForYouStoryBloc>()..add(ForYouStoryEvent.request()),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ForYouStoryBloc, ForYouStoryState>(
      builder: (context, state) {
        return state.whenOrNull(
              failed: (stories, hasMoreData, message) {
                if (stories == null || stories.isEmpty) {
                  return Container(
                    color: AppColors.black,
                    child: Center(
                      child: Text(
                        message ?? "No Stories for you currently.",
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
