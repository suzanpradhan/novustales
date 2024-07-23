import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

class HiveUtils {
  static late final Box box;

  static Future<Box> init() async {
    box =  await Hive.openBox("campus");
    return box;
  }
}