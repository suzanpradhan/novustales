// import 'dart:convert';
//
// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_share/flutter_share.dart';
// import 'package:provider/provider.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:storyv2/helper/overlay_notification.dart';
// import 'package:video_player/video_player.dart';
// import '../../../config/api_response_config.dart';
// import '../../../config/preference_utils.dart';
// import '../../../constants/app_color.dart';
// import '../../../providers/common_view_model.dart';
// import '../../../providers/pinned_view_model.dart';
// import '../../../providers/view_story_model.dart';
// import '../other_user_profile.dart';
// import 'left_panel_widget.dart';
//
// class VideoPlayerItem extends StatefulWidget {
//   final String? id;
//   final String? media;
//   final String? name;
//   final String? caption;
//   final String? profileImg;
//   final String? views;
//   final String? userId;
//
//   const VideoPlayerItem({
//     Key? key,
//     required this.size,
//     required this.id,
//     this.media,
//     this.name,
//     this.caption,
//     this.profileImg,
//     this.views,
//     this.userId,
//   }) : super(key: key);
//   final Size size;
//
//   @override
//   VideoPlayerItemState createState() => VideoPlayerItemState();
// }
//
// class VideoPlayerItemState extends State<VideoPlayerItem> {
//   VideoPlayerController? _videoController;
//   late Future<void> _initializeVideoPlayerFuture;
//   final SharedPreferences localStorage = PreferenceUtils.instance;
//   String username = "";
//
//   @override
//   void initState() {
//     super.initState();
//     getUserData();
//
//     bool isVideo =
//         !["jpeg", "png", "jpg"].contains(widget.media.toString().split(".").last);
//
//     if (isVideo) {
//       _videoController = VideoPlayerController.network(
//           "https://viewstoryapp.com${widget.media}");
//       _initializeVideoPlayerFuture = _videoController!.initialize();
//       _videoController!.setLooping(true);
//     }
//
//     WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
//       ViewStoryModel provider =
//           Provider.of<ViewStoryModel>(context, listen: false);
//       provider.viewStory(widget.id!);
//     });
//   }
//
//   Future getUserData() async {
//     String? userString = localStorage.getString("userData");
//
//     if (userString != null) {
//       Map<String, dynamic> userData = jsonDecode(userString);
//       setState(() {
//         username = userData["id"].toString();
//       });
//       print("USER ID::::${userData["id"]}");
//     }
//   }
//
//   @override
//   void dispose() {
//     super.dispose();
//     _videoController?.dispose();
//   }
//
//   bool isloading = false;
//
//   @override
//   Widget build(BuildContext context) {
//     bool isImage =
//         ["jpeg", "png", "jpg"].contains(widget.media!.split(".").last);
//
//     return InkWell(
//       onTap: () {
//         if (!isImage) {
//           bool playing = _videoController!.value.isPlaying;
//
//           if (playing) {
//             _videoController!.pause();
//           } else {
//             _videoController!.play();
//           }
//         }
//       },
//       child: RotatedBox(
//         quarterTurns: -1,
//         child: SizedBox(
//             height: widget.size.height,
//             width: widget.size.width,
//             child: Stack(
//               children: <Widget>[
//                 Container(
//                   height: widget.size.height,
//                   width: widget.size.width,
//                   decoration: BoxDecoration(color: Colors.black),
//                   child: Stack(
//                     children: <Widget>[
//                       isImage
//                           ? CachedNetworkImage(
//                               fit: BoxFit.fitWidth,
//                               height: double.maxFinite,
//                               width: double.infinity,
//                               imageUrl:
//                                   "https://viewstoryapp.com${widget.media.toString()}",
//                               placeholder: (context, url) => const Center(
//                                   child: CircularProgressIndicator(
//                                 color: white,
//                               )),
//                               errorWidget: (context, url, error) =>
//                                   Image.network(
//                                 "https://i.pinimg.com/564x/46/cb/32/46cb324aa198566f6c238e48a4188eb4.jpg",
//                                 fit: BoxFit.cover,
//                                 height: 220,
//                               ),
//                             )
//                           : FutureBuilder(
//                               future: _initializeVideoPlayerFuture,
//                               builder: (context, snapshot) {
//                                 if (snapshot.connectionState ==
//                                     ConnectionState.done) {
//                                   _videoController!.play();
//                                   return Center(
//                                     child: AspectRatio(
//                                       aspectRatio:
//                                           _videoController!.value.aspectRatio,
//                                       child: VideoPlayer(_videoController!),
//                                     ),
//                                   );
//                                 } else {
//                                   return Center(
//                                       child: CircularProgressIndicator());
//                                 }
//                               },
//                             ),
//                     ],
//                   ),
//                 ),
//                 SizedBox(
//                   height: widget.size.height,
//                   width: widget.size.width,
//                   child: Padding(
//                     padding: EdgeInsets.only(
//                       left: 15,
//                       top: 20,
//                       bottom: 10,
//                     ),
//                     child: SafeArea(
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.end,
//                         children: <Widget>[
//                           Expanded(
//                               child: Row(
//                             children: <Widget>[
//                               LeftPanel(
//                                 size: widget.size,
//                                 caption: "${widget.caption}",
//                                 views: "${int.parse(widget.views ?? "0") + 1}",
//                                 name: "${widget.name}",
//                                 image: "${widget.profileImg}",
//                               ),
//                               Consumer2<PinnedViewModel, CommonViewModel>(
//                                   builder: (context, pin, common, child) {
//                                 return Expanded(
//                                   child: SizedBox(
//                                     height: widget.size.height,
//                                     child: Column(
//                                       mainAxisAlignment: MainAxisAlignment.end,
//                                       children: <Widget>[
//                                         Expanded(
//                                             child: Column(
//                                           mainAxisAlignment:
//                                               MainAxisAlignment.end,
//                                           children: <Widget>[
//                                             // Container(
//                                             //   decoration: BoxDecoration(
//                                             //     border:
//                                             //         Border.all(color: white),
//                                             //     shape: BoxShape.circle,
//                                             //   ),
//                                             //   child: InkWell(
//                                             //     onTap: () {
//                                             //       _videoController!.pause();
//                                             //       Navigator.push(
//                                             //         context,
//                                             //         MaterialPageRoute(
//                                             //           builder: (builder) =>
//                                             //               OtherProfileScreen(
//                                             //             userId: widget.userId
//                                             //                 .toString(),
//                                             //           ),
//                                             //         ),
//                                             //       );
//                                             //     },
//                                             //     child: ClipRRect(
//                                             //       borderRadius:
//                                             //           BorderRadius.circular(
//                                             //               20000),
//                                             //       child: CachedNetworkImage(
//                                             //         height: 50,
//                                             //         width: 50,
//                                             //         fit: BoxFit.cover,
//                                             //         imageUrl:
//                                             //             "https://viewstoryapp.com${widget.profileImg}",
//                                             //         placeholder: (context,
//                                             //                 url) =>
//                                             //             const Center(
//                                             //                 child:
//                                             //                     CupertinoActivityIndicator()),
//                                             //         errorWidget:
//                                             //             (context, url, error) =>
//                                             //                 Icon(Icons.error),
//                                             //       ),
//                                             //     ),
//                                             //   ),
//                                             // ),
//                                             // Builder(builder: (context) {
//                                             //   return Text(
//                                             //     widget.name.toString(),
//                                             //     style: TextStyle(
//                                             //         color: white, fontSize: 12),
//                                             //   );
//                                             // }),
//                                             const SizedBox(
//                                               height: 10,
//                                             ),
//                                             Container(
//                                               padding:
//                                                   const EdgeInsets.symmetric(
//                                                       vertical: 4,
//                                                       horizontal: 3),
//                                               decoration: BoxDecoration(
//                                                 border: Border.all(
//                                                     color: white, width: 1),
//                                                 borderRadius:
//                                                     BorderRadius.circular(20),
//                                                 gradient: LinearGradient(
//                                                     begin: Alignment.topLeft,
//                                                     end: Alignment.bottomRight,
//                                                     colors: [
//                                                       Colors.white
//                                                           .withOpacity(0.15),
//                                                       Colors.white
//                                                           .withOpacity(0.05),
//                                                     ]),
//                                               ),
//                                               child: Column(
//                                                 children: [
//                                                   // const SizedBox(
//                                                   //   height: 10,
//                                                   // ),
//                                                   InkWell(
//                                                       onTap: () async {
//                                                         try {
//                                                           await pin
//                                                               .pinCategoryUser(
//                                                                   widget.userId
//                                                                       .toString());
//                                                           if (pin.pinUser
//                                                                       .success ==
//                                                                   true &&
//                                                               context.mounted) {
//                                                             showTopOverlayNotification(title: pin
//                                                                 .pinUser
//                                                                 .message
//                                                                 .toString());
//
//                                                           } else {
//                                                             showTopOverlayNotificationError(title: pin
//                                                                 .pinUser
//                                                                 .message
//                                                                 .toString());
//
//                                                           }
//                                                         } catch (e) {
//                                                           showTopOverlayNotificationError(title: e.toString());
//
//                                                         }
//                                                       },
//                                                       child: Container(
//                                                         padding:
//                                                             const EdgeInsets
//                                                                 .all(4),
//                                                         decoration:
//                                                             BoxDecoration(
//                                                           shape:
//                                                               BoxShape.circle,
//                                                           boxShadow: [
//                                                             BoxShadow(
//                                                               color: Colors
//                                                                   .white
//                                                                   .withOpacity(
//                                                                       0.2),
//                                                             )
//                                                           ],
//                                                           gradient: LinearGradient(
//                                                               begin: Alignment
//                                                                   .topLeft,
//                                                               end: Alignment
//                                                                   .bottomRight,
//                                                               colors: [
//                                                                 Colors.white
//                                                                     .withOpacity(
//                                                                         0.15),
//                                                                 Colors.white
//                                                                     .withOpacity(
//                                                                         0.05),
//                                                               ]),
//                                                         ),
//                                                         child: isLoadingOnly(pin
//                                                                 .pinUserApiResponse)
//                                                             ? const CircularProgressIndicator()
//                                                             : const Icon(
//                                                                 Icons
//                                                                     .push_pin_outlined,
//                                                                 size: 20,
//                                                                 color: white),
//                                                       )),
//                                                   username == widget.userId
//                                                       ? SizedBox() :const SizedBox(
//                                                     height: 10,
//                                                   ),
//                                                   username == widget.userId
//                                                       ? const SizedBox()
//                                                       : PopupMenuButton<int>(
//                                                           onSelected: (item) {
//                                                             if (item == 1) {
//                                                               // Navigator.pushNamed(context, ChatRequestScreen.routeName);
//                                                             } else if (item ==
//                                                                 2) {}
//                                                           },
//                                                           itemBuilder:
//                                                               (context2) => [
//                                                             PopupMenuItem(
//                                                               onTap: () async {
//                                                                 try {
//                                                                   print(
//                                                                       "USER ID:::${widget.userId.toString()}");
//                                                                   print(
//                                                                       "USER ID:::${widget.id.toString()}");
//                                                                   setState(() {
//                                                                     isloading =
//                                                                         true;
//                                                                   });
//                                                                   await common
//                                                                       .sendMessageRequestTo(widget
//                                                                           .userId
//                                                                           .toString());
//                                                                   if (common.sendMessageRequest
//                                                                               .success ==
//                                                                           true &&
//                                                                       context
//                                                                           .mounted) {
//                                                                     setState(
//                                                                         () {
//                                                                       isloading =
//                                                                           false;
//                                                                     });
//
//                                                                     showTopOverlayNotification(title: common.message.toString());
//
//                                                                   } else {
//                                                                     setState(
//                                                                         () {
//                                                                       isloading =
//                                                                           false;
//                                                                     });
//                                                                     showTopOverlayNotificationError(title: common.message.toString());
//
//
//                                                                   }
//                                                                 } catch (e) {
//                                                                   setState(() {
//                                                                     isloading =
//                                                                         false;
//                                                                   });
//                                                                   showTopOverlayNotificationError(title: e.toString());
//
//
//                                                                 }
//                                                               },
//                                                               value: 1,
//                                                               child: Row(
//                                                                 children: [
//                                                                   Image.asset(
//                                                                     "kUserAdd",
//                                                                     height: 25,
//                                                                     width: 25,
//                                                                   ),
//                                                                   SizedBox(
//                                                                     // sized box with width 10
//                                                                     width: 10,
//                                                                   ),
//                                                                   Text(isloading ==
//                                                                           true
//                                                                       ? "Loading..."
//                                                                       : "Request DM")
//                                                                 ],
//                                                               ),
//                                                             ),
//                                                             PopupMenuItem(
//                                                               value: 2,
//                                                               // row has two child icon and text
//                                                               child: Row(
//                                                                 children: const [
//                                                                   Icon(Icons
//                                                                       .group),
//                                                                   SizedBox(
//                                                                     // sized box with width 10
//                                                                     width: 10,
//                                                                   ),
//                                                                   Text(
//                                                                       "Create group")
//                                                                 ],
//                                                               ),
//                                                             ),
//                                                           ],
//                                                           offset:
//                                                               Offset(0, 100),
//                                                           color:
//                                                               Color(0xffF1F1F1),
//                                                           elevation: 2,
//                                                           child: Container(
//                                                             padding:
//                                                                 const EdgeInsets
//                                                                     .all(4),
//                                                             decoration:
//                                                                 BoxDecoration(
//                                                               shape: BoxShape
//                                                                   .circle,
//                                                               // color:
//                                                               //     white
//                                                               boxShadow: [
//                                                                 BoxShadow(
//                                                                   color: Colors
//                                                                       .white
//                                                                       .withOpacity(
//                                                                           0.2),
//                                                                 )
//                                                               ],
//                                                               gradient: LinearGradient(
//                                                                   begin: Alignment
//                                                                       .topLeft,
//                                                                   end: Alignment
//                                                                       .bottomRight,
//                                                                   colors: [
//                                                                     Colors.white
//                                                                         .withOpacity(
//                                                                             0.15),
//                                                                     Colors.white
//                                                                         .withOpacity(
//                                                                             0.05),
//                                                                   ]),
//                                                             ),
//                                                             child: const Icon(
//                                                                 Icons
//                                                                     .more_horiz,
//                                                                 size: 20,
//                                                                 color: white),
//                                                           ),
//                                                         ),
//
//                                                   const SizedBox(
//                                                     height: 10,
//                                                   ),
//
//                                                   InkWell(
//                                                     onTap: ()async{
//                                                       // String deepLink = await FirebaseDynamicLinkService
//                                                       //     .createReferralLink(
//                                                       //     true, "${widget.id}");
//                                                       //
//                                                       // await FlutterShare.share(
//                                                       //   title: 'Share Story',
//                                                       //   linkUrl: deepLink,
//                                                       // );
//                                                     },
//                                                     child: Container(
//                                                       padding:
//                                                       const EdgeInsets
//                                                           .all(4),
//                                                       decoration:
//                                                       BoxDecoration(
//                                                         shape:
//                                                         BoxShape.circle,
//                                                         boxShadow: [
//                                                           BoxShadow(
//                                                             color: Colors
//                                                                 .white
//                                                                 .withOpacity(
//                                                                 0.2),
//                                                           )
//                                                         ],
//                                                         gradient: LinearGradient(
//                                                             begin: Alignment
//                                                                 .topLeft,
//                                                             end: Alignment
//                                                                 .bottomRight,
//                                                             colors: [
//                                                               Colors.white
//                                                                   .withOpacity(
//                                                                   0.15),
//                                                               Colors.white
//                                                                   .withOpacity(
//                                                                   0.05),
//                                                             ]),
//                                                       ),
//                                                       child: const Icon(
//                                                           Icons
//                                                               .share,
//                                                           size: 20,
//                                                           color: white),
//                                                     ),
//                                                   )
//
//
//                                                   // Container(
//                                                   //   padding: const EdgeInsets.all(4),
//                                                   //   decoration: BoxDecoration(
//                                                   //       boxShadow: [
//                                                   //         BoxShadow(
//                                                   //           color: Colors
//                                                   //               .white
//                                                   //               .withOpacity(
//                                                   //               0.2),
//                                                   //         )
//                                                   //       ],
//                                                   //       gradient: LinearGradient(
//                                                   //           begin: Alignment
//                                                   //               .topLeft,
//                                                   //           end: Alignment
//                                                   //               .bottomRight,
//                                                   //           colors: [
//                                                   //             Colors.white
//                                                   //                 .withOpacity(
//                                                   //                 0.15),
//                                                   //             Colors.white
//                                                   //                 .withOpacity(
//                                                   //                 0.05),
//                                                   //           ]),
//                                                   //       shape: BoxShape.circle, color: white),
//                                                   //   child: const Icon(Icons.share),
//                                                   // ),
//                                                   // const SizedBox(
//                                                   //   height: 10,
//                                                   // ),
//                                                 ],
//                                               ),
//                                             ),
//                                           ],
//                                         ))
//                                       ],
//                                     ),
//                                   ),
//                                 );
//                               }),
//                             ],
//                           ))
//                         ],
//                       ),
//                     ),
//                   ),
//                 )
//               ],
//             )),
//       ),
//     );
//   }
// }
