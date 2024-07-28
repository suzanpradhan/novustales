// ignore_for_file: overridden_fields

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'horizontal_input_filed.dart';
import 'vertical_input_field.dart';

enum InputAlignment { vertical, horizontal }

class FormInputField extends FormField<String> {
  final String? selectorLabel;
  final InputAlignment? alignment;
  final String? fieldValue;
  final BuildContext context;
  final String? placeholder;
  final bool isSearchable;
  // final TextEditingController? controller;
  final int? maxLines;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? textInputType;
  final Function(String)? onChanged;
  final bool isSecret;
  final String? errorText;
  final double? horizontalPadding;
  final double? verticalPadding;
  final double? height;
  final String? vehiclePropUnit;
  final Widget? suffix;
  final Widget? prefix;
  final Text? suffixText;
  final Text? prefixText;
  final BoxBorder? border;
  @override
  final String? initialValue;
  final void Function()? onEditingComplete;

  FormInputField(
      {super.key,
      this.maxLines,
      this.vehiclePropUnit,
      this.onEditingComplete,
      this.onChanged,
      this.fieldValue,
      this.suffix,
      this.prefix,
      this.suffixText,
      this.prefixText,
      this.inputFormatters,
      this.textInputType,
      this.border,
      this.selectorLabel,
      this.placeholder,
      this.alignment = InputAlignment.vertical,
      this.isSearchable = false,
      this.errorText,
      this.isSecret = false,
      required this.context,
      super.validator,
      controller,
      this.initialValue,
      this.height,
      this.horizontalPadding,
      this.verticalPadding,
      Function(String?)? super.onSaved})
      : super(
            initialValue: (controller != null) ? controller.text : initialValue,
            autovalidateMode: AutovalidateMode.disabled,
            builder: (state) {
              return alignment == InputAlignment.horizontal
                  ? HorizontalInputField(
                      placeholder: placeholder,
                      vehiclePropUnit: vehiclePropUnit,
                      state: state,
                      fieldValue: fieldValue,
                      initialValue: initialValue,
                      inputFormatters: inputFormatters,
                      textInputType: textInputType,
                      selectorLabel: selectorLabel,
                      controller: controller,
                      // onSaved: onSaved,
                      onChanged: onChanged,
                      isSecret: isSecret,
                      errorText: errorText,
                    )
                  : VerticalInputField(
                      maxLines: maxLines,
                      state: state,
                      textInputType: textInputType,
                      inputFormatters: inputFormatters,
                      errorText: errorText,
                      controller: controller,
                      prefix: prefix,
                      onEditingComplete: onEditingComplete,
                      suffix: suffix,
                      suffixText: suffixText,
                      prefixText: prefixText,
                      placeholder: placeholder,
                      onChanged: onChanged,
                      isSecret: isSecret,
                      border: border,
                      initialValue: initialValue,
                      horizontalPadding: horizontalPadding,
                      verticalPadding: verticalPadding,
                      height: height,
                    );
            });
}
