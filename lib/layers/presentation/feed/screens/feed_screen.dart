import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:story_view/story_view.dart';
import 'package:storyv2/core/constants/app_colors.dart';
import 'package:storyv2/core/constants/ui_constants.dart';
import 'package:storyv2/core/presentation/ui/time_different.dart';
import 'package:storyv2/layers/presentation/feed/blocs/for_you_story/for_you_story_bloc.dart';
import 'package:storyv2/layers/presentation/feed/utils/feed_options.dart';
import 'package:storyv2/layers/presentation/feed/widgets/feed_info.dart';

class FeedScreen extends StatefulWidget {
  const FeedScreen({super.key});

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  final StoryController controller = StoryController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ForYouStoryBloc, ForYouStoryState>(
      builder: (context, state) {
        return state.whenOrNull(
              failed: (message) {
                return Center(
                  child: SizedBox(
                    child: Text(message),
                  ),
                );
              },
              success: (story) {
                if (story.isEmpty) {
                  return SizedBox(
                    height: 38,
                    child: Center(
                      child: Text('No Stories'),
                    ),
                  );
                }
                return PageView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: story.length,
                  itemBuilder: (ctx, index) {
                    return Stack(
                      children: [
                        StoryView(
                          storyItems: [
                            story[index].media_urls!.endsWith('.mp4') == true
                                ? StoryItem.pageVideo(
                                    story[index].media_urls.toString(),
                                    controller: controller,
                                  )
                                : StoryItem.pageImage(
                                    url: story[index].media_urls.toString(),
                                    controller: controller,
                                  ),
                          ],
                          controller: controller,
                          repeat: true,
                          onStoryShow: ((item, storyIndex) => {}),
                          onComplete: () {},
                          progressPosition: ProgressPosition.none,
                        ),
                        Positioned(
                          bottom: 20,
                          left: UIConstants.minPadding,
                          right: UIConstants.minPadding,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              FeedInfo(
                                avtarUrl: story[index]
                                    .user_details!
                                    .avatar
                                    .toString(),
                                userName:
                                    story[index].user_details!.name.toString(),
                                feedTime: getTimeDifferenceFromNow(
                                        story[index].updated_at!)
                                    .toString(),
                                feedDescription: story[index].title.toString(),
                              ),
                              Column(
                                children: [
                                  ...feedOptions.map((option) {
                                    return IconButton.filled(
                                      highlightColor: AppColors.gray,
                                      style: IconButton.styleFrom(
                                        backgroundColor:
                                            AppColors.gray.withOpacity(0.5),
                                      ),
                                      color: Colors.white,
                                      icon: Icon(option.icon),
                                      onPressed: () {},
                                    );
                                  }).toList(),
                                  SizedBox(height: 30),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                );
              },
            ) ??
            SizedBox(
              height: 38,
              child: Center(
                child: Text('Failed'),
              ),
            );
      },
    );
  }
}
