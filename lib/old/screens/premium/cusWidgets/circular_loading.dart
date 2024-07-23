import 'package:flutter/cupertino.dart' show CupertinoActivityIndicator;
import 'package:flutter/material.dart';

import '../../../constants/app_color.dart';

class Loading extends StatelessWidget {
  final double size;
  final Color color;
  final bool cupertino;
  const Loading({
    super.key,
    this.size = 25,
    this.color = storyBrown,
    this.cupertino = false,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: size,
        width: size,
        child: cupertino
            ? CupertinoActivityIndicator(color: color)
            : CircularProgressIndicator(color: color, strokeWidth: 1),
      ),
    );
  }
}
