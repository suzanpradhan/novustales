import 'package:flutter/material.dart';
import 'package:storyv2/old/constants/text_style.dart';

import '../constants/app_color.dart';
import '../helper/size.dart';

class CustomDatePicker extends StatefulWidget {
  final String data;
  // final String date;
  final TextEditingController controller;
  final void Function()? onTap;

  const CustomDatePicker(
      {super.key, required this.data, this.onTap, required this.controller});

  @override
  State<CustomDatePicker> createState() => _CustomDatePickerState();
}

class _CustomDatePickerState extends State<CustomDatePicker> {
  @override
  void initState() {
    // widget.controller.text = dateFormatter(DateTime.now());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        widget.onTap!();
      },
      child: Container(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 8),
        decoration: BoxDecoration(
            color: white,
            border: Border.all(color: grey_300),
            borderRadius: BorderRadius.circular(8)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.data,
              style: basicStyle,
            ),
            Row(
              children: [
                const Icon(
                  Icons.calendar_today,
                  size: 20,
                  color: tabBlue,
                ),
                const SizedBox(
                  width: 8,
                ),
                SizedBox(
                  width: screenWidth(90),
                  child: AbsorbPointer(
                    child: TextFormField(
                      maxLines: 1,
                      readOnly: true,
                      controller: widget.controller,
                      style: basicStyle,
                      decoration: const InputDecoration(
                          isDense: true,
                          border: InputBorder.none,
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 5, vertical: 9)),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
