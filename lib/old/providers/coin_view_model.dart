import 'dart:async';
import 'package:d_chart/d_chart.dart';
import 'package:flutter/material.dart';

import '../helper/overlay_notification.dart';
import '../model/response/coin_history_response.dart';
import '../model/response/common_response.dart';
import '../model/response/graph_response.dart';
import '../network/api_response.dart';
import '../network/repo/coin_repo.dart';

class CoinViewModel extends ChangeNotifier {
  ApiResponse _transferCoinToUserApiResponse =
      ApiResponse.initial("Empty Data");
  ApiResponse get transferCoinToUserApiResponse =>
      _transferCoinToUserApiResponse;
  Map<String, dynamic> _transferCoinToUser = {};
  Map<String, dynamic> get transferCoinToUser => _transferCoinToUser;

  int _coinToTransfer = 0;
  int get coinToTransfer => _coinToTransfer;

  setCoinToTransfer(int value) {
    _coinToTransfer = value;
    notifyListeners();
  }

  emptyCoins() {
    _coinToTransfer = 0;
    notifyListeners();
  }

  Future<void> transferCoinU(int quantity, String toUser) async {
    _showLottie = true;
    _transferCoinToUserApiResponse = ApiResponse.initial("Loading");
    notifyListeners();
    try {
      Map<String, dynamic> res =
          await CoinRepository().transferCoin(quantity, toUser);

      if (res['success'] == true) {
        await Future.delayed(const Duration(milliseconds: 1000), () {
          _showLottie = false;
        });
        showTopOverlayNotification(title: res['message'].toString());
        _transferCoinToUser = res;
        await fetchOwnCoins();
        _transferCoinToUserApiResponse = ApiResponse.completed("Success");
        notifyListeners();
      } else {
        await Future.delayed(const Duration(milliseconds: 1000), () {
          _showLottie = false;
        });
        showTopOverlayNotification(
          title: res['success'].toString(),
        );
        _transferCoinToUserApiResponse = ApiResponse.error("Failed");
      }
    } catch (e) {
      await Future.delayed(const Duration(milliseconds: 1000), () {
        _showLottie = false;
      });
      showTopOverlayNotification(
          title: "Failed to transfer the coin",
          icon: Icons.error,
          color: Colors.red);
      print("ERROR:::${e.toString()}");
      _transferCoinToUserApiResponse = ApiResponse.error(e.toString());
    }
    await Future.delayed(const Duration(milliseconds: 1000), () {
      _showLottie = false;
    });
    notifyListeners();
  }

  ApiResponse _addCoinsApiResponse = ApiResponse.initial("Empty Data");
  ApiResponse get addCoinsApiResponse => _addCoinsApiResponse;
  CommonResponse _addCoins = CommonResponse();
  CommonResponse get addCoins => _addCoins;

  Future<void> fetchAddCoins(String quantity) async {
    _addCoinsApiResponse = ApiResponse.initial("Loading");
    notifyListeners();
    try {
      CommonResponse res = await CoinRepository().getAddCoins(quantity);
      if (res.success == true) {
        _addCoins = res;
        _addCoinsApiResponse = ApiResponse.completed(res.success.toString());
        notifyListeners();
      } else {
        _addCoinsApiResponse = ApiResponse.error(res.success.toString());
      }
    } catch (e) {
      _addCoinsApiResponse = ApiResponse.error(e.toString());
    }
    notifyListeners();
  }

  ApiResponse _ownCoinsApiResponse = ApiResponse.initial("Empty Data");
  ApiResponse get ownCoinsApiResponse => _ownCoinsApiResponse;
  CoinHistoryResponse _ownCoins = CoinHistoryResponse();
  CoinHistoryResponse get ownCoins => _ownCoins;

  int _totalCoins = 0;
  int get totalCoins => _totalCoins;

  Future<void> fetchOwnCoins() async {
    _ownCoinsApiResponse = ApiResponse.initial("Loading");
    notifyListeners();

    try {
      CoinHistoryResponse res = await CoinRepository().getOwnCoin();
      if (res.id != null) {
        _ownCoins = res;
        try {
          _totalCoins = res.coinHistory == null ? 0 : res.coinHistory!.length;
        } catch (e) {
          _totalCoins = 0;
        }
        _ownCoinsApiResponse = ApiResponse.completed("Sucess");
        notifyListeners();
      } else {
        _ownCoinsApiResponse = ApiResponse.error("Failed");
      }
    } catch (e) {
      print("ERROR:: COIN:::${e.toString()}");
      _ownCoinsApiResponse = ApiResponse.error(e.toString());
    }
    notifyListeners();
  }

  ApiResponse _walletGraphApiResponse = ApiResponse.initial("Empty Data");
  ApiResponse get walletGraphApiResponse => _walletGraphApiResponse;
  List<GraphResponse> _walletGraph = <GraphResponse>[];
  List<GraphResponse> get walletGraph => _walletGraph;

  List<TimeData> _timeDataList = <TimeData>[];
  List<TimeData> get timeDataList => _timeDataList;

  List<DateTime> _dateTime = [];
  List<DateTime> get dateTimes => _dateTime;
  List<num> _quantityData = [];
  List<num> get quantityData => _quantityData;

  Future<void> fetchWalletGraph() async {
    _walletGraphApiResponse = ApiResponse.initial("Loading");
    notifyListeners();
    try {
      List<GraphResponse> res = await CoinRepository().getWalletGraph();
      if (res.isNotEmpty) {
        print("RESPONSE:::$res");
        _walletGraph = res;

        _dateTime = walletGraph.map((response) => response.date!).toList();
        _quantityData = walletGraph
            .map((response) => response.quantity!.toDouble())
            .toList();

        _timeDataList.clear();

        _timeDataList = List.generate(
          _dateTime.length,
          (index) => TimeData(
            domain: _dateTime[index],
            measure: _quantityData[index],
          ),
        );

        _walletGraphApiResponse = ApiResponse.completed("Success");
        notifyListeners();
      } else {
        _walletGraphApiResponse = ApiResponse.error("Failed");
      }
    } catch (e) {
      print(e.toString());
      _walletGraphApiResponse = ApiResponse.error(e.toString());
    }
    notifyListeners();
  }

  bool _showLottie = false;
  bool get showLottie => _showLottie;
  updateLottie(bool value) {
    _showLottie = value;
    notifyListeners();
  }
}
