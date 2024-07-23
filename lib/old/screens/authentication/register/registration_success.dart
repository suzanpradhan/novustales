import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:storyv2/old/constants/app_color.dart';
import 'package:storyv2/old/routes/route_name.dart';
import 'package:storyv2/old/routes/router_generator.dart';

import '../../../constants/text_style.dart';
import '../../../widgets/app_logo.dart';
import '../../../widgets/custom_button.dart';

class RegistrationSuccess extends StatelessWidget {
  const RegistrationSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.sp),
          child: SizedBox(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 100.sp,
                ),
                appLogoWidget(height: 50, width: 50),
                SizedBox(
                  height: 10.sp,
                ),
                Text("Story",
                    style: w6f24cwdI.copyWith(fontSize: 22, color: black)),
                SizedBox(
                  height: 60.sp,
                ),
                Image.asset(
                  "assets/images/check-circle.png",
                  height: 60,
                  width: 60,
                ),
                SizedBox(
                  height: 60.sp,
                ),
                Text(
                  "Your Account has been created",
                  style: basicStyle.copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 17),
                ),
                SizedBox(
                  height: 10.sp,
                ),
                Text(
                  "Successfully",
                  style: basicStyle.copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      fontSize: 18),
                ),
                SizedBox(
                  height: 25.sp,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  child: CustomButton(
                      buttonName: "Continue to Sign in",
                      hasBorder: false,
                      width: 200,
                      containerColor: const Color(0xFF58ADCA),
                      onTap: () {
                        RouteGenerator.replacePage(routeLogin);
                      }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
