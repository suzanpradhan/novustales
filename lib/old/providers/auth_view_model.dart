import 'dart:collection';
import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:storyv2/old/config/preference_utils.dart';
import 'package:storyv2/old/constants/string.dart';
import 'package:storyv2/old/model/request/login_request.dart';
import 'package:storyv2/old/model/request/register_request.dart';
import 'package:storyv2/old/network/repo/auth_repo.dart';
import 'package:storyv2/old/routes/route_name.dart';
import 'package:storyv2/old/routes/router_generator.dart';
import 'package:video_player/video_player.dart';

import '../helper/custom_loader.dart';
import '../helper/overlay_notification.dart';
import '../model/response/add_story_response.dart';
import '../model/response/user_location.dart';
import '../model/response/user_response.dart';
import '../network/api_response.dart';

class AuthViewModel extends ChangeNotifier {
  final localStorage = PreferenceUtils.instance;

  ApiResponse _loginApiResponse = ApiResponse.initial("Empty Data");
  ApiResponse get loginApiResponse => _loginApiResponse;

  FocusNode emailNode = FocusNode();
  FocusNode passwordNode = FocusNode();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController fNameController = TextEditingController();
  TextEditingController lNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  BuildContext? _context;

  setContext(BuildContext context) {
    _context = context;
    notifyListeners();
  }

  Future<void> login(String? token, String? deviceId) async {
    _loginApiResponse = ApiResponse.initial("Loading");
    customLoadStart();
    notifyListeners();
    try {
      print("FCM TOKEN IS::${token.toString()}");
      var data = loginRequestToJson(LoginRequest(
          fcmDeviceInfo: FcmDeviceInfo(
              registrationId: token,
              type: Platform.isAndroid ? "ANDROID" : "IOS",
              deviceId: deviceId),
          email: emailController.text,
          password: passwordController.text));
      Map<String, dynamic> res = await AuthRepository().loginUser(data);

      if (res['access'] != null) {
        localStorage.setString(kToken, res['access'].toString());
        localStorage.setString(kRefresh, res['refresh'].toString());
        emailController.clear();
        passwordController.clear();
        customLoadStop();
        RouteGenerator.replacePage(routeNavigation);
        showTopOverlayNotification(title: "Login Successfull");
        _loginApiResponse = ApiResponse.completed(res.toString());
      } else if (res.containsKey('detail')) {
        customLoadStop();
        showTopOverlayNotificationError(title: res['detail']);
        _loginApiResponse = ApiResponse.error(res.toString());
      }
    } catch (e) {
      customLoadStop();
      showTopOverlayNotificationError(title: e.toString());
      _loginApiResponse = ApiResponse.error(e.toString());
    }
    customLoadStop();
    notifyListeners();
  }

  ApiResponse _registerApiResponse = ApiResponse.initial("Empty Data");
  ApiResponse get registerApiResponse => _registerApiResponse;

  Future<void> register() async {
    _registerApiResponse = ApiResponse.initial("Loading");
    customLoadStart();
    notifyListeners();
    try {
      var data = RegisterRequest(
          firstName: fNameController.text,
          lastName: lNameController.text,
          email: emailController.text,
          password: passwordController.text);
      Map<String, dynamic> res = await AuthRepository().registerUser(data);

      if (res['email'].toString() == emailController.text) {
        customLoadStop();
        RouteGenerator.replacePage(routeRegisterSuccess);
        _registerApiResponse = ApiResponse.completed(res.toString());
      } else if (res.containsKey("password")) {
        customLoadStop();
        showTopOverlayNotificationError(title: res['password'][0]);
        _registerApiResponse = ApiResponse.error(res.toString());
      } else if (res.containsKey("email") &&
          (res['email'].toString() != emailController.text)) {
        customLoadStop();
        showTopOverlayNotificationError(title: res['email'][0]);
        _registerApiResponse = ApiResponse.error(res.toString());
      }
    } catch (e) {
      customLoadStop();
      showTopOverlayNotification(title: e.toString());
      _registerApiResponse = ApiResponse.error(e.toString());
    }
    customLoadStop();
    notifyListeners();
  }

  ApiResponse _userDataApiResponse = ApiResponse.initial("Empty Data");
  ApiResponse get userDataApiResponse => _userDataApiResponse;
  Map<String, dynamic> _userData = {};
  Map<String, dynamic> get userData => _userData;
  // String _userInstance = "";
  // String get userInstance => _userInstance;

  Future<void> fetchUser() async {
    _userDataApiResponse = ApiResponse.initial("Loading");
    notifyListeners();
    try {
      Map<String, dynamic> res = await AuthRepository().getUser();
      if (res.containsKey("stories")) {
        _userData = res;
        _userDataApiResponse = ApiResponse.completed(res.toString());
        notifyListeners();
      } else {
        print("i am error");
        _userDataApiResponse = ApiResponse.error(res.toString());
      }
    } catch (e) {
      print("VIEWMODEL ERORORR:::: $e");
      _userDataApiResponse = ApiResponse.error(e.toString());
    }
    notifyListeners();
  }

