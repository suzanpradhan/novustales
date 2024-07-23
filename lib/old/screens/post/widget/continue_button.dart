import 'package:flutter/material.dart';

import '../../../constants/app_color.dart';

class ContinueButton extends StatelessWidget {
  final String? text;
  final Function? onPressed;
  final Color? borderColor;
  final Color? color;
  final TextStyle? style;
  final Widget? icon;
  final Color? textColor;

  const ContinueButton(
      {super.key,
      this.text,
      this.onPressed,
      this.borderColor,
      this.color,
      this.style,
      this.icon,
      this.textColor});

  @override
  Widget build(BuildContext context) {
    // var locale = AppLocalizations.of(context);
    return Padding(
      padding: EdgeInsets.only(top: 16.0),
      child: TextButton.icon(
        style: TextButton.styleFrom(
          padding: EdgeInsets.symmetric(vertical: 16),
          backgroundColor: color ?? mainColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6.0),
            side: BorderSide(color: borderColor ?? Colors.transparent),
          ),
        ),
        icon: icon ?? SizedBox.shrink(),
        onPressed: onPressed as void Function()?,
        label: Text(
          text ?? "Continue Text",
          style: style ??
              Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(color: textColor ?? secondaryColor),
        ),
      ),
    );
  }
}
