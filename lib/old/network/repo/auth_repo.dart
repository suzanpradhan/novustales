import 'dart:convert';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:storyv2/old/model/request/login_request.dart';
import 'package:storyv2/old/model/request/register_request.dart';
import 'package:storyv2/old/model/response/user_location.dart';

import '../../model/response/add_story_response.dart';
import '../../model/response/user_response.dart';
import '../api.dart';
import '../api_endpoints.dart';
import 'package:http/http.dart' as http;

class AuthRepository {
  API api = API();

  Future<Map<String, dynamic>> loginUser(var request) async {
    Map<String, dynamic> res = await api.postData(request, Endpoints.login);
    return res;
  }

  Future<Map<String, dynamic>> registerUser(RegisterRequest request) async {
    dynamic res;
    try {
      res = await api.postData(jsonEncode(request), Endpoints.register);
      return res;
    } on Exception catch (e) {
      print(e.toString());
      // TODO
    }
    return res;
  }

  Future<Map<String, dynamic>> getUser() async {
    dynamic response;
    Map<String, dynamic> res;
    try {
      response = await api.getWithToken(Endpoints.userProfile);
      res = response;
    } catch (e) {
      res = response;
    }
    return res;
  }

  Future<UserResponse> getOtherUser(String id) async {
    dynamic response;
    UserResponse res;
    try {
      response = await api.getWithToken(Endpoints.otherUsers + id);

      res = UserResponse.fromJson(response);
    } catch (e) {
      res = UserResponse.fromJson(response);
    }
    return res;
  }

  Future<UserLocation> getUserLocation(LatLng location) async {
    dynamic response;
    UserLocation res;
    try {
      response = await api.getWithToken(
          'auth/users/get_location/?longitude=${location.longitude}&latitude=${location.latitude}');

      res = UserLocation.fromJson(response);
    } catch (e) {
      res = UserLocation.fromJson(response);
    }
    return res;
  }

  Future<AddStoryResponse> postSingleStoryTest(requestData) async {
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
    print("HERE2::");

    request.headers.addAll(headers);

    return await request.send().then((data) async {
      print("STAUSE CODE:::${data.statusCode}::::");
      if (data.statusCode == 201) {
        var responseData = await data.stream.toBytes();
        var responseString = String.fromCharCodes(responseData);
        final response = AddStoryResponse.fromJson(jsonDecode(responseString));
        print("RESPONSE STORY 123::$response");
        response.success = true;

        return response;
      } else {
        var responseData = await data.stream.toBytes();
        var responseString = String.fromCharCodes(responseData);
        final response = AddStoryResponse.fromJson(jsonDecode(responseString));
        print("RESPONSE:::$response");
        return AddStoryResponse(success: false);
      }
    }).catchError((e) {
      print("ERROR:::$e");
      return AddStoryResponse(success: false);
    });
  }
}
