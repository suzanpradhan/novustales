import 'package:flutter/material.dart';

import '../../../../core/presentation/ui/number_to_string.dart';

class UserInfoCard extends StatelessWidget {
  const UserInfoCard({
    super.key,
    required this.title,
    required this.count,
  });
  final String title;
  final int count;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: RichText(
        text: TextSpan(
          text: "${numberToString(count)}\n",
          style: Theme.of(context).textTheme.bodyLarge,
          children: [
            TextSpan(
              text: title,
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
      ),
    );
  }
}
