import 'dart:io';
import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dashed_circle/dashed_circle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:typed_data';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

import '../../config/api_response_config.dart';
import '../../constants/app_color.dart';
import '../../constants/text_style.dart';
import '../../providers/pinned_view_model.dart';
import '../../providers/story_view_model.dart';
import '../chat/chat_box/chat_box_screen.dart';

class PinnedScreen extends StatefulWidget {
  static const String routeName = "/pinned";
  const PinnedScreen({Key? key}) : super(key: key);
  @override
  State<PinnedScreen> createState() => _PinnedScreenState();
}

class _PinnedScreenState extends State<PinnedScreen>
    with SingleTickerProviderStateMixin {
  // late PinnedViewModel _provider;
  late StoryViewModel _provider2;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      // _provider = Provider.of<PinnedViewModel>(context, listen: false);
      // _provider.fetchAllPinned();

      _provider2 = Provider.of<StoryViewModel>(context, listen: false);
      _provider2.updateCategory("");
      _provider2.fetchTrendingStory();
    });
    super.initState();
  }

  final List<String> _tabs = ["Available", "All User"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: Consumer<PinnedViewModel>(builder: (context, snapShot, child) {
        return SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Column(
              children: [
                Container(
                  height: 2,
                  width: 60,
                  decoration: BoxDecoration(
                    color: Color(0xFF204051),
                    borderRadius: BorderRadius.circular(1),
                  ),
                ),
                AppBar(
                  centerTitle: true,
                  backgroundColor: Colors.transparent,
                  automaticallyImplyLeading: false,
                  titleSpacing: 0,
                  title: Text(
                    'Admired User',
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  actions: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ChatBoxScreen()));
                      },
                      child: Image.asset("assets/icons/messages2.png",
                          height: 28, width: 28, color: grey_600),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                  ],
                ),
                isLoading(snapShot.allPinnedApiResponse)
                    ? const Align(
                        alignment: Alignment.center,
                        child: Center(child: CupertinoActivityIndicator()))
                    : snapShot.allPinned.results == null ||
                            snapShot.allPinned.results!.isEmpty
                        ? const Center(
                            child: Text("You haven't Admired any user"))
                        : Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 40,
                                  margin:
                                      const EdgeInsets.symmetric(vertical: 10),
                                  child: Row(
                                    children: [
                                      Flexible(
                                        child: TextFormField(
                                          enableSuggestions: false,
                                          keyboardType: TextInputType.text,
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return 'Please enter title';
                                            }
                                            return null;
                                          },
                                          decoration: InputDecoration(
                                            contentPadding:
                                                const EdgeInsets.symmetric(
                                              vertical: 15,
                                              horizontal: 10,
                                            ),
                                            hintStyle: bR16W3,
                                            fillColor: const Color(0xFFE5E5E5),
                                            focusColor: black,
                                            errorBorder: OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                  color: Colors.red),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            focusedErrorBorder:
                                                OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Color(0xFFE5E5E5)),
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide: BorderSide(
                                                  color: Color(0xFFE5E5E5)),
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide: BorderSide(
                                                  color: Color(0xFFE5E5E5)),
                                            ),
                                          ),
                                          style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 10),
                                      Container(
                                        width: 50,
                                        decoration: BoxDecoration(
                                          color: Color(0xFF3FA3FF),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        alignment: Alignment.center,
                                        child: Icon(
                                          Icons.search_rounded,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                ListView.separated(
                                  physics: NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: snapShot.allPinned.results!.length,
                                  separatorBuilder: (context, index) {
                                    return Container(
                                      height: 1,
                                      width: double.maxFinite,
                                      color: Color(0xFF204051).withOpacity(.5),
                                      margin: EdgeInsets.all(10),
                                    );
                                  },
                                  itemBuilder: (context, index) {
                                    final data =
                                        snapShot.allPinned.results![index];
                                    return Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 5, vertical: 5),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              ClipOval(
                                                child: CachedNetworkImage(
                                                  fit: BoxFit.cover,
                                                  imageUrl:
                                                      "https://brain.novutales.com${data["avatar"]}",
                                                  height: 50,
                                                  width: 50,
                                                  placeholder: (context, url) =>
                                                      const Center(
                                                          child:
                                                              CupertinoActivityIndicator()),
                                                  errorWidget:
                                                      (context, url, error) =>
                                                          Icon(Icons.error),
                                                ),
                                              ),
                                              SizedBox(width: 10),
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    data["stories"].isNotEmpty
                                                        ? "${data["stories"][0]["user_details"]["name"]}"
                                                        : "",
                                                    style: bR16W3.copyWith(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                  ),
                                                  SizedBox(height: 5),
                                                  Text(
                                                    "${data["email"]}",
                                                    style: bR16W3.copyWith(
                                                        fontSize: 14),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
