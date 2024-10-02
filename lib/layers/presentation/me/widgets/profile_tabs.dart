import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/presentation/ui/spacer.dart';

class ProfileTabs extends StatelessWidget {
  const ProfileTabs({
    super.key,
    this.onChange,
    required this.icon,
    required this.tabKey,
    required this.currentTab,
  });

  final Function(String)? onChange;
  final String tabKey;
  final String currentTab;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: InkWell(
        onTap: () {
          if (onChange != null) {
            onChange!(tabKey);
          }
        },
        child: Stack(
          children: [
            Gapper.cardPadding(
              child: Center(child: icon),
            ),
            if (currentTab == tabKey)
              Positioned(
                bottom: 0,
                right: 50,
                left: 50,
                // child: Container(
                //   height: 2,
                //   decoration: BoxDecoration(
                //     color: Theme.of(context).colorScheme.onSecondary,
                //   ),
                // ),
                child: Divider(
                  height: 0.0,
                  thickness: 2,
                  color: AppColors.purpleAccent,
                ),
              )
          ],
        ),
      ),
    );
  }
}
