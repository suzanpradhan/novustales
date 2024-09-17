import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/assets.dart';
import '../../../../core/presentation/widgets/image_widget.dart';

class ChatImageWidget extends StatelessWidget {
  final List<String> imageUrls;

  const ChatImageWidget({Key? key, required this.imageUrls}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget imageWidget(image) {
      return ImageWidget(
        imageUrl: image,
        placeholderColor: AppColors.white,
        placeholder: (image == null || image!.isEmpty)
            ? Image.asset(
                Assets.noProfile,
                fit: BoxFit.cover,
              )
            : SizedBox(),
      );
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        double width = constraints.maxWidth;
        double height = constraints.maxHeight;

        if (imageUrls.length == 1) {
          // One image: full screen
          return imageWidget(imageUrls[0]);
        } else if (imageUrls.length == 2) {
          // Two images: each takes half of the width
          return Row(
            children: [
              Expanded(child: imageWidget(imageUrls[0])),
              Expanded(child: imageWidget(imageUrls[1])),
            ],
          );
        } else if (imageUrls.length == 3) {
          // Three images: two on top, one on bottom
          return Column(
            children: [
              Expanded(
                child: Row(
                  children: [
                    Expanded(child: imageWidget(imageUrls[0])),
                    Expanded(child: imageWidget(imageUrls[1])),
                  ],
                ),
              ),
              Expanded(
                child: imageWidget(imageUrls[2]),
              ),
            ],
          );
        } else {
          // Four or more images: 2x2 grid
          return GridView.builder(
            itemCount: imageUrls.length > 4 ? 4 : imageUrls.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1,
            ),
            itemBuilder: (context, index) {
              return imageWidget(imageUrls[index]);
            },
          );
        }
      },
    );
  }
}
