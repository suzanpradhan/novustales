import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:storyv2/core/constants/app_colors.dart';
import 'package:storyv2/layers/domain/entities/story_entity.dart';

class MyStoryPage extends StatelessWidget {
  const MyStoryPage({
    super.key,
    this.stories = const <StoryEntity>[],
  });

  final List<StoryEntity>? stories;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 0.6,
      ),
      itemCount: stories!.length,
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.white,
              width: 0.1,
            ),
            color: AppColors.greyWhite,
          ),
          child: CachedNetworkImage(
            imageUrl: '${stories?[index].media}',
          ),
          // Image.network(
          //   '${stories?[index].media}',
          //   fit: BoxFit.cover,
          // ),
        );
      },
    );
  }
}
