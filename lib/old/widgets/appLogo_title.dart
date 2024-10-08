import 'package:flutter/material.dart';
import 'package:storyv2/old/constants/app_color.dart';
import 'package:storyv2/old/widgets/app_logo.dart';

import '../constants/text_style.dart';

class AppLogoTitle extends StatelessWidget {
  bool whites;

  AppLogoTitle({super.key, required this.whites});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        appLogoWidget(),
        const SizedBox(
          width: 15,
        ),
        Text("Story", style: w6f24cwdI.copyWith(color: whites ? white : black))
      ],
    );
  }
}
