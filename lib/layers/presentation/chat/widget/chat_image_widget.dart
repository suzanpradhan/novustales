import 'dart:developer';

import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/assets.dart';
import '../../../../core/presentation/widgets/image_widget.dart';

class ChatImageWidget extends StatelessWidget {
  final List<String> imageUrls;

  const ChatImageWidget({super.key, required this.imageUrls});

  @override
  Widget build(BuildContext context) {
    Widget imageWidget(image) {
      log(image);
      return SizedBox(
        height: double.maxFinite,
        width: double.maxFinite,
        child: ImageWidget(
          imageUrl: image,
          placeholderColor: AppColors.white,
          fit: BoxFit.cover,
          placeholder: (image == null || image!.isEmpty)
              ? Image.asset(
                  Assets.noProfile,
                )
              : SizedBox(),
        ),
      );
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        if (imageUrls.length == 1) {
          return imageWidget(imageUrls[0]);
        } else if (imageUrls.length == 2) {
          return Row(
            children: [
              Expanded(child: imageWidget(imageUrls[0])),
              Expanded(child: imageWidget(imageUrls[1])),
            ],
          );
        } else if (imageUrls.length == 3) {
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
