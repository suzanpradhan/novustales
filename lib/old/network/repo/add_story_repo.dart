import 'dart:convert';
import 'dart:io';

import '../../model/response/add_story_response.dart';
import '../api.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

const String REGION = 'la';
const String BASE_HOSTNAME = 'storage.bunnycdn.com';
final String HOSTNAME =
    REGION.isNotEmpty ? '$REGION.$BASE_HOSTNAME' : BASE_HOSTNAME;
const String STORAGE_ZONE_NAME = 'storyappzone';
const String ACCESS_KEY = '3bb1b8d2-2244-4e38-8358dd44539b-49c6-45cb';

class AddStoryRepository {
  API api = API();

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

    print("URL IS:::$uri");

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

  Future<AddStoryResponse> uploadCdnFilePathToBack(requestData) async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();

    String? token = sharedPreferences.getString('token');

    var postUri = Uri.parse('http://brain.novutales.com/api/story/');
    Map<String, String> headers = {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
      'accept': 'application/json',
    };

    var request = http.MultipartRequest("POST", postUri);

    List<String> imageTypes = ["jpg", "jpeg", "png"];

    request.fields['category'] = requestData["category"].toString();
    request.fields['title'] = requestData["title"].toString();
    request.fields['latitude'] = requestData["latitude"].toString();
    request.fields['longitude'] = requestData["longitude"].toString();
    request.fields['name'] = requestData["name"].toString();
    request.fields['country'] = requestData["country"].toString();
    request.fields['state'] = requestData["state"].toString();
    request.fields['city'] = requestData["city"].toString();
    request.fields['media_urls'] = requestData["image"].toString();

    request.headers.addAll(headers);

    return await request.send().then((data) async {
      if (data.statusCode == 201) {
        var responseData = await data.stream.toBytes();
        var responseString = String.fromCharCodes(responseData);
        final response = AddStoryResponse.fromJson(jsonDecode(responseString));
        response.success = true;

        return response;
      } else {
        var responseData = await data.stream.toBytes();
        var responseString = String.fromCharCodes(responseData);
        final response = AddStoryResponse.fromJson(jsonDecode(responseString));
        return AddStoryResponse(success: false);
      }
    }).catchError((e) {
      print("ERROR:::$e");
      return AddStoryResponse(success: false);
    });
  }
}
