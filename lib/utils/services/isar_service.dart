import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import '../../layers/data/models/schemas/user_data.dart';

mixin class IsarServiceMixin {
  static late Isar db;

  static Future<void> init() async {
    db = await _openDb();
  }

  static Future<Isar> _openDb() async {
    if (Isar.instanceNames.isEmpty) {
      final dir = await getApplicationDocumentsDirectory();
      return await Isar.open([UserDataSchema], inspector: true, directory: dir.path);
    }
    return Future.value(Isar.getInstance());
  }

  Isar get isar {
    return db;
  }
}
