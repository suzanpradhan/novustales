import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:storyv2/old/constants/app_color.dart';
import 'package:storyv2/old/constants/font_size.dart';
import 'package:storyv2/old/routes/route_name.dart';
import 'package:storyv2/old/screens/premium/cusWidgets/circular_loading.dart';
import 'package:storyv2/old/screens/premium/providers/war_view_model.dart';
import 'package:storyv2/old/screens/premium/utils/injection.dart';
import 'package:storyv2/old/screens/premium/utils/int_extension.dart';
import 'package:storyv2/old/screens/premium/widget/war.dart';
import 'package:storyv2/old/screens/premium/cusWidgets/gradient_scaffold.dart';
import 'package:storyv2/old/screens/premium/widget/war_item.dart';
import 'package:storyv2/old/screens/premium/widget/top_notification_bar.dart';
import 'package:storyv2/old/screens/premium/widget/view_more.dart';

class BattleListing extends StatefulWidget {
  const BattleListing({super.key});

  @override
  State<BattleListing> createState() => _BattleListingState();
}

class _BattleListingState extends State<BattleListing> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<WarViewModel>(context, listen: false).loadWars();
    });
  }

  @override
  Widget build(BuildContext context) {
    return GradientScaffold(
      child: SingleChildScrollView(
        child: Consumer<WarViewModel>(builder: (context, warViewModel, child) {
          final loading = warViewModel.loading;
          final followedWars = warViewModel.followedWars;
          final vsWars = warViewModel.vsWars;
          final communityWars = warViewModel.communityWars;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TopNotificationBar(showBackButton: false),
              if (loading)
                SizedBox(
                  width: double.maxFinite,
                  height: sCon.hP(.5),
                  child: Loading(),
                )
              else
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.only(left: 30.pW),
                  child: Row(
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          GestureDetector(
                            onTap: () =>
                                Navigator.pushNamed(context, routeCreateBattle),
                            child: Container(
                              height: 50.pW,
                              width: 50.pW,
                              decoration: BoxDecoration(
                                color: black,
                                border: Border.all(color: storyBrown),
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(Icons.add_rounded,
                                  color: white, size: 30),
                            ),
                          ),
                          SizedBox(height: 3),
                          Text(
                            "Create",
                            style: TextStyle(color: white, fontSize: sfont_10),
                          )
                        ],
                      ),
                      ...List.generate(
                        followedWars.length,
                        (index) => Padding(
                          padding: EdgeInsets.only(
                            left: 25.pW,
                            right: index == 7 ? 20.pW : 0,
                          ),
                          child: WarItem(war: followedWars[index]),
                        ),
                      )
                    ],
                  ),
                ),
              if (vsWars.isNotEmpty) ...[
                ViewMore(
                  margin: EdgeInsets.only(
                    top: 30.pH,
                    bottom: 15.pH,
                    left: 30.pW,
                    right: 30.pW,
                  ),
                  title: "VS Wars",
                  onMoreClick: () {},
                ),
                SingleChildScrollView(
                  padding: EdgeInsets.symmetric(horizontal: 30.pW),
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(
                      vsWars.length,
                      (index) {
                        return Padding(
                          padding: EdgeInsets.only(
                              right: index + 1 != vsWars.length ? 30.pW : 0),
                          child: War(war: vsWars[index], isVS: true),
                        );
                      },
                    ),
                  ),
                )
              ],
              if (communityWars.isNotEmpty) ...[
                ViewMore(
                  margin: EdgeInsets.only(
                    top: 35.pH,
                    bottom: 15.pH,
                    left: 30.pW,
                    right: 30.pW,
                  ),
                  title: "Community Wars",
                  onMoreClick: () {},
                ),
                SingleChildScrollView(
                  padding: EdgeInsets.symmetric(horizontal: 30.pW),
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(
                      communityWars.length,
                      (index) {
                        return Padding(
                          padding: EdgeInsets.only(
                            right:
                                index + 1 != communityWars.length ? 30.pW : 0,
                          ),
                          child: War(war: communityWars[index]),
                        );
                      },
                    ),
                  ),
                ),
              ],
              SizedBox(height: 20.pH)
            ],
          );
        }),
      ),
    );
  }
}
