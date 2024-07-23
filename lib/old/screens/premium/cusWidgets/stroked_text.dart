import 'package:flutter/material.dart';

import '../../../constants/app_color.dart';

class StrokedText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  const StrokedText({
    super.key,
    required this.text,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        if (style != null)
          Text(
            text,
            style: style!.copyWith(
              foreground: Paint()
                ..style = PaintingStyle.stroke
                ..strokeWidth = 2
                ..color = black,
            ),
          ),
        Text(text, style: style),
      ],
    );
  }
}
