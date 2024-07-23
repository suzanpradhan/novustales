import 'package:flutter/material.dart';
import 'package:storyv2/old/screens/premium/utils/int_extension.dart';

import '../../../constants/app_color.dart';
import '../../../constants/font_size.dart';
import '../cusWidgets/image_builder.dart';

class UserSelection extends StatelessWidget {
  final String image;
  final String name;
  final Function()? onTap;
  final bool add;

  const UserSelection({
    super.key,
    required this.image,
    required this.name,
    this.onTap,
    this.add = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ImageBuilder(
          height: 40.pW,
          width: 40.pW,
          fit: BoxFit.cover,
          circular: true,
          imageUrl: image,
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 8),
          child: Text(name, style: TextStyle(color: white, fontSize: sfont_16)),
        ),
        InkWell(
          onTap: onTap,
          child: Container(
            height: 25.pW,
            width: 25.pW,
            decoration: BoxDecoration(
              color: red1,
              border: Border.all(color: white),
              shape: BoxShape.circle,
            ),
            alignment: Alignment.center,
            child: Icon(
              add ? Icons.add_rounded : Icons.close_rounded,
              color: white,
              size: 10,
            ),
          ),
        )
      ],
    );
  }
}
