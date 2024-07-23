import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ViewStoryModel extends ChangeNotifier {
  Future<void> viewStory(String storyId) async {
    try {
      String url = "https://brain.novutales.com/api/story/$storyId";

      SharedPreferences localStorage = await SharedPreferences.getInstance();
      var token = localStorage.getString('token');

      await get(
        Uri.parse(url),
        headers: {
          'Content-type': 'application/json',
          'Accept': 'application/json',
          'Authorization': "Bearer $token",
        },
      );
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
