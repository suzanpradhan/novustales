import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../constants/app_colors.dart';

class HorizontalInputField extends StatefulWidget {
  final FormFieldState<String> state;
  final String? selectorLabel;
  final TextEditingController? controller;
  final String? placeholder;
  final TextInputType? textInputType;
  // final Function(String?)? onSaved;
  final String? initialValue;
  final Function(String)? onChanged;
  final List<TextInputFormatter>? inputFormatters;
  final String? fieldValue;
  final bool isSecret;
  final String? errorText;
  final String? vehiclePropUnit;

  const HorizontalInputField({
    this.vehiclePropUnit,
    this.fieldValue,
    this.errorText,
    this.textInputType,
    // required this.onSaved,
    required this.placeholder,
    this.controller,
    this.selectorLabel,
    this.initialValue,
    required this.state,
    this.inputFormatters,
    this.onChanged,
    this.isSecret = true,
    super.key,
  });

  @override
  State<HorizontalInputField> createState() => _HorizontalInputFieldState();
}

class _HorizontalInputFieldState extends State<HorizontalInputField> {
  bool isTextFieldSelected = false;
  late FocusNode _inputFocusNode;

  @override
  void initState() {
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
    return GestureDetector(
      onTap: () {
        _inputFocusNode.requestFocus();
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            bottom: BorderSide(
              color: widget.errorText != null
                  ? Theme.of(context).colorScheme.onErrorContainer
                  : Theme.of(context).colorScheme.onSecondaryContainer,
            ),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: widget.errorText != null
                  ? Colors.red.withOpacity(0.2)
                  : Colors.transparent,
              width: double.maxFinite,
              height: 48,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.selectorLabel ?? "",
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Theme.of(context).colorScheme.onSecondary),
                    ),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(0),
                          width: 160,
                          child: TextFormField(
                            obscureText: widget.isSecret,
                            initialValue: widget.initialValue,
                            keyboardType:
                                widget.textInputType ?? TextInputType.text,
                            inputFormatters: widget.inputFormatters,
                            onChanged: (value) {
                              if (widget.onChanged != null) {
                                widget.onChanged!(value);
                              }
                              widget.state.didChange(value);
                            },
                            onTapOutside: (event) =>
                                FocusScope.of(context).unfocus(),
                            focusNode: _inputFocusNode,
                            cursorColor: Colors.black,
                            textAlign: TextAlign.end,
                            style: Theme.of(context).textTheme.bodyMedium,
                            decoration: InputDecoration(
                                hintText: widget.placeholder,
                                hintStyle: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                        color: widget.errorText != null
                                            ? AppColors.red
                                            : Theme.of(context)
                                                .colorScheme
                                                .onPrimary),
                                border: const UnderlineInputBorder(
                                  borderSide: BorderSide.none,
                                )),
                          ),
                        ),
                        if (widget.state.value != null &&
                            widget.vehiclePropUnit != null &&
                            widget.state.value!.isNotEmpty)
                          Text(
                            widget.vehiclePropUnit!,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  color:
                                      Theme.of(context).colorScheme.onSecondary,
                                ),
                          ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            if (widget.errorText != null)
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
                decoration: BoxDecoration(
                    color: Colors.red.withOpacity(0.2),
                    border: const Border(
                      top: BorderSide.none,
                    )),
                child: Text(widget.state.errorText ?? widget.errorText!,
                    overflow: TextOverflow.ellipsis,
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
