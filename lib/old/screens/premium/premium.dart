import 'package:flutter/material.dart';
import 'package:storyv2/old/constants/app_color.dart';
import 'package:storyv2/old/constants/font_size.dart';
import 'package:storyv2/old/constants/font_weight.dart';
import 'package:storyv2/old/screens/premium/utils/int_extension.dart';
import 'package:storyv2/old/screens/premium/cusWidgets/gradient_scaffold.dart';
import 'package:storyv2/old/screens/premium/cusWidgets/image_builder.dart';
import 'package:storyv2/old/screens/premium/widget/premium_pop.dart';

class Premium extends StatelessWidget {
  const Premium({super.key});

  @override
  Widget build(BuildContext context) {
    return GradientScaffold(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 35),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ImageBuilder(
              height: 60.pW,
              width: 60.pW,
              imageProvider: const AssetImage("assets/icons/launcher.png"),
            ),
            Container(
              margin: EdgeInsets.only(top: 20.pH, bottom: 40.pH),
              child: Text(
                "Premium Stories",
                style: TextStyle(
                  fontSize: sfont_24,
                  fontWeight: kW8,
                  color: Colors.white,
                ),
              ),
            ),
            Text(
              "Lorem ipsum dolor sit amet,"
              "consectetur adipiscing elit, sed "
              "do eiusmod tempor incididunt"
              "ut labore et dolore magna aliqua.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: sfont_18,
                fontWeight: kW6,
                color: Colors.white,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 60.pH, bottom: 30.pH),
              child: ElevatedButton(
                onPressed: () => premiumPop(context),
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(double.maxFinite, 60.pH),
                  backgroundColor: storyBrown,
                ),
                child: Text(
                  "Join Premium",
                  style: TextStyle(
                    color: black,
                    fontSize: sfont_18,
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "\$--/ month",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: sfont_15,
                    color: white,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(4),
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                  decoration:
                      const BoxDecoration(color: white, shape: BoxShape.circle),
                ),
                Text(
                  "\$--/ year",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: sfont_15,
                    color: white,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(4),
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                  decoration:
                      const BoxDecoration(color: white, shape: BoxShape.circle),
                ),
                Text(
                  "Cancel anytime",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: sfont_15,
                    color: white,
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 35.pH, bottom: 10.pH),
              padding: EdgeInsets.only(
                left: 15.pW,
                right: 15.pW,
                top: 30.pH,
                bottom: 40.pH,
              ),
              width: double.maxFinite,
              decoration: BoxDecoration(
                color: black,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Why join Premium?",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: white,
                      fontSize: sfont_18,
                      fontWeight: kW6,
                      decoration: TextDecoration.underline,
                      decorationThickness: 2,
                      decorationColor: storyBrown,
                    ),
                  ),
                  const SizedBox(height: 10),
                  ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 4,
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 5),
                    itemBuilder: (context, index) {
                      return Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(3),
                            margin: const EdgeInsets.only(right: 8),
                            decoration: const BoxDecoration(
                              color: white,
                              shape: BoxShape.circle,
                            ),
                          ),
                          Text(
                            "Lorem ipsum dolor sit amet",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: sfont_14,
                              color: white,
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),
            Text(
              "Terms & Conditions",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: sfont_14,
                color: storyTeal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
