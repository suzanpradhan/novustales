import 'package:flutter/material.dart';

import '../constants/string.dart';

class CustomDropDown extends StatefulWidget {
  const CustomDropDown(this.items, this.callback, {Key? key}) : super(key: key);
  final List<String> items;
  final Function(String item) callback;

  @override
  State<CustomDropDown> createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {
  String dropdownValue = kEmpty;
  @override
  void initState() {
    dropdownValue = widget.items[0];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
        decoration: const InputDecoration(
            isDense: true,
            border: OutlineInputBorder(
                borderSide: BorderSide(width: 1),
                borderRadius: BorderRadius.all(Radius.circular(10)))),
        value: dropdownValue,
        items: widget.items.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value, style: const TextStyle(fontSize: 13)),
          );
        }).toList(),
        onChanged: (String? newValue) {
          setState(() {
            dropdownValue = newValue!;
          });
          widget.callback(dropdownValue);
        });
  }
}
