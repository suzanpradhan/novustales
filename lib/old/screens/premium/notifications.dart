import 'package:flutter/material.dart';
import 'package:storyv2/old/constants/app_color.dart';
import 'package:storyv2/old/constants/font_size.dart';
import 'package:storyv2/old/screens/premium/utils/int_extension.dart';
import 'package:storyv2/old/screens/premium/cusWidgets/cus_icon_button.dart';
import 'package:storyv2/old/screens/premium/cusWidgets/gradient_scaffold.dart';
import 'package:storyv2/old/screens/premium/widget/notification_category.dart';
import 'package:storyv2/old/screens/premium/cusWidgets/outlined_button.dart';

class Notifications extends StatelessWidget {
  const Notifications({super.key});

  @override
  Widget build(BuildContext context) {
    return GradientScaffold(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.pW, vertical: 20.pH),
        child: Column(
          children: [
            Row(
              children: [
                CusIconBtn(
                  onPressed: () => Navigator.pop(context),
                  icon: Icon(Icons.arrow_back, color: white),
                ),
                SizedBox(width: 20),
                Text("Notifications",
                    style: TextStyle(color: white, fontSize: sfont_20))
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 35.pH, bottom: 30.pH),
              width: double.maxFinite,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    CusOutB(
                      onPressed: () {},
                      backgroundColor: storyBrown,
                      borderRadius: BorderRadius.circular(8),
                      text: "All",
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 20.pW, right: 10.pW),
                      child: CusOutB(
                        onPressed: () {},
                        borderRadius: BorderRadius.circular(8),
                        text: "Mentions",
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 10.pW, right: 20.pW),
                      child: CusOutB(
                        onPressed: () {},
                        borderRadius: BorderRadius.circular(8),
                        text: "Invites",
                      ),
                    ),
                    CusOutB(
                      onPressed: () {},
                      borderRadius: BorderRadius.circular(8),
                      text: "Winners",
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    NotificationCategory(title: "Today", length: 3),
                    SizedBox(height: 25.pH),
                    NotificationCategory(title: "This Week", length: 3),
                    SizedBox(height: 25.pH),
                    NotificationCategory(title: "Old", length: 4),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
