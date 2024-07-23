import 'package:flutter/material.dart';
import 'package:storyv2/old/screens/premium/utils/int_extension.dart';

import '../../../constants/app_color.dart';
import '../../../constants/font_size.dart';
import '../../../constants/font_weight.dart';

premiumPop(BuildContext context) {
  showDialog(
    context: context,
    builder: (builder) => AlertDialog(
      backgroundColor: black,
      scrollable: true,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      content: Column(
        children: [
          Text(
            "Premium Stories",
            style: TextStyle(
              fontSize: sfont_20,
              fontWeight: kW8,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 30.pH),
          Text(
            "Lorem ipsum dolor sit amet,"
            "consectetur adipiscing elit, sed "
            "do eiusmod tempor incididunt"
            "ut labore et dolore magna aliqua.",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: sfont_16,
              fontWeight: kW6,
              color: Colors.white,
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 45.pH),
            child: Text(
              "\$ -- / month",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: sfont_14,
                color: white,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              backgroundColor: storyBrown,
            ),
            child: Text(
              "Buy Premium",
              style: TextStyle(
                color: black,
                fontSize: sfont_14,
              ),
            ),
          ),
          const SizedBox(height: 5),
          Text(
            "Learn More",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: sfont_10,
              color: storyTeal,
            ),
          ),
        ],
      ),
    ),
  );
}
