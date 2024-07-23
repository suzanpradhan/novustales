import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:storyv2/old/constants/app_color.dart';
import 'package:storyv2/old/constants/font_size.dart';

showTopOverlayNotification(
    {String title = '',
    IconData icon = Icons.check_circle,
    Color color = Colors.green}) {
  return showSimpleNotification(
      SizedBox(
        height: 50.sp,
        width: double.infinity,
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Icon(
                icon,
                color: color,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              flex: 6,
              child: Text(
                title,
                style: TextStyle(
                    color: black,
                    fontWeight: FontWeight.w500,
                    fontSize: sfont_15),
              ),
            ),
          ],
        ),
      ),
      background: Colors.white);
}

showTopOverlayNotificationError({String title = ''}) {
  return showSimpleNotification(
      SizedBox(
        height: 50.sp,
        width: double.infinity,
        child: Row(
          children: [
            const Expanded(
              flex: 1,
              child: Icon(
                Icons.warning_outlined,
                color: Colors.red,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              flex: 6,
              child: Text(
                title,
                style: TextStyle(
                    color: grey_700,
                    fontWeight: FontWeight.w500,
                    fontSize: sfont_15),
              ),
            ),
          ],
        ),
      ),
      background: Colors.white);
}
