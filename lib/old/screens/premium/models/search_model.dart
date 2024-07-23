import 'package:storyv2/old/screens/premium/models/searched_user_model.dart';
import 'package:storyv2/old/screens/premium/models/war_model.dart';

class SearchModel {
  final List<SUserModel> users;
  final List<WarModel> wars;

  const SearchModel({required this.users, required this.wars});
}
