import 'package:flutter/material.dart';
import 'package:story_view/story_view.dart';
import 'package:storyv2/core/constants/app_colors.dart';
import 'package:storyv2/core/constants/ui_constants.dart';
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
    return SafeArea(
      child: PageView.builder(
        scrollDirection: Axis.vertical,
        itemCount: 5,
        itemBuilder: (context, index) {
          return Stack(
            children: [
              // Positioned(
              //   top: 20,
              //   left: UIConstants.minPadding,
              //   right: UIConstants.minPadding,
              //   child: Row(
              //     children: [
              //       IconButton.filled(
              //         onPressed: () {},
              //         icon: Icon(AppIcons.explore),
              //       )
              //     ],
              //   ),
              // ),
              StoryView(
                storyItems: [
                  StoryItem.text(
                      title: 'Testing $index', backgroundColor: Colors.red),
                  StoryItem.text(
                      title: 'Testing', backgroundColor: Colors.blue),
                  StoryItem.inlineImage(
                    url:
                        "https://image.ibb.co/cU4WGx/Omotuo-Groundnut-Soup-braperucci-com-1.jpg",
                    controller: controller,
                    caption: Text(
                      "Omotuo & Nkatekwan; You will love this meal if taken as supper.",
                      style: TextStyle(
                        color: Colors.white,
                        backgroundColor: Colors.black54,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
                controller: controller,
                repeat: true,
                onStoryShow: ((item, storyIndex) => {}),
                onComplete: () {},
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
                      avtarUrl:
                          'https://i.pinimg.com/736x/48/1f/78/481f788038eecbe703a3ce959b03c91b.jpg',
                      userName: 'Mechamaru',
                      feedTime: 'a moment ago',
                      feedDescription:
                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
                    ),
                    Column(
                      children: [
                        ...feedOptions.map((option) {
                          return IconButton.filled(
                            highlightColor: AppColors.gray,
                            style: IconButton.styleFrom(
                              backgroundColor: AppColors.gray.withOpacity(0.5),
                            ),
                            icon: Icon(option.icon),
                            iconSize: 25,
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
      ),
    );
  }
}
