import 'package:flutter/material.dart';

class SizeConfig {
  static MediaQueryData? _mediaQueryData;
  static double? screenWidth;
  static double? screenHeight;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData?.size.width;
    screenHeight = _mediaQueryData?.size.height;
  }
}

screenHeight(double inputHeight) {
  double? screenHeight = SizeConfig.screenHeight;
  var adjustedHeight = (inputHeight / 812.0) * screenHeight!;
  return adjustedHeight;
}

double screenWidth(double inputWidth) {
  double? screenWidth = SizeConfig.screenWidth;
  double adjustedWidth = (inputWidth / 375.0) * screenWidth !;
  return adjustedWidth;
}
