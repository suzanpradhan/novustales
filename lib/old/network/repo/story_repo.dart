import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:storyv2/old/config/preference_utils.dart';
import 'package:storyv2/old/model/response/comment_response.dart';
import 'package:storyv2/old/network/api.dart';
import 'package:storyv2/old/network/api_endpoints.dart';
import '../../constants/string.dart';
import '../../model/response/common_response.dart';
import '../../model/response/for_you_response.dart';
import '../../model/response/single_story_comment_response.dart';
import 'package:http/http.dart' as http;

const String REGION = 'ny';
const String BASE_HOSTNAME = 'storage.bunnycdn.com';
final String HOSTNAME =
    REGION.isNotEmpty ? '$REGION.$BASE_HOSTNAME' : BASE_HOSTNAME;
const String STORAGE_ZONE_NAME = 'storyapp';
// final String FILENAME_TO_UPLOAD = 'filenameyouwishtouse.txt';
// final String FILE_PATH = '/path/to/your/file/upload.txt';
const String ACCESS_KEY = 'bb78a4c4-99a8-4c11-a91020bc63e9-8118-4716';

class StoryRepo {
  API api = API();
  final localStorage = PreferenceUtils.instance;

  Future<CommonResponse> getStoryCategory(String url) async {
    dynamic response;
    CommonResponse res = CommonResponse();
    try {
      response = await api.getData(url);
      res = CommonResponse.fromJson(response);
    } catch (e) {
      res = CommonResponse.fromJson(response);
    }
    return res;
  }

  // Future<Map<String,dynamic>> getForYou(String url) async {
  //   dynamic response;
  //   Map<String,dynamic> res = {};
  //   try {
  //     response = await api.getWithToken(url);
  //     res = response;
  //   } catch (e) {
  //     print("EROROROORROOR:::$e");
  //     res = response;
  //   }
  //   return res;
  // }

  // Future<StoryForYouResponse> getStoryForYou() async {
  //   dynamic response;
  //   StoryForYouResponse res;
  //   try {
  //     response = await api.getWithToken("/api/story/for_you/");
  //
  //     print("RESPONSE COIN::${response}");
  //
  //     res = StoryForYouResponse.fromJson(response);
  //   } catch (e) {
  //     print("ERROR::: OF COINT::${e.toString()}");
  //     res = StoryForYouResponse.fromJson(response);
  //   }
  //   return res;
  // }

  Future<StoryForYouResponse> getStoryForYou() async {
    String? token = localStorage.getString(kToken);
    print(token);
    print("this is token");
    final response =
        await http.get(Uri.parse(prodUrl + Endpoints.forYou), headers: {
      'Authorization':
          'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjo1MzA3NTUxMDg5LCJqdGkiOiI4NWM1ZjZlOGM4MWQ0MzQ0YmY5MDZmYzA1MmViOGIxOSIsInVzZXJfaWQiOjh9.7kL5L1mzq3ADYVBB68_iY-PYJlvAGAss0wRTUw6-k-E',
      'accept': 'application/json',
    });

    print("This is response");
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      // Parse JSON and return data
      return StoryForYouResponse.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>);
    } else {
      // Handle non-200 status code
      print('Request failed with status: ${response.statusCode}');
      throw Exception('Failed to load data');
    }
  }

  Future<Map<String, dynamic>> postUserInteraction(
      Map<String, dynamic> payload) async {
    dynamic response;
    Map<String, dynamic> res = {};
    try {
      response = await api.postDataWithToken(
          jsonEncode(payload), Endpoints.userInteraction);

      print(payload);
      res = response;
    } catch (e) {
      res = response;
    }
    return res;
  }

  // Future<List<CommentResponse>> getComment(String id) async {
  //   dynamic response;
  //
  //   List<CommentResponse> res;
  //   response = await api.getWithToken(Endpoints.geTComment + id);
  //   res = commentResponseFromJson(response);
  //
  //   print(res);
  //   return res;
  // }

  // Future<List<CommentResponse>> getComment(String id) async {
  //   final SharedPreferences sharedPreferences =
  //   await SharedPreferences.getInstance();
  //
  //   String? token = sharedPreferences.getString('token');
  //
  //   try {
  //     return await http.get(
  //       Uri.parse('https://viewstoryapp.com${Endpoints.geTComment + id}'),
  //       headers: {
  //         'Authorization': 'Bearer $token',
  //         'Content-Type': 'application/json',
  //         'accept': 'application/json',
  //       },
  //     ).then((data) {
  //       if (data.statusCode == 200) {
  //
  //         final response = CommentResponse.fromJson(jsonDecode(data.body));
  //         response.success = true;
  //         return response;
  //       } else if (data.statusCode == 404 || data.statusCode == 401) {
  //         return CommentResponse(success: false, results: []);
  //       } else {
  //         return CommentResponse(success: false, results: []);
  //       }
  //     }).catchError((e) {
  //       return CommentResponse(success: false, results: []);
  //     });
  //   } on SocketException catch (e) {
  //     return CommentResponse(success: false, results: []);
  //   } on HttpException {
  //     return CommentResponse(success: false, results: []);
  //   } on FormatException {
  //     return CommentResponse(success: false, results: []);
  //   }
  // }

  Future<List<CommentResponse>> getComment(String id) async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();

    String? token = sharedPreferences.getString('token');

    List<CommentResponse> res = [];

    print('https://brain.novutales.com/${Endpoints.geTComment + id}');

    try {
      return await http.get(
        Uri.parse('https://brain.novutales.com/${Endpoints.geTComment + id}'),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
          'accept': 'application/json',
        },
      ).then((data) {
        if (data.statusCode == 200) {
          final response = List<CommentResponse>.from(
              jsonDecode(data.body).map((x) => CommentResponse.fromJson(x)));
          return response;
        } else if (data.statusCode == 404 || data.statusCode == 401) {
          return res;
        } else {
          return res;
        }
      }).catchError((e) {
        return res;
      });
    } on SocketException catch (e) {
      print(e.toString());
      return [];
    }
  }

  Future<Either<String, List<dynamic>>> postLike(String id) async {
    try {
      dynamic response = await api.getData(Endpoints.likeComment + id);
      return Right(response);
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<dynamic> saveSingleStoryComment(request, String id) async {
    dynamic response;
    dynamic res;
    try {
      response = await api.postDataWithToken(
          jsonEncode(request), Endpoints.saveSingleStoryComment + id);
      res = response;
    } catch (e) {
      print(e.toString());
    }
    return res;
  }

  bool isSuccessful(int statusCode) {
    return statusCode == 201;
  }

  Future<bool> uploadCDNFile(requestData) async {
    final File file = File(requestData["ImagePath"]);

    if (!file.existsSync()) {
      print('File does not exist: ${requestData["ImagePath"]}');
      return false;
    }
    print("HITTING API::");

    final HttpClient httpClient = HttpClient();

    final Uri uri =
        Uri.https(HOSTNAME, '/$STORAGE_ZONE_NAME/${requestData["image"]}');

    final HttpClientRequest request = await httpClient.putUrl(uri);
    request.headers.set('AccessKey', ACCESS_KEY);
    request.headers.set('Content-Type', 'application/octet-stream');

    final IOSink sink = await request.addStream(file.openRead());

    try {
      await sink.close();
      final HttpClientResponse response = await request.close();

      bool success = isSuccessful(response.statusCode);

      await response.transform(utf8.decoder).forEach(print);

      return success;
    } catch (error) {
      print('Error: $error');
      return false;
    } finally {
      httpClient.close();
    }
  }
}
