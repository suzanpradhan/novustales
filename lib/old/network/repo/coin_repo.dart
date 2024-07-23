import 'dart:convert';
import 'dart:io';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:storyv2/old/network/api_endpoints.dart';

import '../../model/response/coin_history_response.dart';
import '../../model/response/common_response.dart';
import '../../model/response/graph_response.dart';
import '../api.dart';
import 'package:http/http.dart' as http;

class CoinRepository {
  API api = API();

  String api_url2 = "https://brain.novutales.com/api";

  Future<CoinHistoryResponse> getOwnCoin() async {
    dynamic response;
    CoinHistoryResponse res;
    try {
      response = await api.getWithToken(Endpoints.getCoins);
      res = CoinHistoryResponse.fromJson(response);
    } catch (e) {
      res = CoinHistoryResponse.fromJson(response);
    }
    return res;
  }

  Future<CommonResponse> getAddCoins(String quantity) async {
    dynamic response;
    CommonResponse res;
    try {
      response = await api.getWithToken(Endpoints.getAddCoins);

      res = CommonResponse.fromJson(response);
    } catch (e) {
      res = CommonResponse.fromJson(response);
    }
    return res;
  }

  Future<Map<String, dynamic>> transferCoin(int quantity, String toUser) async {
    dynamic response;
    Map<String, dynamic> res;
    try {
      response = await api.getWithToken(
          "api/coins/transfer_coins/?quantity=$quantity&to_user=$toUser");

      res = response;
    } catch (e) {
      print("ERROR::${e.toString()}");
      res = response;
    }
    return res;
  }

  // Future<List<GraphResponse>> getWalletGraph() async {
  //   dynamic response;
  //   List<GraphResponse> res;
  //   try {
  //     response = await api.getWithToken(Endpoints.getWalletGraph);
  //
  //     print(response);
  //
  //     // List<Module>.from(json["modules"].map((x) => Module.fromJson(x)))
  //     res = List<GraphResponse>.from(response.map((x) => GraphResponse.fromJson(x)));
  //     // res = GraphResponse.fromJson(response);
  //   } catch (e) {
  //     print("RESPONSE EMPTY::: $e");
  //     res = [];
  //     // res = GraphResponse.fromJson(response);
  //   }
  //   return res;
  // }

  Future<dynamic> getWalletGraph() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();

    String? token = sharedPreferences.getString('token');

    try {
      return await http.get(
        Uri.parse('$api_url2/coins/line_chart/'),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
          'accept': 'application/json',
        },
      ).then((data) {
        if (data.statusCode == 200) {
          final response = List<GraphResponse>.from(
              jsonDecode(data.body).map((x) => GraphResponse.fromJson(x)));
          return response;
        } else if (data.statusCode == 404 || data.statusCode == 401) {
          return [];
        } else {
          return [];
        }
      }).catchError((e) {
        return [];
      });
    } on SocketException catch (e) {
      print(e.toString());
      return [];
    }
  }
}
