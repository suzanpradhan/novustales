import 'package:flutter/material.dart';
import 'package:storyv2/old/routes/route_name.dart';
import 'package:storyv2/old/screens/premium/parameters/war_param.dart';
import 'package:storyv2/old/screens/premium/utils/int_extension.dart';
import 'package:storyv2/old/screens/premium/cusWidgets/image_builder.dart';
import 'package:storyv2/old/screens/premium/widget/story_status.dart';
import 'package:storyv2/old/screens/premium/widget/war_from.dart';

import '../models/war_model.dart';
import '../utils/injection.dart';

class War extends StatelessWidget {
  final WarModel war;
  final bool isVS;
  final bool storyStatus;
  const War(
      {super.key,
      required this.war,
      this.isVS = false,
      this.storyStatus = true});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: (sCon.width - 90.pW) / 2,
      child: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              InkWell(
                onTap: () => isVS
                    ? Navigator.pushNamed(
                        context,
                        routeBattleOverview,
                        arguments: WarParam(war: war, type: "vs"),
                      )
                    : Navigator.pushNamed(
                        context,
                        routeCommunityWars,
                        arguments: WarParam(war: war, type: "community"),
                      ),
                child: ImageBuilder(
                  width: (sCon.width - 90.pW) / 2,
                  height: 150.pH,
                  fit: BoxFit.cover,
                  imageUrl: war.thumbnailUrl,
                ),
              ),
              if (storyStatus)
                Positioned(
                  width: 164.pW,
                  top: 10.pH,
                  child: StoryStatus(view: war.totalViews.toString()),
                ),
            ],
          ),
          SizedBox(height: 10.pH),
          WarFrom(war: war),
        ],
      ),
    );
  }
}
