import 'dart:async';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:video_player/video_player.dart';

import '../model/response/comment_response.dart';
import '../model/response/single_story_comment_response.dart';
import '../network/api_response.dart';
import '../network/repo/story_repo.dart';

class CommentViewModel extends ChangeNotifier {
  int totalCommentCount = 0;
  int get totalComment => totalCommentCount;

  void totalCommentFunc(int value) {
    totalCommentCount = value;
    notifyListeners();
  }

  String _scrollByStoryId = "";
  String get scrollByStoryId => _scrollByStoryId;

  void changedStoryId(String value) {
    _scrollByStoryId = value;
    fetchAllComment(_scrollByStoryId);
    notifyListeners();
  }

  // Map to store the like status for each comment by comment ID
  final Map<String, bool> _commentLikes = {};

  // Function to toggle like status for a specific comment
  void toggleLikeComment(String commentId) {
    if (_commentLikes.containsKey(commentId)) {
      _commentLikes[commentId] = !_commentLikes[commentId]!;
    } else {
      _commentLikes[commentId] = true;
    }
    notifyListeners();
  }

  bool isCommentLiked(String commentId) {
    return _commentLikes[commentId] ?? false;
  }

  ApiResponse _allCommentApiResponse = ApiResponse.initial("Empty Data");
  ApiResponse get allCommentApiResponse => _allCommentApiResponse;
  List<CommentResponse> _allComment = <CommentResponse>[];
  List<CommentResponse> get allComment => _allComment;

  Future<void> fetchAllComment(String id) async {
    _allCommentApiResponse = ApiResponse.initial("Loading");
    notifyListeners();
    try {
      List<CommentResponse> res = await StoryRepo().getComment(id);
      if (res.isNotEmpty) {
        _allComment = res;
        totalCommentFunc(res.length);
        _allCommentApiResponse = ApiResponse.completed("Success");
        notifyListeners();
      } else {
        _allComment = [];
        totalCommentFunc(0);
        _allCommentApiResponse = ApiResponse.error("Failed");
      }
    } catch (e) {
      print("ERROR VIEW MODEL:::${e.toString()}");
      _allCommentApiResponse = ApiResponse.error(e.toString());
    }
    notifyListeners();
  }

  ApiResponse _likeCommentApiResponse = ApiResponse.initial("Empty Data");
  ApiResponse get likeCommentApiResponse => _likeCommentApiResponse;
  dynamic _likeComment = dynamic;
  dynamic get likeComment => _likeComment;
  Future<void> postLikeComment(String id) async {
    _likeCommentApiResponse = ApiResponse.initial("Loading");
    notifyListeners();
    try {
      dynamic res = await StoryRepo().postLike(id);
      // if (res.success == true) {
      _likeComment = res;
      _likeCommentApiResponse = ApiResponse.completed(res.success.toString());
      notifyListeners();
      // } else {
      //   _likeCommentApiResponse = ApiResponse.error(res.success.toString());
      // }
    } catch (e) {
      _likeCommentApiResponse = ApiResponse.error(e.toString());
    }
    notifyListeners();
  }
}
