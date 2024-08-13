import 'package:flutter/material.dart';
import 'package:story_view/story_view.dart';
import 'package:storyv2/core/constants/app_colors.dart';
import 'package:storyv2/core/constants/ui_constants.dart';
import 'package:storyv2/core/presentation/ui/time_difference.dart';
import 'package:storyv2/layers/domain/entities/story_entity.dart';
import 'package:storyv2/layers/presentation/feed/utils/feed_options.dart';
import 'package:storyv2/layers/presentation/feed/utils/kwargs.dart';
import 'package:storyv2/layers/presentation/feed/widgets/feed_info.dart';

class StoryPage extends StatefulWidget {
  const StoryPage({
    super.key,
    required this.story,
  });
  final StoryEntity story;

  @override
  State<StoryPage> createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  final StoryController controller = StoryController();
  final List<String> videoFormats = [
    '.m4v',
    '.mp4',
    '.mov',
    '.avi',
    '.flv',
    '.wmv',
    '.mkv',
    '.webm'
  ];

  @override
  Widget build(BuildContext context) {
    final bool isVideo = videoFormats.any(
        (format) => widget.story.media?.toLowerCase().endsWith(format) == true);
    return Stack(
      children: [
        StoryView(
          storyItems: [
            isVideo
                ? StoryItem.pageVideo(
                    widget.story.media.toString(),
                    controller: controller,
                  )
                : StoryItem.pageImage(
                    url: widget.story.media.toString(),
                    controller: controller,
                    caption: Text(widget.story.title.toString()),
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
                avtarUrl: widget.story.userDetails!.avatar.toString(),
                userName: widget.story.userDetails!.name.toString(),
                feedTime: getTimeDifferenceFromNow(widget.story.updatedAt!)
                    .toString(),
                feedDescription: widget.story.title.toString(),
              ),
              Column(
                children: [
                  ...feedOptions.map((option) {
                    return IconButton.filled(
                      highlightColor: AppColors.greyWhite,
                      style: IconButton.styleFrom(
                        backgroundColor: AppColors.gray.withOpacity(0.5),
                      ),
                      color: Colors.white,
                      icon: Icon(option.icon),
                      onPressed: () async {
                        if (option.actions != null) {
                          if (option.title == 'Share') {
                            await option.actions!.call(
                              Kwargs(
                                {
                                  'title': widget.story.title,
                                  'link': widget.story.media,
                                },
                              ),
                            );
                          }
                        }
                      },
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
  }
}
