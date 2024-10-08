import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';
import 'package:storyv2/old/providers/coin_view_model.dart';
import 'package:storyv2/old/providers/common_view_model.dart';

import '../../helper/custom_loader.dart';
import '../../helper/overlay_notification.dart';

class SendCoinScreen extends StatelessWidget {
  final String userId;
  const SendCoinScreen({super.key, required this.userId});

  @override
  Widget build(BuildContext context) {
    TextEditingController coinController = TextEditingController();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Transfer Coin"),
        backgroundColor: Colors.white,
      ),
      body: Consumer2<CoinViewModel, CommonViewModel>(
          builder: (context, coinApi, common, child) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            children: [
              TextFormField(
                keyboardType: TextInputType.number,
                controller: coinController,
                decoration: InputDecoration(
                  prefixIcon: const Icon(
                    LineIcons.ggCurrency,
                    color: Colors.black,
                  ),
                  labelText: 'Enter Coin',
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(width: 1, color: Colors.grey),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(width: 1, color: Colors.blue),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: const BorderSide(width: 1, color: Colors.red),
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent,
                      foregroundColor: Colors.white,
                    ),
                    onPressed: () {
                      if (coinController.text.isEmpty) {
                        showTopOverlayNotificationError(
                            title: "Please enter a coin amount.");
                        return;
                      }
                      if (int.parse(coinApi.ownCoins.quantity.toString()) <
                          int.parse(coinController.text)) {
                        showTopOverlayNotificationError(
                            title:
                                "Insufficient coins. Your balance is only ${coinApi.ownCoins.quantity}. You can't send ${coinController.text} coins.");

                        return;
                      }

                      bool isNumeric(String str) {
                        RegExp numeric = RegExp(r'^-?[0-9]+$');
                        return numeric.hasMatch(str);
                      }

                      if (isNumeric(coinController.text)) {
                        try {
                          customLoadStart();
                          coinApi
                              .transferCoinU(
                                  int.parse(coinController.text), userId)
                              .then((_) {
                            coinController.clear();
                            // showTopOverlayNotification(
                            //     title:
                            //         "Coin has been successfully Transferred");
                            customLoadStop();
                            coinApi.fetchOwnCoins();
                          });
                        } catch (e) {
                          customLoadStop();
                          showTopOverlayNotificationError(title: e.toString());
                        }
                      } else {
                        showTopOverlayNotificationError(
                            title: "Enter should be number");
                      }
                    },
                    child: const Text('Proceed'),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      foregroundColor: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('Cancel'),
                  ),
                ],
              ),
            ],
          ),
        );
      }),
    );
  }
}
