import 'package:flutter/material.dart';
import 'package:storyv2/old/constants/app_color.dart';
import 'package:storyv2/old/constants/font_size.dart';
import 'package:storyv2/old/routes/route_name.dart';
import 'package:storyv2/old/screens/premium/models/war_model.dart';
import 'package:storyv2/old/screens/premium/parameters/war_param.dart';
import 'package:storyv2/old/screens/premium/utils/int_extension.dart';
import 'package:storyv2/old/screens/premium/cusWidgets/image_builder.dart';

class WarItem extends StatelessWidget {
  final WarModel war;
  const WarItem({super.key, required this.war});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => war.type == "vs"
          ? Navigator.pushNamed(
              context,
              routeBattleOverview,
              arguments: WarParam(war: war, type: "followed"),
            )
          : Navigator.pushNamed(
              context,
              routeCommunityWars,
              arguments: WarParam(war: war, type: "followed"),
            ),
      child: Container(
        width: 50.pW,
        constraints: BoxConstraints(maxWidth: 100.pW),
        child: Column(
          children: [
            Container(
              height: 50.pW,
              width: 50.pW,
              decoration: BoxDecoration(
                border: Border.all(color: storyBrown),
                shape: BoxShape.circle,
              ),
              child: ImageBuilder(
                height: 50.pW,
                width: 50.pW,
                fit: BoxFit.cover,
                circular: true,
                imageUrl: war.thumbnailUrl,
              ),
            ),
            SizedBox(height: 3),
            Text(
              "${war.createdBy.firstName} ${war.createdBy.firstName}",
              overflow: TextOverflow.ellipsis,
              style: TextStyle(color: white, fontSize: sfont_10),
            )
          ],
        ),
      ),
    );
  }
}
