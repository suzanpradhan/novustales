import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:storyv2/core/constants/app_colors.dart';
import 'package:storyv2/layers/presentation/feed/blocs/for_you_story/for_you_story_bloc.dart';
import 'package:storyv2/layers/presentation/feed/screens/story_page.dart';

class ForYouPage extends StatefulWidget {
  const ForYouPage({super.key});

  @override
  State<ForYouPage> createState() => _ForYouPageState();
}

class _ForYouPageState extends State<ForYouPage>
    with AutomaticKeepAliveClientMixin<ForYouPage> {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocBuilder<ForYouStoryBloc, ForYouStoryState>(
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
              success: (story) {
                if (story.isEmpty) {
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
                  itemCount: story.length,
                  itemBuilder: (context, index) {
                    return StoryPage(
                      story: story[index],
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
