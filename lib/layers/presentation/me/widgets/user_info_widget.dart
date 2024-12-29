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
      child: Column(
        // text: TextSpan(

        //   text: "${numberToString(count)}\n",
        //   style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: AppColors.white),
        //   children: [
        //     TextSpan(
        //       text: title,
        //       style: Theme.of(context).textTheme.bodySmall,
        //     ),
        //   ],
        // ),
        children: [
          Text(
            "${numberToString(count)}\n",
            style: Theme.of(context).textTheme.displayLarge!.copyWith(
                  fontSize: 36,
                  height: 0.6,
                ),
          ),
          Text(title, style: Theme.of(context).textTheme.titleSmall),
        ],
      ),
    );
  }
}
