import 'package:flutter/material.dart';

import '../../../constants/app_color.dart';
import '../../../constants/font_size.dart';

class StoryStatus extends StatelessWidget {
  final String view;
  const StoryStatus({super.key, required this.view});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 5, vertical: 2),
          decoration: BoxDecoration(
            color: black.withOpacity(.5),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Ongoing ",
                  style: TextStyle(color: white, fontSize: sfont_8)),
              CircleAvatar(radius: 5, backgroundColor: solidRed2)
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 5, vertical: 2),
          decoration: BoxDecoration(
            color: black.withOpacity(.5),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Text("$view Views",
              style: TextStyle(color: white, fontSize: sfont_8)),
        )
      ],
    );
  }
}
