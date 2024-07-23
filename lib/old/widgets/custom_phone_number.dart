import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

import '../constants/app_color.dart';

class CustomPhoneNumber extends StatelessWidget {
  String? label;
  TextEditingController? controller;
  CustomPhoneNumber({super.key, this.label, this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        label == null
            ? const SizedBox()
            : Text(
                label ?? "",
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
        const SizedBox(
          height: 10,
        ),
        Container(
          height: 60,
          decoration: BoxDecoration(
              border: Border.all(color: black),
              color: const Color(0xFFD9D9D9),
              borderRadius: BorderRadius.circular(15)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: InternationalPhoneNumberInput(
              inputDecoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(color: Colors.transparent)),
                disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(color: Colors.transparent)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(color: Colors.transparent)),
              ),
              selectorConfig: const SelectorConfig(
                selectorType: PhoneInputSelectorType.BOTTOM_SHEET,

                // useBottomSheetSafeArea: true,
              ),
              ignoreBlank: false,
              autoValidateMode: AutovalidateMode.disabled,
              selectorTextStyle: const TextStyle(color: Colors.black),
              // initialValue: number,
              textFieldController: controller,
              formatInput: true,
              initialValue: PhoneNumber(
                  isoCode: "NP", dialCode: '977', phoneNumber: "9808******"),
              keyboardType:
                  TextInputType.numberWithOptions(signed: true, decimal: true),

              onSaved: (PhoneNumber number) {
                print('On Saved: $number');
              },
              onInputChanged: (PhoneNumber value) {},
            ),
          ),
        ),
      ],
    );
  }
}
