import 'package:flutter/material.dart';

import '../helper/dyamic_link_service.dart';
import '../model/response/accept_friend_list.dart' as afr;
import '../model/response/friend_request_response.dart';
import '../model/response/send_message_request_response.dart';
import '../network/api_response.dart';
import '../network/repo/message_repoistory.dart';

class CommonViewModel extends ChangeNotifier {
  final deeplinkApi = FirebaseDynamicLinkService();
  CommonViewModel() {
    deeplinkApi.handleDynamicLink();
  }
  int _navigationIndex = 0;
  int get navigationIndex => _navigationIndex;

  PageController _pagecontroller = PageController();
  PageController get pagecontroller => _pagecontroller;

  setNavigationIndex(int index) {
    _navigationIndex = index;
    notifyListeners();
  }

  setInitial(int index) {
    if (_pagecontroller.hasClients) {
      _pagecontroller = PageController(initialPage: index);
    }
    setNavigationIndex(index);
    notifyListeners();
  }

  itemTapped(int index) {
    print(index);
    setNavigationIndex(index);
    // if (_pagecontroller.hasClients) {
    //   _pagecontroller.jumpToPage(index);
    // }
    _pagecontroller.animateToPage(index,
        duration: Duration(microseconds: 1), curve: Curves.easeInOut);
    notifyListeners();
  }

  navigateToHome(int index) {
    setNavigationIndex(index);
    _pagecontroller.jumpToPage(index);
    notifyListeners();
  }

  ApiResponse _sendMessageRequestApiResponse =
      ApiResponse.initial("Empty Data");
  ApiResponse get sendMessageRequestApiResponse =>
      _sendMessageRequestApiResponse;
  final SendMessageRequestResponse _sendMessageRequest =
      SendMessageRequestResponse();
  SendMessageRequestResponse get sendMessageRequest => _sendMessageRequest;
  String message = "";
  Future<void> sendMessageRequestTo(String id) async {
    _sendMessageRequestApiResponse = ApiResponse.initial("Loading");
    notifyListeners();
    try {
      SendMessageRequestResponse res =
          await MessageRepository().sendMessageRequestRepo(id);
      res;
      _sendMessageRequestApiResponse =
          ApiResponse.completed(res.success.toString());
      notifyListeners();
      message = res.detail.toString();
    } catch (e) {
      _sendMessageRequestApiResponse = ApiResponse.error(e.toString());
    }
    notifyListeners();
  }

  ApiResponse _friendRequestApiResponse = ApiResponse.initial("Empty Data");
  ApiResponse get friendRequestApiResponse => _friendRequestApiResponse;
  List<FriendRequestResponse> _friendRequest = <FriendRequestResponse>[];
  List<FriendRequestResponse> get friendRequest => _friendRequest;
  Future<void> fetchFriendRequest() async {
    _friendRequestApiResponse = ApiResponse.initial("Loading");
    notifyListeners();
    try {
      List<FriendRequestResponse> res =
          await MessageRepository().getFriendRequest();
      print("RESPONSE fires:::$res");
      if (res.isNotEmpty) {
        print("RESPONSE FRIEND::$res");
        _friendRequest = res;
        _friendRequestApiResponse = ApiResponse.completed("success");
        notifyListeners();
      } else {
        _friendRequestApiResponse = ApiResponse.error("failed");
      }
    } catch (e) {
      _friendRequestApiResponse = ApiResponse.error(e.toString());
    }
    notifyListeners();
  }

  ApiResponse _acceptRequestFriendListApiResponse =
      ApiResponse.initial("Empty Data");
  ApiResponse get acceptRequestFriendListApiResponse =>
      _acceptRequestFriendListApiResponse;
  afr.AcceptFriendList _acceptRequestFriendList = afr.AcceptFriendList();
  afr.AcceptFriendList get acceptRequestFriendList => _acceptRequestFriendList;
  Map<String, String> friendName = {};
  final List<afr.User> _friendId = <afr.User>[];
  List<afr.User> get friendId => _friendId;

  final List<String> _existingData = <String>[];
  List<String> get existingData => _existingData;
  Future<void> fetchAcceptRequestFriendList() async {
    _acceptRequestFriendListApiResponse = ApiResponse.initial("Loading");
    notifyListeners();
    try {
      afr.AcceptFriendList res =
          await MessageRepository().getAcceptRequestFriendList();
      print("FRIEND RESPONSE:::${res.toJson()}");
      if (res.user != null && res.id != null) {
        _acceptRequestFriendList = res;
        _friendId.clear();
        if (res.friends != null) {
          for (var data in res.friends!) {
            _friendId.add(data);
            _existingData.add(data.id.toString());
          }
        }

        _acceptRequestFriendListApiResponse = ApiResponse.completed("Success");
        notifyListeners();
      } else {
        print("MESSAGE:::$message");
        _acceptRequestFriendListApiResponse = ApiResponse.error("Failed");
      }
    } catch (e) {
      _acceptRequestFriendListApiResponse = ApiResponse.error(e.toString());
    }
    notifyListeners();
  }
}
