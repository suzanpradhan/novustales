import 'package:flutter/material.dart';

import '../../../constants/app_color.dart';
import '../../../constants/font_size.dart';

class CusOutB extends StatelessWidget {
  final Function() onPressed;
  final EdgeInsets? padding;
  final Color? backgroundColor;
  final BorderRadius? borderRadius;
  final String text;
  final TextStyle? textStyle;

  const CusOutB({
    super.key,
    required this.onPressed,
    this.padding,
    this.backgroundColor,
    this.borderRadius,
    required this.text,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        padding: padding ?? EdgeInsets.symmetric(vertical: 8, horizontal: 15),
        visualDensity: VisualDensity(horizontal: -4, vertical: -4),
        foregroundColor: white,
        backgroundColor: backgroundColor,
        side: const BorderSide(color: white, width: 2),
        shape: RoundedRectangleBorder(
            borderRadius: borderRadius ?? BorderRadius.circular(100)),
      ),
      child: Text(text, style: textStyle ?? TextStyle(fontSize: sfont_10)),
    );
  }
}
