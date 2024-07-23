import 'package:flutter/material.dart';
import 'package:storyv2/old/providers/common_view_model.dart';

import '../../../constants/app_color.dart';
import '../../../constants/app_image.dart';

class BottomBar extends StatelessWidget {
  CommonViewModel common;
  BottomBar({super.key, required this.common});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(),
      child: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        backgroundColor: Colors.white,
        onTap: common.itemTapped,
        unselectedFontSize: 0.0,
        selectedFontSize: 0.0,
        elevation: 3,
        selectedItemColor: black,
        unselectedItemColor: black,
        currentIndex: common.navigationIndex,
        selectedLabelStyle: const TextStyle(color: black),
        unselectedLabelStyle: const TextStyle(color: black),
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(bottomHome,
                height: 20,
                width: 20,
                color: getColorBasedOnCondition(common.navigationIndex == 0)),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(bottomMenu,
                height: 20,
                width: 20,
                color: getColorBasedOnCondition(common.navigationIndex == 1)),
            label: "Chat",
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              bottomAdd,
              height: 20,
              width: 20,
              color: getColorBasedOnCondition(common.navigationIndex == 2),
            ),
            label: "Add",
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              bottomPin,
              height: 22,
              width: 22,
              color: getColorBasedOnCondition(common.navigationIndex == 3),
            ),
            label: "Follow",
          ),
          BottomNavigationBarItem(
            icon: Image.asset("assets/icons/profile_user.png",
                height: 22,
                width: 22,
                color: getColorBasedOnCondition(common.navigationIndex == 4)),
            label: "Account",
          ),
        ],
      ),
    );
  }
}

Color? getColorBasedOnCondition(bool condition) {
  return condition ? const Color(0xFF3FA3FF) : Colors.grey[600];
}
