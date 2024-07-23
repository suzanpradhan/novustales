import 'package:storyv2/old/screens/premium/utils/injection.dart';

extension IntExtension on int {
  double get pH => sCon.pH(toDouble());
  double get pW => sCon.pW(toDouble());

  String view() {
    if (this >= 1000) return "${(this / 1000).toStringAsFixed(1)}K";
    return toString();
  }
}
