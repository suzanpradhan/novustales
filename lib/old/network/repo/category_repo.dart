import 'dart:convert';
import 'dart:io';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:storyv2/old/model/response/category_response.dart';
import 'package:storyv2/old/network/api.dart';
import 'package:storyv2/old/network/api_endpoints.dart';
import 'package:http/http.dart' as http;
import '../../model/response/cat_response2.dart';
import '../../model/response/single_category_response.dart';
import '../../model/response/story_for_you_response.dart';

class CategoryRepo {
  API api = API();

  Future<CategoryResponse> getCategories() async {
    dynamic response;
    CategoryResponse res;
    try {
      response = await api.getData(Endpoints.categories);

      res = CategoryResponse.fromJson(response);
    } catch (e) {
      res = CategoryResponse.fromJson(response);
    }
    return res;
  }

  Future<CategoryResponse2> getSingleCategory(String category) async {
    dynamic response;
    CategoryResponse2 res;
    try {
      response = await api.getWithToken(Endpoints.singleCategories + category);

      res = CategoryResponse2.fromJson(response);
    } catch (e) {
      res = CategoryResponse2.fromJson(response);
    }
    return res;
  }

  Future<StoryForYouResponse> getStoryForYou() async {
    dynamic response;
    StoryForYouResponse res;
    try {
      response = await api.getWithToken(Endpoints.forYou);

      res = StoryForYouResponse.fromJson(response);
    } catch (e) {
      res = StoryForYouResponse.fromJson(response);
    }
    return res;
  }

  Future<SingleCategoryResponse> getAllCategory() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();

    String? token = sharedPreferences.getString('token');

    try {
      return await http.get(
        Uri.parse('$api_url2/story/category'),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
          'accept': 'application/json',
        },
        // body: json.encode(request.toJson())
      ).then((data) {
        if (data.statusCode == 200) {
          final response =
              SingleCategoryResponse.fromJson(jsonDecode(data.body));
          response.success = true;
          return response;
        } else if (data.statusCode == 404 || data.statusCode == 401) {
          return SingleCategoryResponse(success: false, results: []);
        } else {
          return SingleCategoryResponse(success: false, results: []);
        }
      }).catchError((e) {
        return SingleCategoryResponse(success: false, results: []);
      });
    } on SocketException catch (e) {
      print(e.toString());
      return SingleCategoryResponse(success: false, results: []);
    } on HttpException {
      return SingleCategoryResponse(success: false, results: []);
    } on FormatException {
      return SingleCategoryResponse(success: false, results: []);
    }
  }
}
