import 'package:flutter/material.dart';
import 'package:storyv2/layers/presentation/feed/utils/feed_options.dart';
import 'package:storyv2/layers/presentation/feed/widgets/feed_info.dart';

class FeedScreen extends StatelessWidget {
  const FeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
                  left: 8,
                  right: 8,
                  child: Row(
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
                            return IconButton(
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
      ),
    );
  }
}
