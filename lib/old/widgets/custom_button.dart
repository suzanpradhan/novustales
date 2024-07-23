import 'package:flutter/material.dart';
import 'package:storyv2/old/constants/font_size.dart';
import 'package:storyv2/old/constants/text_style.dart';
import '../constants/app_color.dart';

class CustomButton extends StatelessWidget {
  final String buttonName;
  final Color containerColor;
  final bool hasBorder;
  final Function()? onTap;
  final bool whites;
  final double width;
  final BoxBorder? border;
  final double borderRadius;

  const CustomButton({
    Key? key,
    required this.buttonName,
    this.onTap,
    this.whites = true,
    this.width = 90,
    this.containerColor = Colors.transparent,
    this.hasBorder = false,
    this.border,
    this.borderRadius = 20,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: width,
        decoration: BoxDecoration(
          color: containerColor,
          borderRadius: BorderRadius.circular(borderRadius),
          border: hasBorder ? border : Border.all(color: Colors.transparent),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Text(
              buttonName,
              style: TextStyle(
                color: whites ? Colors.white : Colors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
