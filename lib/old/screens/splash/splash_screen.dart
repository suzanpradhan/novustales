import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart' as fr;
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:storyv2/old/helper/overlay_notification.dart';
import 'package:storyv2/old/providers/story_view_model.dart';
import 'package:storyv2/old/routes/route_name.dart';
import 'package:storyv2/old/routes/router_generator.dart';

import '../../config/internet_check.dart';
import '../../config/preference_utils.dart';
import '../../providers/auth_view_model.dart';
import '../../providers/common_view_model.dart';
import '../navigation/navigation.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late AuthViewModel _provider;

  final SharedPreferences localStorage = PreferenceUtils.instance;

  late CommonViewModel commonViewModel;
  late StoryViewModel storyViewModel;

  @override
  void initState() {
    _checkLogin();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      commonViewModel = Provider.of<CommonViewModel>(context, listen: false);
      storyViewModel = Provider.of<StoryViewModel>(context, listen: false);
      _provider = Provider.of<AuthViewModel>(context, listen: false);
      storyViewModel.fetchTrendingStory().then((value) {
        if (storyViewModel.storyPerCategory.length >= 3) {
          for (int i = 0; i < 3; i++) {
            storyViewModel.preload(
                storyViewModel.storyPerCategory[i]['media_url'], context);
          }
        }
      });
    });

    super.initState();
  }

  // 6250-330

  Future<void> _checkLogin() async {
    Timer(const Duration(seconds: 3), () async {
      if (localStorage.getString('token') != null) {
        RouteGenerator.replacePage(routeNavigation);
      } else {
        RouteGenerator.replacePage(routeOnBoarding);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: deviceHeight,
            width: deviceWidth,
            child: GridView.count(
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              shrinkWrap: true,
              mainAxisSpacing: 5,
              crossAxisSpacing: 5,
              childAspectRatio: .75,
              children: List.generate(6, (index) {
                return Container(
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: AssetImage("assets/images/R${index + 1}.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              }),
            ),
          ),
          Container(
            height: deviceHeight,
            width: deviceWidth,
            color: const Color(0xFF204051).withOpacity(.5),
            alignment: Alignment.center,
            child: const Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Welcome",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
                SizedBox(height: 100),
                SpinKitFadingCircle(color: Colors.white),
                SizedBox(height: 20),
                Text(
                  "Compiling stories around you...",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
