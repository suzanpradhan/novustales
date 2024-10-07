import 'package:flutter/material.dart';

import '../../ui/spacer.dart';

class FormGroup extends StatefulWidget {
  final Widget? label;
  final Widget? gapper;
  final FormField formField;
  const FormGroup(
      {super.key, this.label, this.gapper, required this.formField});

  @override
  State<FormGroup> createState() => _FormGroupState();
}

class _FormGroupState extends State<FormGroup> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.label != null) widget.label ?? const SizedBox(),
        if (widget.label != null) widget.gapper ?? Gapper.vmGap(),
        widget.formField
      ],
    );
  }
}
