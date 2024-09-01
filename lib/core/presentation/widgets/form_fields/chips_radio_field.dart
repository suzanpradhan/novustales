import 'package:flutter/material.dart';

class ChipItemData {
  final String label;
  final String value;
  final Object? extra;

  const ChipItemData({required this.label, required this.value, this.extra});
}

class ChipsRadioField extends FormField<ChipItemData> {
  final String? selectorLabel;
  final BuildContext context;
  final List<ChipItemData>? items;
  final bool isSearchable;
  final Widget Function(ChipItemData) chipBuilder;
  final Function(ChipItemData)? onChanged;

  ChipsRadioField(
      {super.key,
      this.items,
      required this.chipBuilder,
      this.selectorLabel,
      super.initialValue,
      this.isSearchable = false,
      this.onChanged,
      required this.context,
      super.validator,
      Function(ChipItemData?)? super.onSaved})
      : super(
            autovalidateMode: AutovalidateMode.disabled,
            builder: (state) {
              return Wrap(
                spacing: 8,
                runSpacing: 8,
                children: items!
                    .map((item) => chipBuilder(item)
                        // (item) => Button(
                        //   label: Text(item.label ?? ''),
                        //   suffixWidget:
                        //       (item.extra != null) ? item.extra! as Widget : null,
                        //   horizontalPadding: 10,
                        //   height: 38,
                        //   isExpanded: false,
                        //   // isFilled: state.value?.value == item.value,
                        //   textColor: AppColors.black,
                        //   borderColor: state.value?.value == item.value
                        //       ? AppColors.primary
                        //       : AppColors.border,
                        //   handleTap: () {
                        //     state.didChange(item);
                        //     if (onChanged != null) {
                        //       onChanged(item);
                        //     }
                        //   },
                        // ),
                        )
                    .toList(),
              );
            });
}
