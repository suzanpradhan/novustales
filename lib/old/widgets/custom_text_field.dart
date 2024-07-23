import 'package:flutter/material.dart';
import 'package:storyv2/old/constants/app_color.dart';
import '../constants/font_weight.dart';

class LabelTextField extends StatelessWidget {
  String? hintText;
  Widget? suffix;
  String? label;
  Widget? prefix;
  TextEditingController? controller;
  FocusNode? node;
  Color? labelColor;
  bool? obscureText;
  LabelTextField(
      {super.key,
      this.obscureText = false,
      this.node,
      this.controller,
      this.labelColor,
      this.hintText,
      this.label,
      this.prefix,
      this.suffix});

  InputBorder border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: const BorderSide(color: Colors.transparent));

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        label == null
            ? SizedBox()
            : Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label ?? "",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: labelColor ?? black),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
        Container(
          height: 60,
          decoration: BoxDecoration(
              border: Border.all(color: black),
              color: Color(0xFFD9D9D9),
              borderRadius: BorderRadius.circular(15)),
          child: Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: TextFormField(
              focusNode: node,
              obscureText: obscureText!,
              controller: controller,
              style: const TextStyle(fontSize: 16),
              decoration: InputDecoration(
                hintText: hintText ?? "",
                hintStyle: const TextStyle(fontSize: 18, fontWeight: kW5),
                enabledBorder: border,
                focusedBorder: border,
                disabledBorder: border,
                suffixIcon: suffix,
                prefixIcon: prefix,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
