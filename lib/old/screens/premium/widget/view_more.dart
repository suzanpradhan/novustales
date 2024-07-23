import 'package:flutter/material.dart';
import 'package:storyv2/old/screens/premium/cusWidgets/outlined_button.dart';

import '../../../constants/app_color.dart';
import '../../../constants/font_size.dart';
import '../../../constants/font_weight.dart';

class ViewMore extends StatelessWidget {
  final EdgeInsets margin;
  final String title;
  final Function() onMoreClick;

  const ViewMore({
    super.key,
    required this.margin,
    required this.title,
    required this.onMoreClick,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title,
              style:
                  TextStyle(color: white, fontSize: sfont_14, fontWeight: kW5)),
          CusOutB(onPressed: onMoreClick, text: "More"),
        ],
      ),
    );
  }
}
