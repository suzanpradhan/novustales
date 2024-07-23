import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:storyv2/old/network/api_endpoints.dart';
import 'package:video_player/video_player.dart';

import '../model/response/common_response.dart';
import '../model/response/for_you_response.dart';
import '../network/api_response.dart';
import '../network/repo/story_repo.dart';

class ForYouViewModel extends ChangeNotifier {
  int _activeIndex = 0;
  int get activeIndex => _activeIndex;
  updateActiveIndex(int value) {
    _activeIndex = value;
    notifyListeners();
  }

  bool _isVideoMuted = false;
  bool get isVideoMuted => _isVideoMuted;

  updateIsVideoMuted(bool value) {
    _isVideoMuted = value;
    notifyListeners();
  }

  bool _isLongPressed = false;
  bool get isLongPressed => _isLongPressed;

  updateIsLongPressed(bool value) {
    _isLongPressed = value;
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
      print("This is next url:::::$nextUrl");
      print(nextUrl);

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

  final bool _hasMore = true;
  bool get hasMore => _hasMore;

  final String _nextUrl = "";
  String get nextUrl => _nextUrl;
  ApiResponse _storyForYouApiResponse = ApiResponse.initial("Empty Data");
  ApiResponse get storyForYouApiResponse => _storyForYouApiResponse;
  List<dynamic> _forYou = <dynamic>[];
  List<dynamic> get forYou => _forYou;

  Future<void> fetchStoryForYou() async {
    _storyForYouApiResponse = ApiResponse.initial("Loading");
    notifyListeners();
    StoryForYouResponse res = await StoryRepo().getStoryForYou();

    try {
      if (res.results != null && res.results!.isNotEmpty) {
        _forYou = res.results!;

        _storyForYouApiResponse = ApiResponse.completed("Success");
        notifyListeners();
      } else {
        _storyForYouApiResponse = ApiResponse.error("Failed");
      }
    } catch (e) {
      _storyForYouApiResponse = ApiResponse.error(e.toString());
    }
    notifyListeners();
  }

  ApiResponse _loadMoreApiResponse = ApiResponse.initial('Empty data');
  ApiResponse get loadMoreApiResponse => _loadMoreApiResponse;

  Future<void> loadMoreForYou(String url) async {
    _loadMoreApiResponse = ApiResponse.loading('Fetching device data');
    notifyListeners();
    try {
      StoryForYouResponse res = await StoryRepo().getStoryForYou();

      List<dynamic> filteredResults = [];

      try {
        filteredResults = res.results!
            .where((newStory) => !_forYou
                .any((existingStory) => existingStory['id'] == newStory["id"]))
            .toList();
      } catch (e) {
        print("CATCH STORY TOP:::${e.toString()}");
      }

      _forYou.addAll(filteredResults);

      _loadMoreApiResponse = ApiResponse.completed(res.toString());

      notifyListeners();
    } catch (e) {
      _loadMoreApiResponse = ApiResponse.error(e.toString());
      notifyListeners();
    }
    notifyListeners();
  }
}
