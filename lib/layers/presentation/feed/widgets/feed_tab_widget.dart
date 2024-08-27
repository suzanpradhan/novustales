import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/ui_constants.dart';

class FeedTabWidget extends StatelessWidget {
  final String currentTab;
  final String tabKey;
  final Function(String)? onChange;
  final Color chipColor;
  final Color selectedTextColor;
  final Color unselectedTextColor;
  const FeedTabWidget({
    super.key,
    required this.currentTab,
    required this.tabKey,
    required this.onChange,
    this.chipColor = AppColors.dark,
    this.selectedTextColor = AppColors.white,
    this.unselectedTextColor = AppColors.black,
  });

  String tabKeyToTitle(String text) {
    return text
        .split('_')
        .map((word) => word.isNotEmpty
            ? word[0].toUpperCase() + word.substring(1).toLowerCase()
            : '')
        .join(' ');
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (onChange != null) {
          onChange!(tabKey);
        }
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: UIConstants.maxPadding),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(42),
          color: currentTab == tabKey ? chipColor : null,
          border: Border.all(
            color: currentTab == tabKey ? AppColors.dark : AppColors.gray,
          ),
        ),
        child: Center(
          child: Text(
            tabKeyToTitle(tabKey),
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: currentTab == tabKey
                      ? selectedTextColor
                      : unselectedTextColor,
                ),
          ),
        ),
      ),
    );
  }
}
