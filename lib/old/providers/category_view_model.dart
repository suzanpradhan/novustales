import 'package:flutter/material.dart';
import 'package:storyv2/old/model/response/cat_response2.dart' as cr2;
import 'package:storyv2/old/model/response/category_response.dart';
import 'package:video_player/video_player.dart';
import '../model/response/story_for_you_response.dart';
import '../network/api_response.dart';
import '../network/repo/category_repo.dart';

class CategoryViewModel extends ChangeNotifier {
  List<VideoPlayerController> _controllers = [];

  void initializeAllControllers() {
    _controllers = List.generate(
      storyForYou.results!.length,
      (index) {
        final mediaUrl =
            "https://brain.novutales.com${storyForYou.results![index].media.toString()}";

        if (isVideo(mediaUrl)) {
          final controller = VideoPlayerController.network(mediaUrl)
            ..initialize().then((_) {
              // controller.setLooping(true);
              notifyListeners();
            });

          return controller;
        } else {
          // You may want to handle images differently if needed
          return VideoPlayerController.network(
            "https://www.mykite.in/kb/NoImageFound.jpg.png",
          )..initialize().then((_) {
              // Additional configuration for image controllers if needed
              notifyListeners();
            });
        }
      },
    );
  }

  bool isVideo(String url) {
    final extension = url.split('.').last.toLowerCase();
    return ["mp4", "mov", "avi", "mkv", "webm"].contains(extension);
  }

  VideoPlayerController controllerForIndex(int index) {
    return _controllers[index];
  }

  ApiResponse _categoryApiResponse = ApiResponse.initial("Empty Data");
  ApiResponse get categoryApiResponse => _categoryApiResponse;
  List<Results> _categories = <Results>[];
  List<Results> get categories => _categories;

  Future<void> fetchCategories() async {
    _categoryApiResponse = ApiResponse.initial("Loading");
    notifyListeners();
    try {
      CategoryResponse res = await CategoryRepo().getCategories();
      if (res.results != null && res.results!.isNotEmpty) {
        _categories = res.results!;
        _categoryApiResponse = ApiResponse.completed("Success");
        notifyListeners();
      } else {
        _categoryApiResponse = ApiResponse.error("Failed");
      }
    } catch (e) {
      _categoryApiResponse = ApiResponse.error(e.toString());
    }
    notifyListeners();
  }

  ApiResponse _singleCategoryApiResponse = ApiResponse.initial("Empty Data");
  ApiResponse get singleCategoryApiResponse => _singleCategoryApiResponse;
  cr2.CategoryResponse2 _singleCategory = cr2.CategoryResponse2();
  cr2.CategoryResponse2 get singleCategory => _singleCategory;

  Future<void> fetchSingleCategory(String category) async {
    _singleCategoryApiResponse = ApiResponse.initial("Loading");
    notifyListeners();
    try {
      cr2.CategoryResponse2 res =
          await CategoryRepo().getSingleCategory(category);
      if (res.results != null) {
        _singleCategory = res;
        _singleCategoryApiResponse = ApiResponse.completed("success");
        notifyListeners();
      } else {
        _singleCategoryApiResponse = ApiResponse.error("error");
      }
    } catch (e) {
      _singleCategoryApiResponse = ApiResponse.error(e.toString());
    }
    notifyListeners();
  }

  ApiResponse _storyForYouApiResponse = ApiResponse.initial("Empty Data");
  ApiResponse get storyForYouApiResponse => _storyForYouApiResponse;
  StoryForYouResponse _storyForYou = StoryForYouResponse();
  StoryForYouResponse get storyForYou => _storyForYou;

  Future<void> fetchStoryForYou() async {
    _storyForYouApiResponse = ApiResponse.initial("Loading");
    notifyListeners();
    try {
      StoryForYouResponse res = await CategoryRepo().getStoryForYou();
      if (res.results != null && res.results!.isNotEmpty) {
        _storyForYou = res;

        _storyForYouApiResponse = ApiResponse.completed("Success");
        notifyListeners();
      } else {
        _storyForYouApiResponse = ApiResponse.error("Failed");
      }
    } catch (e) {
      _storyForYouApiResponse = ApiResponse.error(e.toString());
    }
    notifyListeners();
    print(_categories);
  }
}
