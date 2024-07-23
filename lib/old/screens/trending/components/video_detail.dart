import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:storyv2/old/providers/pinned_view_model.dart';

import '../../../config/api_response_config.dart';
import '../../../constants/app_color.dart';
import '../../../constants/app_image.dart';
import '../../../widgets/details_bottom_sheet_widget.dart';

class VideoDetail extends StatelessWidget {
  dynamic data;
  VideoDetail({super.key, this.data});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const SizedBox(
            width: 20,
          ),
          Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 25,
                    backgroundImage: AssetImage(appLogo),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                ],
              )),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            flex: 5,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data['user_details']['name'] ?? "",
                  style: const TextStyle(color: white, shadows: [
                    Shadow(
                      color: Colors.black,
                      offset: Offset(0, 2),
                      blurRadius: 3,
                    ),
                  ]),
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.visibility,
                      color: Colors.blue,
                      shadows: [
                        Shadow(
                          color: Colors.black,
                          offset: Offset(0, 1),
                          blurRadius: 1,
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Text("${data['views'] ?? ".."}",
                        style: const TextStyle(color: white, shadows: [
                          Shadow(
                            color: Colors.black,
                            offset: Offset(0, 2),
                            blurRadius: 3,
                          ),
                        ])),
                    const SizedBox(
                      width: 8,
                    ),
                    Consumer<PinnedViewModel>(
                        builder: (context, pinState, child) {
                      return InkWell(
                        onTap: () async {
                          try {
                            print("user details::${data['user_details']}");
                            pinState.setAdmiredUserName(
                                data['user_details']["name"].toString());
                            await pinState.pinCategoryUser(
                              data['user_details']["id"].toString(),
                            );
                            await pinState.fetchAllPinned();
                          } catch (e) {
                            print("PINNED USER ERROR::{${e.toString()}}");
                          }
                        },
                        child: isLoadingOnly(pinState.pinUserApiResponse) ||
                                isLoadingOnly(pinState.allPinnedApiResponse)
                            ? const CupertinoActivityIndicator()
                            : pinState.pinnedUserList
                                    .contains(data['user_details']["id"])
                                ? Image.asset(
                                    pngAdmired,
                                    width: 70,
                                  )
                                : Image.asset(
                                    pngAdmire,
                                    width: 50,
                                  ),
                      );
                    }),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                Builder(builder: (context) {
                  String caption = data['title'];
                  int testLengthy = caption.trim().length;
                  final decodedEmoji = decodeEmojiText(caption);

                  int newlineIndex = caption.indexOf('\n');
                  return InkWell(
                      onTap: () {
                        // Navigator.pushNamed(context, PageRoutes.addMusic);
                      },
                      child: testLengthy > 40
                          ? newlineIndex != -1 && newlineIndex < 40
                              ? RichText(
                                  text: TextSpan(
                                      style: const TextStyle(
                                          color: white,
                                          shadows: [
                                            Shadow(
                                              color: Colors.black,
                                              offset: Offset(0, 2),
                                              blurRadius: 3,
                                            ),
                                          ]),
                                      children: [
                                        TextSpan(
                                          text: newlineIndex != -1 &&
                                                  newlineIndex < 40
                                              ? decodedEmoji
                                                  .toString()
                                                  .substring(0, newlineIndex)
                                              : decodedEmoji
                                                  .toString()
                                                  .substring(0, 40),
                                          recognizer: TapGestureRecognizer()
                                            ..onTap = () {
                                              bottomDetails(context,
                                                  decodedEmoji.toString());
                                            },
                                        ),
                                        TextSpan(
                                          text: newlineIndex != -1 &&
                                                  newlineIndex < 40
                                              ? '  See More'
                                              : '',
                                          recognizer: TapGestureRecognizer()
                                            ..onTap = () {
                                              bottomDetails(context,
                                                  decodedEmoji.toString());
                                            },
                                          style: TextStyle(
                                              color: secondaryColor
                                                  .withOpacity(0.5),
                                              fontStyle: FontStyle.italic,
                                              shadows: const [
                                                Shadow(
                                                  color: Colors.black,
                                                  offset: Offset(0, 2),
                                                  blurRadius: 3,
                                                ),
                                              ]),
                                        ),
                                      ]),
                                )
                              : RichText(
                                  text: TextSpan(
                                      style: const TextStyle(
                                          color: white,
                                          shadows: [
                                            Shadow(
                                              color: Colors.black,
                                              offset: Offset(0, 2),
                                              blurRadius: 3,
                                            ),
                                          ]),
                                      children: [
                                        TextSpan(
                                          text: decodedEmoji
                                              .toString()
                                              .substring(0, 40),
                                          recognizer: TapGestureRecognizer()
                                            ..onTap = () {
                                              bottomDetails(context,
                                                  decodedEmoji.toString());
                                            },
                                        ),
                                        TextSpan(
                                            text: '  See More',
                                            recognizer: TapGestureRecognizer()
                                              ..onTap = () {
                                                bottomDetails(context,
                                                    decodedEmoji.toString());
                                              },
                                            style: TextStyle(
                                                shadows: const [],
                                                color: secondaryColor
                                                    .withOpacity(0.5),
                                                fontStyle: FontStyle.italic))
                                      ]),
                                )
                          : RichText(
                              text: TextSpan(
                                  style:
                                      const TextStyle(color: white, shadows: [
                                    Shadow(
                                      color: Colors.black,
                                      offset: Offset(0, 2),
                                      blurRadius: 3,
                                    ),
                                  ]),
                                  children: [
                                    const WidgetSpan(
                                      child: Padding(
                                          padding: EdgeInsets.only(bottom: 8),
                                          child: SizedBox()),
                                    ),
                                    TextSpan(
                                      text: decodedEmoji.toString(),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          bottomDetails(
                                              context, decodedEmoji.toString());
                                        },
                                    ),
                                  ]),
                            ));
                }),
              ],
            ),
          )
        ],
      ),
    );
  }
}

String decodeEmojiText(String encodedText) {
  return utf8.decode(encodedText.runes.toList());
}
