import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final Widget child;
  final Color color;
  final double paddingAll;
  const CustomCard(
      {super.key,
      required this.color,
      required this.child,
      this.paddingAll = 12.0});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
          side: BorderSide(
              // border color
              color: color,
              // border thickness
              width: 2),
          borderRadius: const BorderRadius.all(Radius.circular(20.0))),
      child: Padding(
        padding: EdgeInsets.all(paddingAll),
        child: child,
      ),
    );
  }
}
