import 'package:flutter/material.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/constants/assets.dart';
import '../../../../../core/constants/ui_constants.dart';
import '../../../../../core/presentation/ui/spacer.dart';
import '../Image_card.dart';

class StoriesCardTabWidget extends StatefulWidget {
  const StoriesCardTabWidget({super.key});

  @override
  State<StoriesCardTabWidget> createState() => _StoriesCardTabWidgetState();
}

class _StoriesCardTabWidgetState extends State<StoriesCardTabWidget> {
  @override
  Widget build(BuildContext context) {
    return Gapper.screenPadding(
      child: LayoutBuilder(
        builder: (context, constraints) {
          int crossAxisCount;
          if (constraints.maxWidth >= 768) {
            crossAxisCount = 4;
          } else {
            crossAxisCount = 2;
          }

          // Constants
          const spacing = UIConstants.xminPadding;

          // Calculate dimensions
          final containerWidth = constraints.maxWidth;
          final totalSpacing = spacing * (crossAxisCount - 1);
          final itemWidth = (containerWidth - totalSpacing) / crossAxisCount;

          // Adjust the aspect ratio according to the width
          final aspectRatio =
              itemWidth / (itemWidth * 1.6); // Example ratio adjustment
          final itemHeight = itemWidth / aspectRatio;
          final gridViewHeight =
              itemHeight * (items.length / crossAxisCount).ceil() +
                  spacing * ((items.length / crossAxisCount).ceil() - 1);

          // Calculate the height for 2 rows of items
          // final maxHeight = itemHeight * 2 + spacing;

          return SizedBox(
            height: gridViewHeight,
            child: GridView.count(
              crossAxisCount: crossAxisCount,
              childAspectRatio: aspectRatio,
              mainAxisSpacing: spacing,
              padding: EdgeInsets.zero,
              crossAxisSpacing: spacing,
              physics: const NeverScrollableScrollPhysics(),
              children: items.map((item) {
                return GestureDetector(
                  onTap: () {},
                  child: ImageCard(
                    cover: item.cover,
                    name: item.label,
                    time: "7m ago",
                    count: "857 k",
                    height: 300,
                  ),
                  // child: Container(
                  //   decoration: BoxDecoration(
                  //     color: item.color,
                  //     borderRadius: BorderRadius.circular(
                  //         UIConstants.normalBorderRadius),
                  //   ),
                  //   child: Column(
                  //     mainAxisAlignment: MainAxisAlignment.center,
                  //     children: [
                  //       Image(
                  //         image: AssetImage(item.icon),
                  //         width: 45,
                  //         colorBlendMode: BlendMode.modulate,
                  //       ),
                  //       Text(
                  //         item.label,
                  //         style: Theme.of(context)
                  //             .textTheme
                  //             .bodyLarge!
                  //             .copyWith(fontFamily: "ManropeSemiBold"),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                );
              }).toList(),
            ),
          );
        },
      ),
    );
  }
}

final List<Item> items = [
  Item(Assets.cel1, "Flights", AppColors.gray.withOpacity(0.3)),
  Item(Assets.cel2, "Stays", AppColors.gray.withOpacity(0.3)),
  Item(Assets.cel3, "Movies", AppColors.gray.withOpacity(0.3)),
  Item(Assets.cel4, "Rental", AppColors.gray.withOpacity(0.3)),
  Item(Assets.cel5, "Bus Ticket", AppColors.gray.withOpacity(0.3)),
  Item(Assets.cel1, "Halicopter", AppColors.gray.withOpacity(0.3)),
  Item(Assets.cel2, "Events", AppColors.gray.withOpacity(0.3)),
  Item(Assets.cel3, "Park", AppColors.gray.withOpacity(0.3)),
  Item(Assets.cel4, "Adventure", AppColors.gray.withOpacity(0.3)),
];

class Item {
  final String cover;
  final String label;
  final Color color;

  Item(this.cover, this.label, this.color);
}
