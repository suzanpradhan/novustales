import 'package:flutter/material.dart';
import 'package:storyv2/old/screens/premium/utils/int_extension.dart';
import 'package:storyv2/old/screens/premium/cusWidgets/cus_icon_button.dart';

import '../../../constants/app_color.dart';
import '../../../constants/font_size.dart';
import '../cusWidgets/image_builder.dart';

class NotificationCategory extends StatelessWidget {
  final String title;
  final int length;

  const NotificationCategory({
    super.key,
    required this.title,
    required this.length,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(color: white, fontSize: sfont_14),
        ),
        SizedBox(height: 20.pH),
        ...List.generate(length, (index) {
          return Padding(
            padding: EdgeInsets.only(bottom: index != length - 1 ? 15.pH : 0),
            child: Row(children: [
              ImageBuilder(
                height: 40.pW,
                width: 40.pW,
                fit: BoxFit.cover,
                circular: true,
                imageUrl:
                    "https://pixlr.com/images/index/ai-image-generator-one.webp",
              ),
              SizedBox(width: 15.pW),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "James just uploaded a new story",
                      style: TextStyle(color: white, fontSize: sfont_12),
                    ),
                    SizedBox(height: 3),
                    Text(
                      "3 hr ago",
                      style: TextStyle(color: grey2, fontSize: sfont_10),
                    ),
                  ],
                ),
              ),
              CusIconBtn(
                onPressed: () {},
                icon: Icon(Icons.more_vert_rounded, color: white, size: 16),
              ),
            ]),
          );
        }),
      ],
    );
  }
}
