import 'package:flutter/material.dart';

import '../../../constants/app_color.dart';

class GradientScaffold extends StatelessWidget {
  final Widget child;
  const GradientScaffold({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
              colors: [storyTeal.withOpacity(.2), Colors.transparent],
            ),
          ),
          child: Container(
            height: double.maxFinite,
            width: double.maxFinite,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [storyBrown.withOpacity(.2), Colors.transparent],
              ),
            ),
            child: child,
          ),
        ),
      ),
    );
  }
}
