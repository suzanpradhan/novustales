import 'package:flutter/material.dart';

class SConstraint {
  double _sHeight = 0;
  double _sWidth = 0;

  SConstraint._();
  static final _singleton = SConstraint._();
  factory SConstraint() => _singleton;

  init(BoxConstraints constraints) {
    _sHeight = constraints.maxHeight;
    _sWidth = constraints.maxWidth;
  }

  double get height => _sHeight;
  double get width => _sWidth;
  double pH(double height) => (height / 949) * _sHeight;
  double pW(double width) => (width / 430) * _sWidth;

  double hP(double p) {
    if (1 <= p || p <= 0) {
      throw FormatException("Provided percentage value must be between 0 and 1.N");
    }

    return p * _sHeight;
  }

  double wP(double p) {
    if (1 <= p || p <= 0) {
      throw FormatException("Provided percentage value must be between 0 and 1.");
    }

    return p * _sWidth;
  }
}
