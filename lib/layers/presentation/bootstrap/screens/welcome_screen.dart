import 'package:flutter/material.dart';
import 'package:storyv2/core/constants/app_colors.dart';
import 'package:storyv2/core/constants/ui_constants.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.purpleAccent,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(UIConstants.maxPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  SizedBox(
                    height: 42,
                  ),
                  Text(
                    "Meet,\nShare,\nand\nExplore",
                    style: TextStyle(
                        fontFamily: "RalewayBlack",
                        color: AppColors.white,
                        height: 1.2,
                        fontSize: 62),
                  ),
                  SizedBox(
                    height: UIConstants.padding,
                  ),
                  Text(
                    "Explore popular spots, hidden gems, and upcoming events. Find your next adventure now!",
                    style: TextStyle(
                        fontFamily: "SatoshiRegular",
                        fontSize: 16,
                        color: AppColors.white),
                  ),
                ],
              ),
              Container(
                height: 50,
                padding: EdgeInsets.symmetric(horizontal: UIConstants.padding),
                decoration: BoxDecoration(
                    color: AppColors.black,
                    borderRadius:
                        BorderRadius.circular(UIConstants.borderRadius)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      "Get Started",
                      style: TextStyle(
                          fontFamily: "Satoshi",
                          color: AppColors.white,
                          fontSize: 16),
                    ),
                    Icon(
                      Icons.arrow_right_alt_sharp,
                      color: AppColors.white,
                      size: 32,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
