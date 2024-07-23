import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/app_image.dart';

Widget appLogoWidget({double? height, double? width}) {
  return Image.asset(
    appLogo,
    height: height ?? 50.sp,
    width: width ?? 50.sp,
  );
}
