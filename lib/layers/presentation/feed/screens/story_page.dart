import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:story_view/story_view.dart';
import 'package:storyv2/layers/domain/entities/story_entity.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/ui_constants.dart';
import '../../../../core/presentation/ui/time_difference.dart';
import '../utils/feed_options.dart';
import '../utils/kwargs.dart';
import '../widgets/feed_info.dart';

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
  StoryController controller = StoryController();
  final ValueNotifier<bool> isPaused = ValueNotifier(false);
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
  void dispose() {
    // Dispose of your resources here
    controller.dispose();
    isPaused.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    isPaused.value = false;
    final bool isVideo = videoFormats.any(
        (format) => widget.story.media?.toLowerCase().endsWith(format) == true);
    return Stack(
      children: [
        StoryView(
          storyItems: [
            isVideo
                ? StoryItem.pageVideo(
                    widget.story.media.toString(),
                    imageFit: BoxFit.fitWidth,
                    controller: controller,
                  )
                : StoryItem.pageImage(
                    url: widget.story.media.toString(),
                    controller: controller,
                    imageFit: BoxFit.fitWidth,
                    caption: Text(widget.story.title.toString()),
                  ),
          ],
          controller: controller,
          repeat: true,
          onStoryShow: ((item, storyIndex) => {}),
          onComplete: () {},
          progressPosition: ProgressPosition.none,
        ),
        if (isVideo)
          InkWell(
            onTap: () {
              if (!isPaused.value) {
                controller.pause();
              } else {
                controller.play();
              }
              isPaused.value = !isPaused.value;
            },
            child: SizedBox(
              height: double.infinity,
              width: double.maxFinite,
              child: ValueListenableBuilder(
                  valueListenable: isPaused,
                  builder: (context, value, child) {
                    return Center(
                        child: AnimatedOpacity(
                      duration: Duration(milliseconds: 200),
                      opacity: value ? 1 : 0,
                      child: Container(
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.grayDark.withOpacity(0.3),
                        ),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: UIConstants.padding,
                                horizontal: UIConstants.padding),
                            child: Icon(
                              value ? Icons.play_arrow : Icons.pause,
                              size: 40,
                              color: AppColors.white,
                              fill: 1,
                            ),
                          ),
                        ),
                      ),
                    ));
                  }),
            ),
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
                                  'title': "${widget.story.title}",
                                  'link': widget.story.media,
                                },
                              ),
                            );
                          }
                        }
                      },
                    );
                  }),
                  SizedBox(height: 30),
                ],
              ),
            ],
          ),
        ),
        if (controller.playbackNotifier.isPaused)
          Positioned(child: Icon(Icons.play_circle_fill))
      ],
    );
  }
}
