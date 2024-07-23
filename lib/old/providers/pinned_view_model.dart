import 'dart:async';
import 'package:flutter/material.dart';

import '../helper/overlay_notification.dart';
import '../model/response/pin_user_response.dart';
import '../model/response/pinned_response.dart';
import '../network/api_response.dart';
import '../network/repo/pinned_repo.dart';

class PinnedViewModel extends ChangeNotifier {
  ApiResponse _allPinnedApiResponse = ApiResponse.initial("Empty Data");
  ApiResponse get allPinnedApiResponse => _allPinnedApiResponse;
  PinnedResponse _allPinned = PinnedResponse();
  PinnedResponse get allPinned => _allPinned;

  int totalNumberOfFollowedUser = 0;
  int get getTotalNumberOfFollowedUser => totalNumberOfFollowedUser;

  setTotalNumberOfFollowedUser(int number) {
    totalNumberOfFollowedUser = number;
    notifyListeners();
  }

  bool _admiredUserBool = false;
  bool get admiredUserBool => _admiredUserBool;

  String _admiredUsername = '';
  String get admiredUsername => _admiredUsername;

  showAdmiredUserMessage() {
    _admiredUserBool = true;
    Future.delayed(const Duration(seconds: 1), () {
      _admiredUserBool = false;
    });
    notifyListeners();
  }

  setAdmiredUserName(String value) {
    _admiredUsername = value;
    notifyListeners();
  }

  List<dynamic> _pinnedUserList = [];
  List<dynamic> get pinnedUserList => _pinnedUserList;

  Future<void> fetchAllPinned() async {
    _allPinnedApiResponse = ApiResponse.initial("Loading");
    notifyListeners();
    try {
      PinnedResponse res = await PinnedRepo().getAllPinnedFollowedUser();
      if (res.success == true && res.results != null) {
        _allPinned = res;

        _pinnedUserList.clear();

        _pinnedUserList = _allPinned.results!.map((e) => e["id"]).toList();

        setTotalNumberOfFollowedUser(res.results!.length);
        _allPinnedApiResponse = ApiResponse.completed(res.success.toString());
        notifyListeners();
      } else {
        _allPinnedApiResponse = ApiResponse.error(res.success.toString());
      }
    } catch (e) {
      _allPinnedApiResponse = ApiResponse.error(e.toString());
    }
    notifyListeners();
  }

  ApiResponse _pinUserApiResponse = ApiResponse.initial("Empty Data");
  ApiResponse get pinUserApiResponse => _pinUserApiResponse;
  PinUserResponse _pinUser = PinUserResponse();
  PinUserResponse get pinUser => _pinUser;
  Future<void> pinCategoryUser(String id) async {
    _pinUserApiResponse = ApiResponse.initial("Loading");
    notifyListeners();
    try {
      PinUserResponse res = await PinnedRepo().pinUser(id);
      if (res.success == true && res.message != null) {
        _pinUser = res;
        _pinUserApiResponse = ApiResponse.completed(res.success.toString());
        showAdmiredUserMessage();
        // showTopOverlayNotification(title: res.message.toString());
        notifyListeners();
      } else {
        _pinUserApiResponse = ApiResponse.error(res.success.toString());
        showTopOverlayNotification(
            title: res.message.toString(),
            icon: Icons.error,
            color: Colors.red);
      }
    } catch (e) {
      _pinUserApiResponse = ApiResponse.error(e.toString());
      showTopOverlayNotification(
          title: e.toString(), icon: Icons.error, color: Colors.red);
    }
    notifyListeners();
  }
}
