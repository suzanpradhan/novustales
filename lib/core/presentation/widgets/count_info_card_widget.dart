import 'package:flutter/material.dart';

import '../ui/spacer.dart';

class CountInfoCardWidget extends StatelessWidget {
  const CountInfoCardWidget({
    super.key,
    required this.text1,
    required this.text2,
  });
  final Text text1;
  final Text text2;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: 1,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [text1, Gapper.v2xmGap(), text2],
        ));
  }
}
