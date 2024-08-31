import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';

class UserInfoCard extends StatelessWidget {
  const UserInfoCard({
    super.key,
    required this.title,
    required this.num,
  });
  final String title;
  final String num;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: RichText(
        text: TextSpan(
          text: '$num\n',
          style: TextStyle(
            fontFamily: 'Satoshi',
            fontSize: 18,
            fontWeight: FontWeight.w500,
            height: 1.2,
            color: AppColors.darkBlue,
          ),
          children: [
            TextSpan(
              text: title,
              style: TextStyle(
                fontFamily: 'Satoshi',
                fontSize: 13,
                fontWeight: FontWeight.normal,
                color: Color(0xff414357),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
