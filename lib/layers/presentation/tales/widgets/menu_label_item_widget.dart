import 'dart:ui';

import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/ui_constants.dart';
import '../screens/tale_detail_screen.dart';

class MenuLabelItemWidget extends StatefulWidget {
  final MenuItem manuItem;
  final bool isActive;
  const MenuLabelItemWidget(
      {super.key, required this.manuItem, required this.isActive});

  @override
  State<MenuLabelItemWidget> createState() => _MenuLabelItemWidgetState();
}

class _MenuLabelItemWidgetState extends State<MenuLabelItemWidget> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.horizontal(
        left: Radius.elliptical(50, 50),
        right: Radius.elliptical(50, 50),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: UIConstants.minPadding),
          // height: double.maxFinite,
          decoration: BoxDecoration(
            color: widget.isActive ? AppColors.white : Colors.transparent,
            border: Border.all(color: AppColors.white, width: 1.0),
            borderRadius: BorderRadius.horizontal(
              left: Radius.elliptical(50, 50),
              right: Radius.elliptical(50, 50),
            ),
          ),
          child: Center(
              child: Text(
            widget.manuItem.name,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontFamily: "UberMedium",
                  color: widget.isActive ? AppColors.black : AppColors.white,
                ),
          )),
        ),
      ),
    );
  }
}
