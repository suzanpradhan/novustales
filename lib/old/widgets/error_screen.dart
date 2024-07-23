import 'package:flutter/material.dart';

import '../constants/string.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({this.errorMessage = kErrorMessage, Key? key})
      : super(key: key);
  final String errorMessage;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // LottieBuilder.asset(kErrorImage),
        Expanded(child: Text("$kOups $errorMessage"))
      ],
    );
  }
}