  ApiResponse _otherUserDetailsApiResponse = ApiResponse.initial("Empty Data");
  ApiResponse get otherUserDetailsApiResponse => _otherUserDetailsApiResponse;
  UserResponse _otherUserDetails = UserResponse();
  UserResponse get otherUserDetails => _otherUserDetails;

  Future<void> fetchOtherUser(String id) async {
    _otherUserDetailsApiResponse = ApiResponse.initial("Loading");
    notifyListeners();
    try {
      UserResponse res = await AuthRepository().getOtherUser(id);
      if (res.success == true) {
        _otherUserDetails = res;
        notifyListeners();

        _otherUserDetailsApiResponse =
            ApiResponse.completed(res.success.toString());
      } else {
        _otherUserDetailsApiResponse =
            ApiResponse.error(res.success.toString());
      }
    } catch (e) {
      _otherUserDetailsApiResponse = ApiResponse.error(e.toString());
    }
    notifyListeners();
  }

  ApiResponse _userLocationApiResponse = ApiResponse.initial("Empty Data");
  ApiResponse get userLocationApiResponse => _userLocationApiResponse;
  UserLocation _userLocation = UserLocation();
  UserLocation get userLocation => _userLocation;

  Future<void> fetchUserLocation(LatLng location) async {
    _userLocationApiResponse = ApiResponse.initial("Loading");
    notifyListeners();
    try {
      UserLocation res = await AuthRepository().getUserLocation(location);
      _userLocation = res;

      localStorage.setString("userLocation", jsonEncode(_userLocation));
      // localStorage.setString("isAdmin", res.isAdmin.toString());

      _userLocationApiResponse = ApiResponse.completed("Failed");
    } catch (e) {
      _userLocationApiResponse = ApiResponse.error(e.toString());
    }
    notifyListeners();
  }

  ApiResponse _addStoryApiResponse = ApiResponse.initial("Empty Data");
  ApiResponse get addStoryApiResponse => _addStoryApiResponse;
  AddStoryResponse _addStory = AddStoryResponse();
  AddStoryResponse get addStory => _addStory;
  Future<void> addSingleStory(request) async {
    _addStoryApiResponse = ApiResponse.initial("Loading");
    notifyListeners();
    try {
      AddStoryResponse res =
          await AuthRepository().postSingleStoryTest(request);
      if (res.image != null) {
        _addStory = res;
        _addStoryApiResponse = ApiResponse.completed(res.success.toString());
        notifyListeners();
      } else {
        _addStoryApiResponse = ApiResponse.error(res.success.toString());
      }
    } catch (e) {
      _addStoryApiResponse = ApiResponse.error(e.toString());
    }
    notifyListeners();
  }

  int _activeIndex = 0;
  int get activeIndex => _activeIndex;
  updateActiveIndex(int value) {
    _activeIndex = value;
    notifyListeners();
  }

  bool _isVideoPaused = false;
  bool get isVideoPaused => _isVideoPaused;

  updateIsVideoPaused(bool value) {
    _isVideoPaused = value;
    notifyListeners();
  }

  final _preloadedContent = {}; // Stores preloaded video and image controllers
  get preloadedContent =>
      _preloadedContent; // Stores preloaded video and image controllers
  final _queue = Queue<String>(); // Queue for preloading tasks

  clearQueue() {
    _preloadedContent.clear();
    _queue.clear();
    notifyListeners();
  }

  Future<void> preload(String url, BuildContext context) async {
    if (_preloadedContent.containsKey(url) || _queue.contains(url)) return;

    _queue.add(url);

    while (_queue.isNotEmpty) {
      final nextUrl = _queue.removeFirst();

      if (nextUrl.toString().endsWith('.mp4')) {
        final videoPlayerController = VideoPlayerController.network(
            (nextUrl.contains("http://") || nextUrl.contains("https://"))
                ? nextUrl
                : "https://brain.novutales.com$nextUrl");
        await videoPlayerController.initialize();

        _preloadedContent[nextUrl] = videoPlayerController;
      } else {
        await precacheImage(
            NetworkImage(
                (nextUrl.contains("http://") || nextUrl.contains("https://"))
                    ? nextUrl
                    : "https://brain.novutales.com$nextUrl"),
            context);
      }
    }
  }

  dynamic getPreloadedContent(String url) => _preloadedContent[url];

  @override
  void dispose() {
    _preloadedContent.forEach((url, content) {
      if (content is VideoPlayerController) {
        content.dispose();
      }
    });
  }
}
