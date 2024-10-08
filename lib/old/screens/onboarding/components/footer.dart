import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:storyv2/old/routes/route_name.dart';
import 'package:storyv2/old/routes/router_generator.dart';
import 'package:storyv2/old/widgets/appLogo_title.dart';

import '../../../constants/app_color.dart';
import '../../../constants/text_style.dart';
import '../../../widgets/custom_button.dart';

class Footer extends StatefulWidget {
  const Footer({super.key});

  @override
  State<Footer> createState() => _FooterState();
}

class _FooterState extends State<Footer> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
        bottom: 10.sp,
        child: SizedBox(
          width: MediaQuery.of(context).size.width.sp,
          height: 250.sp,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 35.sp),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppLogoTitle(whites: true),
                    SizedBox(
                      height: 30.sp,
                    ),
                    Container(
                      height: 3.sp,
                      width: 80.sp,
                      color: buttonColor,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Center(
                  // alignment: Alignment.center,
                  child: Text(
                      "Lorem ipsum dolor sit amet \nconsectetur adipiscing elit",
                      style: w6f16cw,
                      textAlign: TextAlign.center)),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: EdgeInsets.only(right: 50.sp, left: 35.sp),
                child: Row(
                  children: [
                    Expanded(
                      child: CustomButton(
                        buttonName: "Sign In",
                        onTap: () {
                          RouteGenerator.navigateTo(routeLogin);
                        },
                        hasBorder: true,
                        border: Border.all(color: Colors.red, width: 2),
                      ),
                    ),
                    SizedBox(
                      width: 20.sp,
                    ),
                    Expanded(
                      child: CustomButton(
                        buttonName: "Register",
                        hasBorder: false,
                        containerColor: buttonColor,
                        onTap: () {
                          RouteGenerator.navigateTo(routeRegister);
                        },
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
