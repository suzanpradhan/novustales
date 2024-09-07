import 'package:isar/isar.dart';

part 'generated/user_data.g.dart';

@collection
class UserData {
  Id id = Isar.autoIncrement;
  String? uuid;
  String? name;
  String? email;
  String? avatar;
  String? phone;
  late bool isGuest;
  late bool isSeller;
}
