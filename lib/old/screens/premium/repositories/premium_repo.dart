import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:storyv2/old/network/api_response.dart';
import 'package:storyv2/old/screens/premium/constants/api_paths.dart';
import 'package:storyv2/old/screens/premium/models/category_model.dart';
import 'package:storyv2/old/screens/premium/models/search_model.dart';
import 'package:storyv2/old/screens/premium/models/searched_user_model.dart';
import 'package:storyv2/old/screens/premium/models/submission_model.dart';
import 'package:storyv2/old/screens/premium/models/war_model.dart';
import 'package:storyv2/old/screens/premium/parameters/create_battle_param.dart';
import 'package:storyv2/old/screens/premium/parameters/rate_param.dart';
import 'package:storyv2/old/screens/premium/parameters/submission_param.dart';
import 'package:storyv2/old/screens/premium/utils/get_headers.dart';

class PremiumRepo {
  final String region = 'la';
  final String baseHostName = 'storage.bunnycdn.com';
  String get hostname =>
      region.isNotEmpty ? '$region.$baseHostName' : baseHostName;
  final String storageZoneName = 'storyappzone';
  final String accessKey = '3bb1b8d2-2244-4e38-8358dd44539b-49c6-45cb';

  Future<ApiResponse<bool>> uploadCDNFile(String path) async {
    final File file = File(path);

    final HttpClient httpClient = HttpClient();
    final Uri uri =
        Uri.https(hostname, '/$storageZoneName/${path.split("/").last}');

    final HttpClientRequest request = await httpClient.putUrl(uri);
    request.headers.set('AccessKey', accessKey);
    request.headers.set('Content-Type', 'application/octet-stream');

    final sink = await request.addStream(file.openRead());

    try {
      await sink.close();
      final res = await request.close();

      if (res.statusCode == 201) return ApiResponse.completed(true);
      return ApiResponse.error("error occurred");
    } catch (error) {
      return ApiResponse.error(error.toString());
    } finally {
      httpClient.close();
    }
  }

  Future<ApiResponse<bool>> createBattle(CBattlePrm param) async {
    try {
      final headers = await getHeader();
      final res = await post(
        Uri.parse(createBattleUrl),
        body: jsonEncode(param.toJson()),
        headers: headers,
      );

      if (res.statusCode == 201) return ApiResponse.completed(true);
      return ApiResponse.error("error occurred");
    } catch (error) {
      return ApiResponse.error(error.toString());
    }
  }

  Future<ApiResponse<List<CategoryModel>>> getCategories() async {
    try {
      final headers = await getHeader();
      final res = await get(
        Uri.parse(categoryUrl),
        headers: headers,
      );

      final resData = jsonDecode(res.body);
      List list = resData["results"];
      List<CategoryModel> categories =
          list.map((e) => CategoryModel.fromJson(e)).toList();

      return ApiResponse.completed(categories);
    } catch (error) {
      return ApiResponse.error(error.toString());
    }
  }

  Future<ApiResponse<SearchModel>> search(String query,
      {bool skipWar = false}) async {
    try {
      final headers = await getHeader();
      final res = await get(
        Uri.parse("$searchUserUrl$query"),
        headers: headers,
      );

      final resData = jsonDecode(res.body);
      List users = resData["users"];
      List<SUserModel> userModels =
          users.map((e) => SUserModel.fromJson(e)).toList();

      List<WarModel> warModels = [];
      if (!skipWar) {
        List wars = resData["war_stories"];
        warModels = wars.map((e) => WarModel.fromJson(e)).toList();
      }

      SearchModel search = SearchModel(users: userModels, wars: warModels);

      return ApiResponse.completed(search);
    } catch (error) {
      return ApiResponse.error(error.toString());
    }
  }

  Future<ApiResponse<List<WarModel>>> getWars(String type) async {
    try {
      final headers = await getHeader();
      final res = await get(Uri.parse("$getWarUrl$type"), headers: headers);

      final resData = jsonDecode(res.body);
      List list = resData["results"];
      List<WarModel> wars = list.map((e) => WarModel.fromJson(e)).toList();

      return ApiResponse.completed(wars);
    } catch (error) {
      return ApiResponse.error(error.toString());
    }
  }

  Future<ApiResponse<WarModel>> getWarDetail(String warId) async {
    try {
      final headers = await getHeader();
      final res = await get(Uri.parse("$warUrl/$warId/"), headers: headers);

      final resData = jsonDecode(res.body);
      WarModel war = WarModel.fromJson(resData);

      return ApiResponse.completed(war);
    } catch (error) {
      return ApiResponse.error(error.toString());
    }
  }

  Future<ApiResponse<bool>> postSubmission(SubmissionPrm param) async {
    try {
      final headers = await getHeader();
      final res = await post(
        Uri.parse("$warUrl/${param.warStory}/submission/"),
        body: jsonEncode(param.toJson()),
        headers: headers,
      );

      if (res.statusCode == 200) return ApiResponse.completed(true);
      return ApiResponse.error("error occurred");
    } catch (error) {
      return ApiResponse.error(error.toString());
    }
  }

  Future<ApiResponse<List<SubmissionModel>>> getPendingSubmissions(
      String warId) async {
    try {
      final headers = await getHeader();
      final res = await get(
        Uri.parse("$warUrl/$warId/get_submissions/"),
        headers: headers,
      );

      final resData = jsonDecode(res.body);
      List<SubmissionModel> submissions =
          (resData as List).map((e) => SubmissionModel.fromJson(e)).toList();

      return ApiResponse.completed(submissions);
    } catch (error) {
      return ApiResponse.error(error.toString());
    }
  }

  Future<ApiResponse<bool>> acceptStorySub(String submissionId) async {
    try {
      final headers = await getHeader();
      final res = await get(Uri.parse("$acceptStorySubUrl$submissionId/"),
          headers: headers);

      if (res.statusCode == 200) return ApiResponse.completed(true);
      return ApiResponse.error("error occurred");
    } catch (error) {
      return ApiResponse.error(error.toString());
    }
  }

  Future<ApiResponse<double>> rateSubmission(RatePrm prm) async {
    try {
      final headers = await getHeader();
      final uri = Uri.parse(
          "$warUrl/${prm.warId}/${prm.submissionId}/rate/?rating=${prm.rating}");
      final res = await get(uri, headers: headers);

      if (res.statusCode == 200) {
        double rating = jsonDecode(res.body)["rating"];
        return ApiResponse.completed(rating);
      }
      return ApiResponse.error("error occurred");
    } catch (error) {
      return ApiResponse.error(error.toString());
    }
  }

  Future<ApiResponse<bool>> toggleFollow(String warId) async {
    try {
      final headers = await getHeader();
      final uri = Uri.parse("$warUrl/$warId/toggle_follow/");
      final res = await get(uri, headers: headers);

      if (res.statusCode == 200) return ApiResponse.completed(true);
      return ApiResponse.error("error occurred");
    } catch (error) {
      return ApiResponse.error(error.toString());
    }
  }

  Future<ApiResponse<List<WarModel>>> getFollowedWars() async {
    try {
      final headers = await getHeader();
      final res = await get(Uri.parse(followedWarUrl), headers: headers);

      List list = jsonDecode(res.body);
      List<WarModel> wars = list.map((e) => WarModel.fromJson(e)).toList();

      return ApiResponse.completed(wars);
    } catch (error) {
      return ApiResponse.error(error.toString());
    }
  }
}
