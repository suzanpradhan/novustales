import 'package:flutter/material.dart';

import '../../constants/ui_constants.dart';

class Gapper {
  static Widget screenPadding({required Widget child}) {
    return Padding(
      padding:
          const EdgeInsets.symmetric(horizontal: UIConstants.screenPadding),
      child: child,
    );
  }

  static Widget cardPadding({required Widget child}) {
    return Padding(
      padding: const EdgeInsets.all(UIConstants.screenPadding),
      child: child,
    );
  }

  static Widget cardMinPadding({required Widget child}) {
    return Padding(
      padding: const EdgeInsets.all(UIConstants.xminPadding),
      child: child,
    );
  }

  static Widget card2xMinPadding({required Widget child}) {
    return Padding(
      padding: const EdgeInsets.all(UIConstants.x2minPadding),
      child: child,
    );
  }

  static SizedBox hgap(double gap) {
    return SizedBox(
      width: gap,
    );
  }

  static SizedBox vgap(double gap) {
    return SizedBox(
      height: gap,
    );
  }

  static SizedBox hmGap() {
    return const SizedBox(
      width: UIConstants.minPadding,
    );
  }

  static SizedBox hGap() {
    return const SizedBox(
      width: UIConstants.padding,
    );
  }

  static SizedBox hmxGap() {
    return const SizedBox(
      width: UIConstants.maxPadding,
    );
  }

  static SizedBox h2xmGap() {
    return const SizedBox(
      width: UIConstants.x2minPadding,
    );
  }

  static SizedBox vmGap() {
    return const SizedBox(
      height: UIConstants.minPadding,
    );
  }

  static SizedBox vxmGap() {
    return const SizedBox(
      height: UIConstants.xminPadding,
    );
  }

  static SizedBox v2xmGap() {
    return const SizedBox(
      height: UIConstants.x2minPadding,
    );
  }

  static SizedBox vGap() {
    return const SizedBox(
      height: UIConstants.padding,
    );
  }

  static SizedBox vmxGap() {
    return const SizedBox(
      height: UIConstants.maxPadding,
    );
  }
}
