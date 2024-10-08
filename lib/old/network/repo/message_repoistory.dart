import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:storyv2/old/network/api.dart';

import '../../model/response/accept_friend_list.dart';
import '../../model/response/friend_request_response.dart';
import '../../model/response/send_message_request_response.dart';

class MessageRepository {
  API api = API();

  Future<SendMessageRequestResponse> sendMessageRequestRepo(String id) async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();

    String? token = sharedPreferences.getString('token');

    try {
      return await http
          .post(
        Uri.parse(
            'http://brain.novutales.com/api/chat/friend_request/$id/send_request/'),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
          'accept': 'application/json',
        },
        body: null,
      )
          .then((data) {
        print("DATA::::${data.body}");
        print("DATA:::: status code${data.statusCode}");
        if (data.statusCode == 200) {
          print("200 RESPONSE::");
          // final response =
          //     SendMessageRequestResponse.fromJson(jsonDecode(data.body));

          return SendMessageRequestResponse(
              success: true, friends: [], detail: "Request sent successfully");

          // print("RESPONSE API CALL:::${response}");
          // return response;
        } else if (data.statusCode == 404 || data.statusCode == 401) {
          return SendMessageRequestResponse(
              success: false,
              friends: [],
              detail: jsonDecode(data.body)["detail"].toString());
        } else {
          return SendMessageRequestResponse(
              success: false,
              friends: [],
              detail: jsonDecode(data.body)["detail"].toString());
        }
      }).catchError((e) {
        return SendMessageRequestResponse(
            success: false,
            friends: [],
            detail: "Error sending message request");
      });
    } on SocketException {
      return SendMessageRequestResponse(
          success: false,
          friends: [],
          detail: "Please Check your Internet Connection");
    } on HttpException {
      return SendMessageRequestResponse(
          success: false,
          friends: [],
          detail: "Please Check your Internet Connection");
    } on FormatException {
      return SendMessageRequestResponse(
          success: false,
          friends: [],
          detail: "Please Check your Internet Connection");
    }
  }

  Future<List<FriendRequestResponse>> getFriendRequest() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();

    String? token = sharedPreferences.getString('token');

    String apiUrl2 = "https://brain.novutales.com";

    print("GET:::${'$apiUrl2/api/chat/friend_request/get_friend_requests/'}");

    try {
      return await http.get(
        Uri.parse('$apiUrl2/api/chat/friend_request/get_friend_requests/'),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
          'accept': 'application/json',
        },
      ).then((data) {
        print("DATA:::${data.body}");
        print("DATA:::${data.statusCode}");
        if (data.statusCode == 200) {
          // final response = List<FriendRequestResponse>.from(json.decode(data.body)).toList();
          final List<dynamic> jsonData = json.decode(data.body);
          final List<FriendRequestResponse> response = jsonData.map((item) {
            return FriendRequestResponse.fromJson(
                item); // Assuming you have a fromJson constructor in FriendRequestResponse class.
          }).toList();
          print("RESPONSE RRIEDNS 123:::$response");
          // response.statusCode = data.statusCode;
          return response;
        } else if (data.statusCode == 404 || data.statusCode == 401) {
          return <FriendRequestResponse>[];
        } else {
          return <FriendRequestResponse>[];
        }
      }).catchError((e) {
        print(e.toString());
        return <FriendRequestResponse>[];
      });
    } on SocketException {
      return <FriendRequestResponse>[];
    } on HttpException {
      return <FriendRequestResponse>[];
    } on FormatException {
      return <FriendRequestResponse>[];
    }
  }

  Future<FriendRequestResponse> acceptRequestRepot(String id) async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();

    String? token = sharedPreferences.getString('token');

    print(
        "POST:::${'http://brain.novutales.com/api/chat/friend_request/$id/accept_request/'}");

    try {
      return await http
          .post(
        Uri.parse(
            'http://brain.novutales.com/api/chat/friend_request/$id/accept_request/'),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
          'accept': 'application/json',
        },
        body: null,
      )
          .then((data) {
        print("DATA RESPONSE::::$data");
        print("DATA STATUS::::${data.statusCode}");
        if (data.statusCode == 200) {
          final response =
              FriendRequestResponse.fromJson(jsonDecode(data.body));
          return response;
        } else if (data.statusCode == 404 || data.statusCode == 401) {
          return FriendRequestResponse(
              detail: jsonDecode(data.body)["detail"].toString());
        } else {
          return FriendRequestResponse(
              detail: jsonDecode(data.body)["detail"].toString());
        }
      }).catchError((e) {
        return FriendRequestResponse();
      });
    } on SocketException {
      return FriendRequestResponse(
          detail: "Please Check your Internet Connection");
    } on HttpException {
      return FriendRequestResponse(
          detail: "Please Check your Internet Connection");
    } on FormatException {
      return FriendRequestResponse(
          detail: "Please Check your Internet Connection");
    }
  }

  Future<FriendRequestResponse> rejectRequestRepo(String id) async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();

    String? token = sharedPreferences.getString('token');

    print(
        "POST:::${'http://brain.novutales.com/api/chat/friend_request/$id/decline_request/'}");

    try {
      return await http
          .post(
        Uri.parse(
            'http://brain.novutales.com/api/chat/friend_request/$id/decline_request/'),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
          'accept': 'application/json',
        },
        body: null,
      )
          .then((data) {
        print("DATA::::${data.body}");
        print("DATA::::${data.statusCode}");
        if (data.statusCode == 200) {
          final response =
              FriendRequestResponse.fromJson(jsonDecode(data.body));
          response.detail = "Request rejected successfully";
          return response;
        } else if (data.statusCode == 404 || data.statusCode == 401) {
          return FriendRequestResponse(
              detail: jsonDecode(data.body)["detail"].toString());
        } else {
          return FriendRequestResponse(
              detail: jsonDecode(data.body)["detail"].toString());
        }
      }).catchError((e) {
        return FriendRequestResponse();
      });
    } on SocketException {
      return FriendRequestResponse(
          detail: "Please Check your Internet Connection");
    } on HttpException {
      return FriendRequestResponse(
          detail: "Please Check your Internet Connection");
    } on FormatException {
      return FriendRequestResponse(
          detail: "Please Check your Internet Connection");
    }
  }

  // Future<MyFriendListResponse> getMyFriendList(String id) async {
  //   final SharedPreferences sharedPreferences =
  //   await SharedPreferences.getInstance();
  //
  //   String? token = sharedPreferences.getString('token');
  //
  //   print("POST:::${'https://brain.novutales.com/api/chat/friend_list/1/get_friends/'}");
  //
  //   try {
  //     return await http.post(
  //       Uri.parse(
  //           'https://brain.novutales.com/api/chat/friend_list/$id/get_friends/'),
  //       headers: {
  //         'Authorization': 'Bearer $token',
  //         'Content-Type': 'application/json',
  //         'accept': 'application/json',
  //       },
  //       body: null,
  //     ).then((data) {
  //       print("DATA RESPONSE::::${data}");
  //       print("DATA STATUS::::${data.statusCode}");
  //       if (data.statusCode == 200) {
  //         final response =
  //         MyFriendListResponse.fromJson(jsonDecode(data.body));
  //         return response;
  //       } else if (data.statusCode == 404 || data.statusCode == 401) {
  //
  //         return MyFriendListResponse(detail: jsonDecode(data.body)["detail"].toString());
  //       } else {
  //         return MyFriendListResponse(detail: jsonDecode(data.body)["detail"].toString());
  //       }
  //     }).catchError((e) {
  //       return MyFriendListResponse();
  //     });
  //   } on SocketException catch (e) {
  //     return MyFriendListResponse(detail: "Please Check your Internet Connection");
  //   } on HttpException {
  //     return MyFriendListResponse(detail: "Please Check your Internet Connection");
  //   } on FormatException {
  //     return MyFriendListResponse(detail: "Please Check your Internet Connection");
  //   }
  // }

  Future<AcceptFriendList> getAcceptRequestFriendList() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();

    String? token = sharedPreferences.getString('token');

    print("POST:::${'http://brain.novutales.com/api/chat/friend_list/'}");

    try {
      return await http.get(
        Uri.parse('http://brain.novutales.com/api/chat/friend_list/'),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
          'accept': 'application/json',
        },
      ).then((data) {
        print("DATA RESPONSE::::$data");
        print("DATA STATUS::::${data.statusCode}");
        if (data.statusCode == 200) {
          final response = AcceptFriendList.fromJson(jsonDecode(data.body));
          return response;
        } else if (data.statusCode == 404 || data.statusCode == 401) {
          return AcceptFriendList(
              detail: jsonDecode(data.body)["detail"].toString());
        } else {
          return AcceptFriendList(
              detail: jsonDecode(data.body)["detail"].toString());
        }
      }).catchError((e) {
        return AcceptFriendList();
      });
    } on SocketException {
      return AcceptFriendList(detail: "Please Check your Internet Connection");
    } on HttpException {
      return AcceptFriendList(detail: "Please Check your Internet Connection");
    } on FormatException {
      return AcceptFriendList(detail: "Please Check your Internet Connection");
    }
  }
}
