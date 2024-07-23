import 'package:flutter/material.dart';
import 'package:storyv2/old/constants/text_style.dart';

import '../constants/app_color.dart';

class CustomChip extends StatelessWidget {
  final String title;
  final bool isSelected;
  final IconData? icon;
  final Function? onTap;
  const CustomChip(
      {Key? key,
      required this.title,
      this.icon,
      this.isSelected = false,
      this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2.0, vertical: 3),
      child: InkWell(
        borderRadius: BorderRadius.circular(50),
        onTap: () => onTap!(),
        child: AbsorbPointer(
          child: Chip(
            // elevation: 7,
            side: isSelected
                ? const BorderSide(width: 1.5, color: lightGreen)
                : const BorderSide(width: 1.0, color: grey_400),
            label: Center(
              child: Wrap(children: [
                Text(
                  title,
                  style: isSelected
                      ? const TextStyle(color: white, fontSize: 15)
                      : w6f24cwdI,
                ),
                icon != null ? Icon(icon, color: tabBlue) : const SizedBox(),
              ]),
            ),
            backgroundColor: isSelected ? lightGreen : white,
          ),
        ),
      ),
    );
  }
}
