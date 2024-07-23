import 'dart:convert';
import 'dart:math' as math;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:storyv2/old/constants/app_image.dart';
import 'package:storyv2/old/routes/router_generator.dart';
import 'package:storyv2/old/screens/onboarding/onboarding.dart';
import 'package:storyv2/old/screens/profile/user_story_screen.dart';
import 'package:storyv2/old/screens/test_screen2.dart';
import 'package:video_player/video_player.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

import '../../config/api_response_config.dart';
import '../../constants/app_color.dart';
import '../../providers/auth_view_model.dart';
import '../../providers/coin_view_model.dart';
import '../../providers/pinned_view_model.dart';
import '../../providers/story_view_model.dart';
import '../../widgets/capitalize_initals.dart';
import '../../widgets/details_bottom_sheet_widget.dart';
import '../authentication/login/login_screen.dart';
import '../coin_history/coin_history.dart';
import 'coin_qr.dart';
import 'edit_profile_screen.dart';
import 'my_story_screen.dart';

class UserProfileScreen extends StatefulWidget {
  static const String routeName = "/profile";
  const UserProfileScreen({Key? key}) : super(key: key);

  @override
  UserProfileScreenState createState() => UserProfileScreenState();
}

class UserProfileScreenState extends State<UserProfileScreen>
    with SingleTickerProviderStateMixin {
  final List<String> _tabs = ["All Stories", "Categories"];

  TextStyle? getCustomTextStyle() {
    return Theme.of(context).textTheme.bodyMedium?.copyWith(
          fontSize: 16.0,
          color: Colors.black,
          fontWeight: FontWeight.w500,
        );
  }

  TextStyle? getCustomNumberStyle() {
    return Theme.of(context).textTheme.bodyMedium?.copyWith(
          fontSize: 16.0,
          color: Colors.black,
          fontWeight: FontWeight.w700,
        );
  }

  List<Widget> buildBottomList(BuildContext context) {
    return [
      CustomInkWellWidget(
        onTap: () {
          Navigator.of(context).pop();
          RouteGenerator.navigateTo(EditProfileScreen.routeName);
        },
        icon: Icons.edit,
        text: "Edit Profile",
      ),
      const Divider(color: Colors.grey, height: 5),
      CustomInkWellWidget(
        onTap: () {
          Navigator.of(context).pop();
          showDialog(
            context: context,
            builder: (builder) => AlertDialog(
              titlePadding: EdgeInsets.zero,
              content: const Text(
                  "Are you sure, you want to logout from this device?"),
              actions: [
                ElevatedButton(
                  onPressed: () => Navigator.pop(builder),
                  child: Text("No"),
                ),
                ElevatedButton(
                  onPressed: () async {
                    if (context.mounted) {
                      SharedPreferences sharedPreferences =
                          await SharedPreferences.getInstance();
                      await sharedPreferences.clear();

                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => Onboarding()),
                        (route) => false, // Remove all routes from the stack
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                  ),
                  child: const Text("Yes"),
                ),
              ],
            ),
          );
        },
        icon: Icons.login_outlined,
        text: "Log Out",
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Consumer3<AuthViewModel, PinnedViewModel, CoinViewModel>(
        builder: (context, auth, pinnedApi, coinApi, child) {
      return Scaffold(
        backgroundColor: white,
        appBar: AppBar(
          backgroundColor: white,
          automaticallyImplyLeading: false,
          title: Text(
            capitalizeFirstLetter(auth.userData['nick_name'].toString()),
            style: const TextStyle(
              color: Colors.black,
              fontSize: 20.0,
              fontWeight: FontWeight.w700,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => QRImage(
                              userId: auth.userData['id'].toString(),
                            )));
              },
              icon: const Icon(Icons.qr_code_scanner, size: 25.0, weight: 30),
            ),
            IconButton(
              onPressed: () {
                bottomMenuDetails(
                  context,
                  buildBottomList(context),
                );
              },
              icon: const Icon(Icons.menu, size: 30.0, weight: 30),
            ),
          ],
        ),
        body: isLoading(auth.userDataApiResponse)
            ? const CircularProgressIndicator()
            : SafeArea(
                child: DefaultTabController(
                  length: 3,
                  child: NestedScrollView(
                    headerSliverBuilder: (context, value) {
                      return [
                        SliverAppBar(
                          backgroundColor: white,
                          automaticallyImplyLeading: false,
                          toolbarHeight: 190,
                          flexibleSpace: FlexibleSpaceBar(
                            titlePadding: EdgeInsets.zero,
                            title: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Expanded(
                                          flex: 2,
                                          child: CircleAvatar(
                                            radius: 50,
                                            // backgroundColor: Colors.transparent,
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(60),
                                              child: CachedNetworkImage(
                                                fit: BoxFit.cover,
                                                height: double.maxFinite,
                                                width: double.infinity,
                                                imageUrl:
                                                    "${auth.userData['avatar']}",
                                                placeholder: (context, url) =>
                                                    const Center(
                                                        child:
                                                            CircularProgressIndicator(
                                                  color: white,
                                                )),
                                                errorWidget: (context, url,
                                                        error) =>
                                                    const ImageIcon(AssetImage(
                                                        'assets/icons/ic_profile.png')),
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 25,
                                        ),
                                        Expanded(
                                          flex: 6,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Expanded(
                                                child: Column(
                                                  children: [
                                                    Text(
                                                      pinnedApi
                                                          .getTotalNumberOfFollowedUser
                                                          .toString(),
                                                      style:
                                                          getCustomNumberStyle(),
                                                    ),
                                                    Text(
                                                      "Admiring",
                                                      style:
                                                          getCustomTextStyle(),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Expanded(
                                                child: Column(
                                                  children: [
                                                    Text(
                                                      auth.userData[
                                                                  'number_of_views'] ==
                                                              null
                                                          ? "0"
                                                          : auth.userData[
                                                                  'number_of_views']
                                                              .toString(),
                                                      style:
                                                          getCustomNumberStyle(),
                                                    ),
                                                    Text(
                                                      "Views",
                                                      style:
                                                          getCustomTextStyle(),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Expanded(
                                                child: Column(
                                                  children: [
                                                    Text(
                                                      "${auth.userData['number_of_stories']}",
                                                      style:
                                                          getCustomNumberStyle(),
                                                    ),
                                                    Text(
                                                      "Stories",
                                                      style:
                                                          getCustomTextStyle(),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              const SizedBox(width: 20.0),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 5, top: 5),
                                      child: Text(
                                        auth.userData[''] == null ||
                                                auth.userData['first_name'] ==
                                                    ""
                                            ? auth.userData['email'].toString()
                                            : "${capitalizeFirstLetter(auth.userData['first_name'].toString())} ${capitalizeFirstLetter(auth.userData['last_name'].toString())}",
                                        style: getCustomNumberStyle(),
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    isLoading(coinApi.ownCoinsApiResponse)
                                        ? const CupertinoActivityIndicator()
                                        : InkWell(
                                            onTap: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          const CoinHistoryScreen()));
                                            },
                                            child: Row(
                                              children: [
                                                Image.asset(
                                                  "assets/images/coin.png",
                                                  height: 20,
                                                  width: 20,
                                                ),
                                                const SizedBox(width: 8),
                                                Text(
                                                  "${coinApi.ownCoins.quantity ?? 0}",
                                                  style: getCustomNumberStyle(),
                                                ),
                                              ],
                                            ),
                                          ),
                                    const SizedBox(height: 20),
                                    Center(
                                      child: Container(
                                        height: 5,
                                        width: 80,
                                        decoration: BoxDecoration(
                                          // color: Color(0xFF204051),
                                          color: Colors.grey,
                                          borderRadius:
                                              BorderRadius.circular(6),
                                        ),
                                      ),
                                    ),
                                  ],
                                )),
                          ),
                        ),
                      ];
                    },
                    body: auth.userData['stories'] == null
                        ? Container()
                        : GridView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            padding: const EdgeInsets.only(bottom: 50),
                            shrinkWrap: true,
                            itemCount: auth.userData['stories'].length,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              childAspectRatio: 0.65,
                            ),
                            itemBuilder: (context, index) {
                              final mediaItem = auth.userData['stories'][index];
                              final mediaUrl = mediaItem['media_urls'] ??
                                  'https://png.pngtree.com/png-clipart/20230917/original/pngtree-no-image-available-icon-flatvector-illustration-pic-design-profile-vector-png-image_12323913.png';

                              if (mediaUrl.endsWith('.mp4')) {
                                return InkWell(
                                  onTap: () {
                                    auth.updateActiveIndex(index);
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => MyStoryScreen(
                                              data: auth.userData['stories'],
                                              index: index),
                                        ));
                                  },
                                  child: VideoThumbnailWidget(
                                    videoUrl: mediaUrl,
                                    views: mediaItem['views'],
                                  ),
                                );
                              } else {
                                return InkWell(
                                  onTap: () {
                                    auth.updateActiveIndex(index);
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => MyStoryScreen(
                                              data: auth.userData['stories'],
                                              index: index),
                                        ));
                                  },
                                  child: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      CachedNetworkImage(
                                        imageUrl: mediaItem['media_urls'] ==
                                                null
                                            ? 'https://png.pngtree.com/png-clipart/20230917/original/pngtree-no-image-available-icon-flatvector-illustration-pic-design-profile-vector-png-image_12323913.png'
                                            : "https://brain.novutales.com$mediaUrl",
                                        fit: BoxFit.cover,
                                        placeholder: (context, url) =>
                                            const CupertinoActivityIndicator(),
                                        errorWidget: (context, url, error) =>
                                            Image.asset(jpgCorrupted,
                                                fit: BoxFit.cover),
                                      ),
                                      Positioned(
                                        left: 5,
                                        bottom: 5,
                                        child: Row(
                                          children: [
                                            const Icon(Icons.photo,
                                                color: black, size: 15),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              "${mediaItem['views']}",
                                              style:
                                                  const TextStyle(color: black),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                );
                              }
                            },
                          ),
                  ),
                ),
              ),
      );
    });
  }
}

class VideoThumbnailWidget extends StatefulWidget {
  final String videoUrl;
  dynamic views;

  VideoThumbnailWidget({Key? key, required this.videoUrl, required this.views})
      : super(key: key);

  @override
  _VideoThumbnailWidgetState createState() => _VideoThumbnailWidgetState();
}

class _VideoThumbnailWidgetState extends State<VideoThumbnailWidget> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(widget.videoUrl);
    _initializeVideoPlayerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initializeVideoPlayerFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return AspectRatio(
            aspectRatio: _controller.value.aspectRatio,
            child: Stack(
              children: [
                VideoPlayer(_controller),
                Positioned(
                    left: 5,
                    bottom: 5,
                    child: Row(
                      children: [
                        const Icon(
                          Icons.play_arrow_outlined,
                          color: white,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          "${widget.views}",
                          style: const TextStyle(color: white),
                        )
                      ],
                    ))
              ],
            ),
          );
        } else {
          return const CupertinoActivityIndicator();
        }
      },
    );
  }
}

class CustomInkWellWidget extends StatelessWidget {
  final VoidCallback onTap;
  final IconData icon;
  final String text;

  const CustomInkWellWidget({
    super.key,
    required this.onTap,
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          children: [
            Icon(icon, size: 18),
            const SizedBox(width: 10),
            Text(
              text,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontSize: 13.0,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
