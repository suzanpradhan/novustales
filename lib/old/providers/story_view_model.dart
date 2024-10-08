import 'dart:async';
import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:storyv2/old/network/api_endpoints.dart';
import 'package:storyv2/old/network/repo/story_repo.dart';
import 'package:video_player/video_player.dart';
import '../model/response/common_response.dart';
import '../model/response/single_category_response.dart';
import '../network/api_response.dart';
import '../network/repo/category_repo.dart';

class StoryViewModel extends ChangeNotifier {
  bool _isLongPressed = false;
  bool get isLongPressed => _isLongPressed;

  updateIsLongPressed(bool value) {
    _isLongPressed = value;
    notifyListeners();
  }

  final PageController _baseController = PageController();
  PageController get baseController => _baseController;

  final PageController _pageController = PageController(initialPage: 0);
  PageController get pageController => _pageController;

  ApiResponse _trendingStoryAccToCatApiResponse =
      ApiResponse.initial("Empty Data");
  ApiResponse get trendingStoryAccToCatApiResponse =>
      _trendingStoryAccToCatApiResponse;
  List<dynamic> _storyPerCategory = <dynamic>[];
  List<dynamic> get storyPerCategory => _storyPerCategory;

  bool _hasMore = true;
  bool get hasMore => _hasMore;

  String _nextUrl = "";
  String get nextUrl => _nextUrl;

  String _category = "";
  String get category => _category;

  updateCategory(String value) {
    _category = value;

    notifyListeners();
    fetchTrendingStory();
  }

  bool _isCommentTapped = false;
  bool get isCommentTapped => _isCommentTapped;

  updateIsCommentTapped(bool value) {
    _isCommentTapped = value;
    notifyListeners();
  }

  //endpoints - api/users/interest
  var data = {
    "categoryName": {"watch_time": 120, "comment_time": 100}
  };

