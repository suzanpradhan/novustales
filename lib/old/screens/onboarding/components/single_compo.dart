import 'package:flutter/material.dart';

import '../../../constants/app_color.dart';

class SingleCompo extends StatelessWidget {
  String? imagePath;
  String? label;
  Color? color;
  void Function()? onTap;
  SingleCompo({super.key, this.label, this.imagePath, this.color, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: white,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              spreadRadius: 1,
              blurRadius: 5,
              offset: Offset(0, 0), // Offset of the shadow
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Row(
            children: [
              Expanded(
                  flex: 1,
                  child: Image.asset(
                    imagePath ?? "",
                    height: 22,
                    width: 22,
                    color: color,
                  )),
              Expanded(
                  flex: 3,
                  child: Text(
                    label ?? "",
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
