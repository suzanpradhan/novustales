import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:storyv2/core/constants/app_colors.dart';
import 'package:storyv2/core/constants/ui_constants.dart';
import 'package:storyv2/core/routes/app_routes.dart';
import 'package:video_player/video_player.dart';

import '../../../../core/constants/assets.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  late VideoPlayerController _videoPlayerController;

  @override
  void initState() {
    super.initState();
    _videoPlayerController =
        VideoPlayerController.asset(Assets.welcomBackground)
          ..setLooping(true)
          ..setVolume(0)
          ..setPlaybackSpeed(0.5)
          ..initialize().then((value) {
            setState(() {
              _videoPlayerController.play();
            });
          });
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.purpleAccent,
      body: Stack(
        children: [
          Positioned(
            top: 0,
            child: SizedBox(
              height: MediaQuery.of(context).size.height / 1.2,
              child: AspectRatio(
                  aspectRatio: _videoPlayerController.value.aspectRatio,
                  child: Stack(
                    children: [
                      VideoPlayer(_videoPlayerController),
                      Positioned(
                        child: Container(
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                AppColors.purpleAccent.withOpacity(0.8),
                                AppColors.purpleAccent.withOpacity(0.8),
                                AppColors.purpleAccent
                              ])),
                        ),
                      ),
                    ],
                  )),
            ),
          ),
          SafeArea(
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
                  InkWell(
                    onTap: () {
                      context.push(LOGIN_ROUTE);
                    },
                    child: Container(
                      height: 50,
                      padding:
                          EdgeInsets.symmetric(horizontal: UIConstants.padding),
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
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
