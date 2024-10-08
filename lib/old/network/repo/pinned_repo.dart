import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../model/response/pin_user_response.dart';
import '../../model/response/pinned_response.dart';

class PinnedRepo {
  String api_url2 = "https://brain.novutales.com/api";

  Future<PinnedResponse> getAllPinnedFollowedUser() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();

    String? token = sharedPreferences.getString('token');

    try {
      return await http.get(
        Uri.parse('https://brain.novutales.com/api/story/followed_user/'),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
          'accept': 'application/json',
        },
      ).then((data) {
        if (data.statusCode == 200) {
          final response = PinnedResponse.fromJson(jsonDecode(data.body));
          response.success = true;
          return response;
        } else if (data.statusCode == 404 || data.statusCode == 401) {
          return PinnedResponse(success: false, results: []);
        } else {
          return PinnedResponse(success: false, results: []);
        }
      }).catchError((e) {
        return PinnedResponse(success: false, results: []);
      });
    } on SocketException {
      return PinnedResponse(success: false, results: []);
    } on HttpException {
      return PinnedResponse(success: false, results: []);
    } on FormatException {
      return PinnedResponse(success: false, results: []);
    }
  }

  Future<PinUserResponse> pinUser(String id) async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();

    String? token = sharedPreferences.getString('token');

    try {
      return await http.get(
        Uri.parse(
            'https://brain.novutales.com/auth/users/pin_user/?pin_user=$id'),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
          'accept': 'application/json',
        },
        // body: json.encode(request.toJson())
      ).then((data) {
        if (data.statusCode == 200) {
          final response = PinUserResponse.fromJson(jsonDecode(data.body));
          response.success = true;
          return response;
        } else if (data.statusCode == 404 || data.statusCode == 401) {
          return PinUserResponse(message: "Error", success: false);
        } else {
          return PinUserResponse(message: "Error", success: false);
        }
      }).catchError((e) {
        return PinUserResponse(message: "Error", success: false);
      });
    } on SocketException {
      return PinUserResponse(message: "Error", success: false);
    } on HttpException {
      return PinUserResponse(message: "Error", success: false);
    } on FormatException {
      return PinUserResponse(message: "Error", success: false);
    }
  }
}