  Map<String, Map<String, int>> combineData(
      Map<int, int> views, Map<int, int> comments) {
    if (_category.isNotEmpty) {
      Map<String, Map<String, int>> combinedData = {};

      // Iterate over the keys of views and comments maps
      for (int key in views.keys) {
        String categoryName = _category;
        // If the category doesn't exist in combinedData, add it
        if (!combinedData.containsKey(categoryName)) {
          combinedData[categoryName] = {"watch_time": 0, "comment_time": 0};
        }
        // Update watch time for the category by adding the current view time
        combinedData[categoryName]!["watch_time"] =
            (combinedData[categoryName]!["watch_time"] ?? 0) +
                (views[key] ?? 0);

        // Update comment time for the category by adding the current comment time
        combinedData[categoryName]!["comment_time"] =
            (combinedData[categoryName]!["comment_time"] ?? 0) +
                (comments[key] ?? 0);
      }

      return combinedData;
    }
    return {};
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

  int _timeSpentInSecondVideo = 0;
  int get timeSpentInSecondVideo => _timeSpentInSecondVideo;
  int _timeSpentInComments = 0;

  int get timeSpentInComments => _timeSpentInComments;

  resetTimeSpent() {
    _timeSpentInComments = 0;
    _timeSpentInSecondVideo = 0;
    notifyListeners();
  }

  Map<int, int> _videoTimeMap = {}; // Map to store time spent on each video
  Map<int, int> get videoTimeMap =>
      _videoTimeMap; // Map to store time spent on each video

  Map<int, int> _commentTimeMap = {}; // Map to store time spent on each video
  Map<int, int> get commentTimeMap =>
      _commentTimeMap; // Map to store time spent on each video

  int _activeIndex = 0;
  int get activeIndex => _activeIndex;
  updateActiveIndex(int value) {
    _activeIndex = value;
    notifyListeners();
  }

  bool _isVideoMuted = true;
  bool get isVideoMuted => _isVideoMuted;

  updateIsVideoMuted(bool value) {
    _isVideoMuted = value;
    notifyListeners();
  }

  bool _isVideoPaused = false;
  bool get isVideoPaused => _isVideoPaused;

  updateIsVideoPaused(bool value) {
    _isVideoPaused = value;
    notifyListeners();
  }

  void updateTime(Timer timer) {
    if (!_isVideoPaused) {
      _timeSpentInSecondVideo++;
      notifyListeners();
    }
    _videoTimeMap[_activeIndex] = _timeSpentInSecondVideo;

    if (isCommentTapped) {
      _timeSpentInComments++;
      notifyListeners();
    }

    _commentTimeMap[_activeIndex] = _timeSpentInComments;
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

  ///fetch story as per category
  /// category can be empty or may contain values
  Future<void> fetchTrendingStory() async {
    _trendingStoryAccToCatApiResponse = ApiResponse.initial("Loading");
    notifyListeners();
    try {
      CommonResponse res = await StoryRepo().getStoryCategory(_category.isEmpty
          ? Endpoints.baseStory
          : Endpoints.storyCategory + _category);
      if (res.results != null) {
        _storyPerCategory = res.results!;
        print(_storyPerCategory);
        _hasMore = res.results!.isNotEmpty;
        _nextUrl = res.next == null ? "" : res.next!;
        _trendingStoryAccToCatApiResponse =
            ApiResponse.completed(res.success.toString());
        notifyListeners();
      } else {
        _trendingStoryAccToCatApiResponse =
            ApiResponse.error(res.success.toString());
      }
    } catch (e) {
      print("ERROR:::$e");
      _trendingStoryAccToCatApiResponse = ApiResponse.error(e.toString());
    }
    notifyListeners();
  }

  ApiResponse _loadMoreApiResponse = ApiResponse.initial('Empty data');
  ApiResponse get loadMoreApiResponse => _loadMoreApiResponse;

  Future<void> loadMoreTrendingStory(String url) async {
    _loadMoreApiResponse = ApiResponse.loading('Fetching device data');
    notifyListeners();
    try {
      CommonResponse res = await StoryRepo().getStoryCategory(url);

      List<dynamic> filteredResults = [];

      try {
        filteredResults = res.results!
            .where((newStory) => !_storyPerCategory
                .any((existingStory) => existingStory['id'] == newStory["id"]))
            .toList();
      } catch (e) {
        print("CATCH STORY TOP:::${e.toString()}");
      }

      _storyPerCategory.addAll(filteredResults);
      _nextUrl = res.next == null ? "" : res.next!;

      _loadMoreApiResponse = ApiResponse.completed(res.success.toString());

      notifyListeners();
    } catch (e) {
      _loadMoreApiResponse = ApiResponse.error(e.toString());
      notifyListeners();
    }
    notifyListeners();
  }

  ApiResponse _allCategoryApiResponse = ApiResponse.initial("Empty Data");
  ApiResponse get allCategoryApiResponse => _allCategoryApiResponse;
  SingleCategoryResponse _allCategory = SingleCategoryResponse();
  SingleCategoryResponse get allCategory => _allCategory;

  Future<void> fetchAllCategory() async {
    _allCategoryApiResponse = ApiResponse.initial("Loading");
    notifyListeners();
    try {
      SingleCategoryResponse res = await CategoryRepo().getAllCategory();
      if (res.success == true) {
        _allCategory = res;
        // _length = res.results!.length;
        // makeListOfFollowing();
        _allCategoryApiResponse = ApiResponse.completed(res.success.toString());
        notifyListeners();
      } else {
        _allCategoryApiResponse = ApiResponse.error(res.success.toString());
      }
    } catch (e) {
      _allCategoryApiResponse = ApiResponse.error(e.toString());
    }
    notifyListeners();
  }

  ApiResponse _userInteractionApiResponse = ApiResponse.initial("Empty Data");
  ApiResponse get userInteractionApiResponse => _userInteractionApiResponse;

  Future<void> postUserInteraction() async {
    _userInteractionApiResponse = ApiResponse.initial("Loading");
    notifyListeners();
    try {
      Map<String, dynamic> res = await StoryRepo()
          .postUserInteraction(combineData(videoTimeMap, commentTimeMap));
      print("SUCESSS USER INTERACTION::::::$res");
      if (res['message'] == "User interest updated") {
        _videoTimeMap = {};
        _commentTimeMap = {};
        _timeSpentInSecondVideo = 0;
        _timeSpentInComments = 0;
        _userInteractionApiResponse =
            ApiResponse.completed(res['message'].toString());
        notifyListeners();
      } else {
        _userInteractionApiResponse =
            ApiResponse.error(res['message'].toString());
      }
    } catch (e) {
      _userInteractionApiResponse = ApiResponse.error(e.toString());
    }
    notifyListeners();
  }
}
