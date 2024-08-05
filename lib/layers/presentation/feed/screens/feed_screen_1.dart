import 'package:flutter/material.dart';
import 'package:storyv2/core/constants/app_colors.dart';
import 'package:storyv2/core/constants/ui_constants.dart';
import 'package:storyv2/layers/presentation/feed/utils/feed_options.dart';
import 'package:storyv2/layers/presentation/feed/widgets/feed_info.dart';

class FeedScreen extends StatefulWidget {
  const FeedScreen({super.key});

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen>
    with AutomaticKeepAliveClientMixin<FeedScreen> {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SafeArea(
      child: PageView.builder(
        scrollDirection: Axis.vertical,
        itemCount: 5,
        itemBuilder: (context, index) {
          return Stack(
            children: [
              Center(
                child: Text(
                  'Page $index',
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
                      avtarUrl:
                          'https://i.pinimg.com/736x/48/1f/78/481f788038eecbe703a3ce959b03c91b.jpg',
                      userName: 'Mechamaru',
                      feedTime: 'a moment age',
                      feedDescription:
                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
                    ),
                    Column(
                      children: [
                        ...feedOptions.map((option) {
                          return IconButton.filled(
                            highlightColor: AppColors.gray,
                            style: IconButton.styleFrom(
                              backgroundColor: AppColors.gray.withOpacity(0.8),
                            ),
                            icon: Icon(option.icon),
                            onPressed: () {},
                          );
                        }).toList(),
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
