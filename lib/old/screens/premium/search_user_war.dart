import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:storyv2/old/constants/app_color.dart';
import 'package:storyv2/old/constants/font_size.dart';
import 'package:storyv2/old/constants/font_weight.dart';
import 'package:storyv2/old/network/api_response.dart';
import 'package:storyv2/old/screens/premium/cusWidgets/circular_loading.dart';
import 'package:storyv2/old/screens/premium/cusWidgets/cus_icon_button.dart';
import 'package:storyv2/old/screens/premium/cusWidgets/gradient_scaffold.dart';
import 'package:storyv2/old/screens/premium/cusWidgets/image_builder.dart';
import 'package:storyv2/old/screens/premium/models/searched_user_model.dart';
import 'package:storyv2/old/screens/premium/models/war_model.dart';
import 'package:storyv2/old/screens/premium/repositories/premium_repo.dart';
import 'package:storyv2/old/screens/premium/utils/int_extension.dart';

import 'widget/war.dart';

class SearchUserWar extends StatefulWidget {
  const SearchUserWar({super.key});

  @override
  State<SearchUserWar> createState() => _SearchUserWarState();
}

class _SearchUserWarState extends State<SearchUserWar> {
  final premiumRepo = PremiumRepo();
  final searchCtr = TextEditingController();
  List<SUserModel> users = [];
  List<WarModel> wars = [];
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return GradientScaffold(
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.pW, vertical: 30.pH),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CusIconBtn(
                  onPressed: () => Navigator.pop(context),
                  icon: Icon(Icons.arrow_back_ios, color: white),
                ),
                Flexible(
                  child: TextFormField(
                    controller: searchCtr,
                    onChanged: (value) async {
                      if (value.isEmpty) return stopSearching();
                      await search(value);
                    },
                    decoration: InputDecoration(
                      isDense: true,
                      filled: true,
                      fillColor: white,
                      contentPadding: EdgeInsets.zero,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: white),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: white),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      prefixIcon: Icon(FontAwesomeIcons.search, size: 15),
                      suffixIcon: searchCtr.text.isNotEmpty
                          ? CusIconBtn(
                              onPressed: stopSearching,
                              icon: Icon(Icons.cancel_sharp, size: 18),
                            )
                          : null,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 60.pH),
            if (loading)
              SizedBox(height: 200, child: Loading())
            else ...[
              if (users.isNotEmpty) ...[
                Text(
                  "Users",
                  style: TextStyle(
                      color: white, fontSize: sfont_20, fontWeight: kW6),
                ),
                SizedBox(height: 20.pH),
                SingleChildScrollView(
                  padding: EdgeInsets.symmetric(horizontal: 30.pW),
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(
                      users.length,
                      (index) {
                        final user = users[index];
                        return Padding(
                          padding: EdgeInsets.only(
                              right: index + 1 != users.length ? 30.pW : 0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              ImageBuilder(
                                height: 80.pW,
                                width: 80.pW,
                                fit: BoxFit.cover,
                                circular: true,
                                imageUrl: user.avatar,
                              ),
                              SizedBox(height: 5),
                              Text(
                                user.nickName,
                                style:
                                    TextStyle(color: white, fontSize: sfont_16),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
              if (wars.isNotEmpty) ...[
                SizedBox(height: 40.pH),
                Text(
                  "Wars",
                  style: TextStyle(
                      color: white, fontSize: sfont_20, fontWeight: kW6),
                ),
                SizedBox(height: 20.pH),
                SingleChildScrollView(
                  padding: EdgeInsets.symmetric(horizontal: 30.pW),
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(
                      wars.length,
                      (index) {
                        return Padding(
                          padding: EdgeInsets.only(
                              right: index + 1 != wars.length ? 30.pW : 0),
                          child: War(war: wars[index], storyStatus: false),
                        );
                      },
                    ),
                  ),
                ),
              ]
            ]
          ],
        ),
      ),
    );
  }

  stopSearching() {
    users = [];
    wars = [];
    loading = false;
    searchCtr.clear();
    setState(() {});
  }

  search(String value) async {
    setState(() => loading = true);
    final res = await premiumRepo.search(value);
    if (res.status == Status.COMPLETED) {
      users = res.data!.users;
      wars = res.data!.wars;
      loading = false;
      setState(() {});
    }
  }
}
