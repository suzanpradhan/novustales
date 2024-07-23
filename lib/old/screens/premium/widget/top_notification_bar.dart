import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:storyv2/old/providers/auth_view_model.dart';
import 'package:storyv2/old/routes/route_name.dart';
import 'package:storyv2/old/screens/premium/utils/int_extension.dart';
import 'package:storyv2/old/screens/premium/cusWidgets/cus_icon_button.dart';

import '../../../constants/app_color.dart';
import '../cusWidgets/image_builder.dart';

class TopNotificationBar extends StatelessWidget {
  final bool showBackButton;
  const TopNotificationBar({super.key, required this.showBackButton});

  @override
  Widget build(BuildContext context) {
    Widget child = Row(
      mainAxisSize: showBackButton ? MainAxisSize.min : MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        CusIconBtn(
          onPressed: () => Navigator.pushNamed(context, routeSearchUserWar),
          icon: Icon(Icons.search, color: white, size: 28.pW),
        ),
        Container(
          margin: const EdgeInsets.only(right: 10),
          child: CusIconBtn(
            onPressed: () => Navigator.pushNamed(context, routeNotifications),
            icon: Icon(Icons.notifications_rounded, color: white, size: 28.pW),
          ),
        ),
        Consumer<AuthViewModel>(builder: (context, model, widget) {
          String image = model.userData["avatar"] ?? "";

          return InkWell(
            onTap: () => Navigator.pushNamed(context, routeUserProfile),
            child: ImageBuilder(
              height: 25.pW,
              width: 25.pW,
              fit: BoxFit.cover,
              circular: true,
              imageUrl: image,
            ),
          );
        })
      ],
    );

    if (showBackButton) {
      child = Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CusIconBtn(
            onPressed: () => Navigator.pop(context),
            icon: Icon(Icons.arrow_back, color: white, size: 25),
          ),
          child,
        ],
      );
    }

    return Container(
      margin: EdgeInsets.symmetric(vertical: 20.pH, horizontal: 20.pW),
      child: child,
    );
  }
}
