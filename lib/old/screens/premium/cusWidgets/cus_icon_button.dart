import 'package:flutter/material.dart';

class CusIconBtn extends StatelessWidget {
  final Function() onPressed;
  final Widget icon;

  const CusIconBtn({
    super.key,
    required this.onPressed,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      padding: EdgeInsets.zero,
      visualDensity: VisualDensity(horizontal: -4, vertical: -4),
      constraints: BoxConstraints(),
      icon: icon,
    );
  }
}
