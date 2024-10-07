import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:storyv2/old/constants/text_style.dart';
import 'package:storyv2/old/routes/router_generator.dart';

class CustomAppBar extends StatelessWidget {
  final Widget bottom;
  final List<Widget> actions;
  final String title;
  final String? subTitle;
  final bool hasBackIcon;
  const CustomAppBar(
      {super.key,
      this.bottom = const SizedBox(),
      this.title = '',
      this.subTitle,
      this.hasBackIcon = true,
      this.actions = const []});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 3,
      leading: hasBackIcon
          ? Padding(
              padding: EdgeInsets.only(top: 20.0.sp),
              child: InkWell(
                onTap: () {
                  RouteGenerator.goBack();
                },
                child: Padding(
                  padding: EdgeInsets.all(8.0.sp),
                  child: const Icon(Icons.arrow_back_ios),
                ),
              ),
            )
          : const SizedBox(),
      titleSpacing: 0,
      title: Padding(
        padding: EdgeInsets.only(top: 28.0.sp),
        child: Column(
          children: [
            Text(title,
                style: basicStyle.copyWith(fontWeight: FontWeight.w600)),
            subTitle != null
                ? Text(subTitle!, style: basicStyle.copyWith(fontSize: 14.sp))
                : const SizedBox(),
          ],
        ),
      ),
      actions: actions,
      bottom: PreferredSize(
          preferredSize: Size.fromHeight(
              108.0.sp - MediaQuery.of(context).viewPadding.top.sp),
          child: bottom),
    );
  }
}
