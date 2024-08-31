import 'package:flutter/material.dart';

import '../../../../core/constants/ui_constants.dart';

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
  final IconData icon;

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
        child: Column(
          children: [
            Icon(
              icon,
              size: 24,
            ),
            SizedBox(height: UIConstants.xminPadding),
            if (currentTab == tabKey)
              Container(
                width: 60,
                height: 2,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.onSecondary,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
