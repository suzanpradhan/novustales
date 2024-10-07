import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/ui_constants.dart';

class VerticalInputField extends StatefulWidget {
  final String? placeholder;
  final TextEditingController? controller;
  final int? maxLines;
  final String? errorText;
  final TextInputType? textInputType;
  final Function(String)? onChanged;
  final List<TextInputFormatter>? inputFormatters;
  final FormFieldState<String> state;
  final double? horizontalPadding;
  final double? verticalPadding;
  final double? height;
  final Widget? suffix;
  final Text? suffixText;
  final Text? prefixText;
  final BoxBorder? border;
  final Widget? prefix;
  final bool isSecret;
  final String? initialValue;
  final void Function()? onEditingComplete;

  const VerticalInputField({
    this.textInputType,
    this.maxLines,
    this.errorText,
    this.suffix,
    this.prefix,
    this.onEditingComplete,
    this.suffixText,
    this.border,
    this.prefixText,
    this.controller,
    required this.state,
    required this.placeholder,
    this.inputFormatters,
    this.onChanged,
    this.isSecret = true,
    this.initialValue,
    this.horizontalPadding,
    this.verticalPadding,
    this.height,
    super.key,
  });

  @override
  State<VerticalInputField> createState() => _VerticalInputFieldState();
}

class _VerticalInputFieldState extends State<VerticalInputField> {
  late FocusNode _inputFocusNode;
  late bool isObsecure;
  bool isFocused = false;

  @override
  void initState() {
    isObsecure = widget.isSecret;
    _inputFocusNode = FocusNode();
    _inputFocusNode.addListener(() {
      if (!_inputFocusNode.hasPrimaryFocus) {
        _inputFocusNode.unfocus();
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _inputFocusNode.unfocus();
    _inputFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(minHeight: widget.height ?? 42),
      decoration: BoxDecoration(
        color: AppColors.greyAccent.withOpacity(0.5),
        border: widget.border ??
            Border.all(
              color: (widget.state.hasError || widget.errorText != null)
                  ? Theme.of(context).colorScheme.onError
                  : (isFocused ||
                          (widget.state.value != null &&
                              widget.state.value!.isNotEmpty))
                      ? Theme.of(context).inputDecorationTheme.focusColor ??
                          Colors.black
                      : Theme.of(context).colorScheme.outline,
            ),
        borderRadius: BorderRadius.circular(UIConstants.minBorderRadius),
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.horizontal(
            left: Radius.circular(UIConstants.minBorderRadius)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FocusScope(
              child: Focus(
                onFocusChange: (value) {
                  setState(() {
                    isFocused = value;
                  });
                },
                child: Row(
                  children: [
                    if (widget.prefix != null) widget.prefix!,
                    if (widget.prefix == null && widget.prefixText != null)
                      Container(
                        constraints:
                            BoxConstraints(minHeight: widget.height ?? 42),
                        padding: const EdgeInsets.symmetric(
                            horizontal: UIConstants.minPadding),
                        decoration: const BoxDecoration(
                          color: AppColors.whiteShade,
                        ),
                        child: Center(child: widget.prefixText),
                      ),
                    Expanded(
                      child: TextFormField(
                        obscureText: isObsecure,
                        obscuringCharacter: "•",
                        initialValue: widget.initialValue,
                        maxLines: widget.isSecret ? 1 : widget.maxLines,
                        keyboardType:
                            widget.textInputType ?? TextInputType.text,
                        inputFormatters: widget.inputFormatters,
                        onChanged: (value) {
                          widget.state.didChange(value);
                          if (widget.onChanged != null) {
                            widget.onChanged!(value);
                          }
                        },
                        onEditingComplete: widget.onEditingComplete,
                        focusNode: _inputFocusNode,
                        cursorColor: Colors.black,
                        controller: widget.controller,
                        style: Theme.of(context).textTheme.bodyMedium,
                        decoration: InputDecoration(
                            isCollapsed: true,
                            isDense: true,
                            contentPadding: EdgeInsets.symmetric(
                                vertical: widget.verticalPadding ?? 8,
                                horizontal: widget.horizontalPadding ?? 10),
                            hintText: widget.placeholder,
                            hintStyle: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                    fontWeight: FontWeight.normal,
                                    color: widget.state.hasError
                                        ? AppColors.red
                                        : Theme.of(context)
                                            .colorScheme
                                            .onPrimary),
                            border: const UnderlineInputBorder(
                              borderSide: BorderSide.none,
                            )),
                      ),
                    ),
                    if (widget.isSecret)
                      Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: GestureDetector(
                            onTap: () {
                              setState(() {
                                isObsecure = !isObsecure;
                              });
                            },
                            child: Icon(
                              isObsecure
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                            )),
                      ),
                    if (widget.suffix != null) widget.suffix!,
                    if (widget.suffix == null && widget.suffixText != null)
                      Container(
                        constraints:
                            BoxConstraints(minHeight: widget.height ?? 42),
                        padding: const EdgeInsets.symmetric(
                            horizontal: UIConstants.minPadding),
                        decoration: const BoxDecoration(
                          color: AppColors.whiteShade,
                        ),
                        child: Center(child: widget.suffixText),
                      ),
                  ],
                ),
              ),
            ),
            if (widget.errorText != null)
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.errorContainer,
                ),
                child: Text(widget.state.errorText ?? widget.errorText!,
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(color: Theme.of(context).colorScheme.error)),
              )
          ],
        ),
      ),
    );
  }
}
