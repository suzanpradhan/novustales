import 'package:flutter/material.dart';

import '../constants/app_color.dart';
import '../constants/text_style.dart';

InputDecoration customDecoration(
    String hintText, Widget? suffixIcon, bool padding) {
  return InputDecoration(
    contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
    suffixIcon: suffixIcon,
    hintText: hintText,
    hintStyle: bR16W3,
    fillColor: Color(0xFFE5E5E5),
    focusColor: black,
    errorBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.red),
      borderRadius: padding
          ? BorderRadius.circular(10)
          : BorderRadius.only(
              topRight: Radius.circular(10), bottomRight: Radius.circular(10)),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.red),
      borderRadius: BorderRadius.circular(10.0),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: padding
          ? BorderRadius.circular(10)
          : BorderRadius.only(
              topRight: Radius.circular(10), bottomRight: Radius.circular(10)),
      borderSide: BorderSide(
        color: Color(0xFFE5E5E5),
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: padding
          ? BorderRadius.circular(10)
          : BorderRadius.only(
              topRight: Radius.circular(10), bottomRight: Radius.circular(10)),
      borderSide: BorderSide(
        color: Color(0xFFE5E5E5),
      ),
    ),
  );
}
