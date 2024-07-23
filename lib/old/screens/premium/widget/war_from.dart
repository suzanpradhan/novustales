import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:storyv2/old/screens/premium/models/war_model.dart';
import 'package:storyv2/old/screens/premium/utils/int_extension.dart';
import 'package:storyv2/old/screens/premium/cusWidgets/cus_icon_button.dart';

import '../../../constants/app_color.dart';
import '../../../constants/font_size.dart';
import '../cusWidgets/image_builder.dart';

class WarFrom extends StatelessWidget {
  final WarModel war;
  const WarFrom({super.key, required this.war});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          flex: 2,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              InkWell(
                child: ImageBuilder(
                  height: 35.pW,
                  width: 35.pW,
                  circular: true,
                  imageUrl: war.createdBy.avatar,
                ),
              ),
              Text(war.createdBy.nickName,
                  style: TextStyle(color: white, fontSize: sfont_8))
            ],
          ),
        ),
        Flexible(
          flex: 3,
          child: Container(
            margin: EdgeInsets.only(left: 5.pW),
            width: double.maxFinite,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  war.title,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: white, fontSize: sfont_10),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  margin: EdgeInsets.only(top: 3),
                  decoration: BoxDecoration(
                    color: grey1,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Text("Sports",
                      style: TextStyle(color: white, fontSize: sfont_10)),
                )
              ],
            ),
          ),
        ),
        Flexible(
          flex: 1,
          child: Align(
            alignment: Alignment.centerRight,
            child: CusIconBtn(
              onPressed: () {},
              icon: FaIcon(FontAwesomeIcons.share, color: white, size: 18.pW),
            ),
          ),
        )
      ],
    );
  }
}
