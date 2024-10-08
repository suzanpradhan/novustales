import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../config/api_response_config.dart';
import '../../constants/app_color.dart';
import '../../providers/auth_view_model.dart';
import '../../providers/coin_view_model.dart';
import '../../providers/pinned_view_model.dart';
import '../../providers/story_view_model.dart';
import '../../widgets/capitalize_initals.dart';

class OtherUserProfileScreen extends StatefulWidget {
  String? id;
  static const String routeName = "/otherUserprofile";
  OtherUserProfileScreen({super.key, required this.id});

  @override
  OtherUserProfileScreenState createState() => OtherUserProfileScreenState();
}

class OtherUserProfileScreenState extends State<OtherUserProfileScreen>
    with SingleTickerProviderStateMixin {
  late AuthViewModel _provider;
  late StoryViewModel _provider2;
  late CoinViewModel _provider3;
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _provider = Provider.of<AuthViewModel>(context, listen: false);
      _provider2 = Provider.of<StoryViewModel>(context, listen: false);
      _provider3 = Provider.of<CoinViewModel>(context, listen: false);

      _provider2.updateCategory("");
      _provider2.fetchTrendingStory();
      _provider.fetchOtherUser(widget.id.toString());
      // _provider.fetchUser();
    });
    super.initState();
  }

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

  @override
  Widget build(BuildContext context) {
    double screenH = MediaQuery.of(context).size.height;

    return Consumer3<AuthViewModel, PinnedViewModel, CoinViewModel>(
        builder: (context, auth, pinnedApi, coinApi, child) {
      return WillPopScope(
        onWillPop: () {
          Navigator.of(context).pop();
          return Future.value(true);
        },
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              capitalizeFirstLetter(auth.otherUserDetails.nickName.toString()),
              style: const TextStyle(
                color: Colors.black,
                fontSize: 20.0,
                fontWeight: FontWeight.w700,
              ),
            ),
            centerTitle: true,
          ),
          extendBodyBehindAppBar: true,
          body: isLoading(auth.otherUserDetailsApiResponse)
              ? const Center(child: CircularProgressIndicator())
              : SafeArea(
                  child: DefaultTabController(
                    length: 3,
                    child: NestedScrollView(
                      headerSliverBuilder: (context, value) {
                        return [
                          SliverAppBar(
                            automaticallyImplyLeading: false,
                            toolbarHeight: 180,
                            flexibleSpace: FlexibleSpaceBar(
                              titlePadding: EdgeInsets.zero,
                              title: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 5, horizontal: 10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                                      "${auth.otherUserDetails.avatar}",
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
                                          Expanded(
                                            flex: 6,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
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
                                                        auth.otherUserDetails
                                                                    .numberOfViews ==
                                                                null
                                                            ? "0"
                                                            : auth
                                                                .otherUserDetails
                                                                .numberOfViews
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
                                                        "${auth.otherUserDetails.numberOfStories}",
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
                                                SizedBox(width: 20.0),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 5, top: 5),
                                            child: Text(
                                              auth.otherUserDetails.firstName ==
                                                          null ||
                                                      auth.otherUserDetails
                                                              .firstName ==
                                                          ""
                                                  ? auth.otherUserDetails.email
                                                      .toString()
                                                  : "${capitalizeFirstLetter(auth.otherUserDetails.firstName.toString())} ${capitalizeFirstLetter(auth.otherUserDetails.lastName.toString())}",
                                              style: getCustomNumberStyle(),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 20),
                                      // Row(
                                      //   children: [
                                      //     Container(
                                      //       height: 30,
                                      //       width: 100,
                                      //       decoration: BoxDecoration(
                                      //         color: Color(0xFF204051),
                                      //         borderRadius:
                                      //             BorderRadius.circular(20),
                                      //       ),
                                      //       child: Center(
                                      //         child: Text(
                                      //           "Follow",
                                      //           style: getCustomTextStyle(),
                                      //         ),
                                      //       ),
                                      //     ),
                                      //   ],
                                      // ),
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
                      body: GridView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        padding: EdgeInsets.only(bottom: 50),
                        shrinkWrap: true,
                        itemCount: auth.otherUserDetails.stories?.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          childAspectRatio: 0.65,
                        ),
                        itemBuilder: (BuildContext context, int index) {
                          bool isImage = ["jpeg", "png", "jpg"].contains(auth
                              .otherUserDetails.stories![index].media!
                              .split(".")
                              .last);
                          return Container(
                            padding: EdgeInsets.all(2),
                            child: GestureDetector(
                              behavior: HitTestBehavior.opaque,
                              onLongPress: () {
                                // showDialog(
                                //   context: context,
                                //   builder: (context1) => AlertDialog(
                                //     title: Text(
                                //         "Do you want to delete this story?"),
                                //     actions: [
                                //       ElevatedButton(
                                //         onPressed: () =>
                                //             Navigator.of(context1).pop(),
                                //         child: Text("No"),
                                //       ),
                                //       ElevatedButton(
                                //         onPressed: () async {
                                //           Navigator.of(context1).pop();
                                //
                                //           final String url =
                                //               "https://viewstoryapp.com/api/story/${auth.otherUserDetails.stories![index].id}/";
                                //           final response =
                                //               await delete(Uri.parse(url));
                                //
                                //           if (response.statusCode == 204 &&
                                //               context.mounted) {
                                //             // auth.fetchOtherUser(location);
                                //             ScaffoldMessenger.of(context)
                                //                 .showSnackBar(
                                //               SnackBar(
                                //                 margin: EdgeInsets.symmetric(
                                //                     vertical: 10,
                                //                     horizontal: 25),
                                //                 behavior:
                                //                     SnackBarBehavior.floating,
                                //                 backgroundColor: Colors.green,
                                //                 content: Text(
                                //                   "Story Deleted.",
                                //                   textAlign: TextAlign.center,
                                //                 ),
                                //               ),
                                //             );
                                //           }
                                //         },
                                //         style: ElevatedButton.styleFrom(
                                //             backgroundColor: Colors.red),
                                //         child: Text("Yes"),
                                //       ),
                                //     ],
                                //   ),
                                // );
                              },
                              onTap: () {
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //     builder: (context) => UserStoryScreen(
                                //       story: auth.otherUserDetails.stories![index],
                                //     ),
                                //   ),
                                // );
                              },
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: CachedNetworkImage(
                                  fit: BoxFit.cover,
                                  height: double.maxFinite,
                                  imageUrl: isImage
                                      ? "https://brain.novutales.com${auth.otherUserDetails.stories![index].media}"
                                      : "https://brain.novutales.com${auth.otherUserDetails.stories![0].userDetails!.avatar}",
                                  width: double.infinity,
                                  placeholder: (context, url) => Center(
                                      child: CircularProgressIndicator()),
                                  errorWidget: (context, url, error) => Center(
                                    child: Icon(Icons.error_outline),
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
        ),
      );
    });
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
            SizedBox(width: 10),
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
