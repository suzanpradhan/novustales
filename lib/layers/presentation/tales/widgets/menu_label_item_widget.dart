import 'dart:ui';

import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/ui_constants.dart';
import '../screens/tale_detail_screen.dart';

class MenuLabelItemWidget extends StatefulWidget {
  final MenuItem manuItem;
  const MenuLabelItemWidget({super.key, required this.manuItem});

  @override
  State<MenuLabelItemWidget> createState() => _MenuLabelItemWidgetState();
}

class _MenuLabelItemWidgetState extends State<MenuLabelItemWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // width: MediaQuery.of(context).size.width * 0.25,
      child: Padding(
        padding: EdgeInsets.only(
          left: UIConstants.screenPadding,
          right: menuItems.indexOf(widget.manuItem) == menuItems.length - 1
              ? UIConstants.screenPadding
              : 0,
        ),
        child: ClipRRect(
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
                      fontFamily: "UberRegular",
                      color: AppColors.white,
                    ),
              )),
            ),
          ),
        ),
      ),
    );
  }
}
