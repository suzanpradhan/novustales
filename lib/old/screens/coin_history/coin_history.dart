import 'package:d_chart/d_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../providers/auth_view_model.dart';
import '../../providers/coin_view_model.dart';
import '../../widgets/capitalize_initals.dart';

class CoinHistoryScreen extends StatefulWidget {
  const CoinHistoryScreen({super.key});

  @override
  State<CoinHistoryScreen> createState() => _CoinHistoryScreenState();
}

class _CoinHistoryScreenState extends State<CoinHistoryScreen> {
  Color constColor = const Color(0xff303840);
  double textHeight = 1.2575;

  late CoinViewModel _provider;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _provider = Provider.of<CoinViewModel>(context, listen: false);
      _provider.fetchWalletGraph();
    });
    super.initState();
  }

  List<TimeGroup> timeGroupList = [];

  @override
  Widget build(BuildContext context) {
    return Consumer2<CoinViewModel, AuthViewModel>(
        builder: (context, coinApi, authApi, child) {
      try {
        timeGroupList = [
          TimeGroup(
            id: '1',
            data: coinApi.timeDataList,
          ),
        ];
      } catch (e) {
        timeGroupList = [];
        print("ERROR:::COIN_HISTORY:::${e.toString()}");
      }
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.transparent,
          // automaticallyImplyLeading: false,
          titleSpacing: 0,
          title: const Text(
            'Coin History',
            style: TextStyle(
              fontSize: 18,
              // color: Colors.white,
              // fontWeight: FontWeight.w600,
            ),
          ),
          //theme to white
          // iconTheme: const IconThemeData(color: Colors.white),
          // title: const Text('Coin History', ),
        ),
        body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          children: [
            Text(
              'Total Coin - ${coinApi.ownCoins.quantity}',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                height: textHeight,
                letterSpacing: 1,
                // color: Colors.white,
              ),
            ),
            const SizedBox(height: 20),
            Card(
              color: Colors.white,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: AspectRatio(
                  aspectRatio: 16 / 9,
                  child: DChartLineT(
                    groupList: timeGroupList,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Previous Transactions',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    height: textHeight,
                    letterSpacing: 1,
                    // color: Colors.white,
                  ),
                ),
                const Icon(
                  Icons.arrow_forward_ios,
                  size: 20,
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            coinApi.ownCoins.coinHistory == null ||
                    coinApi.ownCoins.coinHistory!.isEmpty
                ? const Text("No Transaction History")
                : ListView.builder(
                    itemCount: coinApi.ownCoins.coinHistory!.length,
                    shrinkWrap: true,
                    physics: const ScrollPhysics(),
                    itemBuilder: (context, index) {
                      final coinData = coinApi.ownCoins.coinHistory![index];
                      return Container(
                        margin: const EdgeInsets.fromLTRB(0, 0, 0, 14),
                        padding: const EdgeInsets.fromLTRB(14, 14, 14, 14),
                        width: double.infinity,
                        height: 74,
                        decoration: BoxDecoration(
                          color: const Color(0xffffffff),
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: const [
                            BoxShadow(
                              color: Color(0x0a000000),
                              offset: Offset(0, 2),
                              blurRadius: 24,
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin: const EdgeInsets.fromLTRB(0, 0, 0, 4),
                                  child: Text(
                                    capitalizeFirstLetter(
                                        coinData.reason.toString()),
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      height: 1.2575,
                                      letterSpacing: 1,
                                      color: Color(0xff303840),
                                    ),
                                  ),
                                ),
                                Text(
                                  // july2021ijK (6101:466)
                                  DateFormat.yMMMd().format(DateTime.parse(
                                      coinData.createdAt.toString())),
                                  style: const TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    height: 1.2575,
                                    letterSpacing: 1,
                                    color: Color(0xff7c8894),
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              // rad (6101:467)
                              margin: const EdgeInsets.fromLTRB(0, 3, 0, 0),
                              child: Row(
                                children: [
                                  Text(
                                    '+${coinData.quantity.toString()}',
                                    textAlign: TextAlign.right,
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                      height: 1.2575,
                                      letterSpacing: 1,
                                      color: Color(0xff50c474),
                                    ),
                                  ),
                                  Image.asset(
                                    "assets/images/coin.png",
                                    height: 20,
                                    width: 20,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
          ],
        ),
      );
    });
  }
}
