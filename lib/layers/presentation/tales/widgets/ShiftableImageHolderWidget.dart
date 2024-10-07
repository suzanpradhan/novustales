import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/assets.dart';

class ShiftableimageholderWidget extends StatefulWidget {
  final double imageSize;
  final bool showCount;
  final int? count;
  final MainAxisAlignment? mainAxisAlignment;
  final double? areaHeight;
  final Color? backgroundColor;
  final Text? title;
  final Color? ringColor;
  final Color? dropShadow;
  final bool isLead;
  final int flex;
  const ShiftableimageholderWidget({
    super.key,
    required this.imageSize,
    this.count,
    this.showCount = true,
    this.mainAxisAlignment,
    this.areaHeight,
    this.backgroundColor,
    this.title,
    this.ringColor,
    this.dropShadow,
    this.isLead = false,
    required this.flex,
  });

  @override
  State<ShiftableimageholderWidget> createState() =>
      _ShiftableimageholderWidgetState();
}

class _ShiftableimageholderWidgetState
    extends State<ShiftableimageholderWidget> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: widget.flex,
      child: SizedBox(
        height: widget.areaHeight ?? 180,
        child: Column(
          mainAxisAlignment: widget.mainAxisAlignment ?? MainAxisAlignment.end,
          children: [
            if (widget.isLead)
              SizedBox(
                width: 25,
                height: 25,
                child: Image.asset(Assets.isLead, fit: BoxFit.cover),
              ),
            Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  height: widget.imageSize + 15,
                  width: widget.imageSize + 20,
                ),
                Container(
                  width: widget.imageSize,
                  height: widget.imageSize,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: widget.ringColor ?? AppColors.purpleAccent,
                      width: 2,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: widget.dropShadow ??
                            AppColors.purpleAccent.withOpacity(0.7),
                        spreadRadius: 1,
                        blurRadius: 5,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                ),
                // Circular image inside the border
                Container(
                  width: widget.imageSize -
                      5, // Image size (should be slightly smaller than the outer border)
                  height: widget.imageSize - 5,
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset(Assets.test, fit: BoxFit.cover),
                ),
                if (widget.showCount)
                  Positioned(
                    bottom: 0,
                    child: Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: widget.ringColor ?? AppColors.purpleAccent,
                      ),
                      child: Center(
                        child: Text(
                          "${widget.count ?? 0}",
                          style:
                              Theme.of(context).textTheme.bodyLarge!.copyWith(
                                    fontFamily: "UberBold",
                                    color: AppColors.white,
                                  ),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
            widget.title ?? SizedBox(),
          ],
        ),
      ),
    );
  }
}
