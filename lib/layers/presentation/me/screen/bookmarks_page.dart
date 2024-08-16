import 'package:flutter/material.dart';
import 'package:storyv2/core/constants/app_colors.dart';

class BookmarksPage extends StatelessWidget {
  const BookmarksPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 0.6,
      ),
      itemCount: 2,
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.white,
              width: 0.1,
            ),
            color: AppColors.greyWhite,
          ),
          child: Center(
            child: Text('Bookmark $index'),
          ),
        );
      },
    );
  }
}
