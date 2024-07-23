import 'package:flutter/foundation.dart';
import 'package:storyv2/old/network/api_response.dart';
import 'package:storyv2/old/screens/premium/models/war_model.dart';

import '../models/submission_model.dart';
import '../repositories/premium_repo.dart';

class WarViewModel extends ChangeNotifier {
  final premiumRepo = PremiumRepo();
  List<WarModel> followedWars = [];
  List<WarModel> vsWars = [];
  List<WarModel> communityWars = [];
  bool loading = true;

  loadWars() async {
    final resF = await premiumRepo.getFollowedWars();
    if (resF.status == Status.COMPLETED) followedWars = resF.data!;

    final resV = await premiumRepo.getWars("vs");
    if (resV.status == Status.COMPLETED) vsWars = resV.data!;

    final resC = await premiumRepo.getWars("community");
    if (resC.status == Status.COMPLETED) communityWars = resC.data!;

    loading = false;
    notifyListeners();
  }

  addSubmissions({
    required String type,
    required int warId,
    required List<SubmissionModel> submissions,
  }) async {
    List<WarModel> list = [];
    int warIndex = -1;

    if (type == "followed") {
      list = followedWars;
      warIndex = followedWars.indexWhere((element) => element.id == warId);
    } else if (type == "vs") {
      list = vsWars;
      warIndex = vsWars.indexWhere((element) => element.id == warId);
    } else if (type == "community") {
      list = communityWars;
      warIndex = communityWars.indexWhere((element) => element.id == warId);
    }

    if (warIndex == -1) return;
    list[warIndex] = list[warIndex].addSubmissions(submissions);

    notifyListeners();
  }
}
