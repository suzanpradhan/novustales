// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:storyv2/helper/overlay_notification.dart';
// import '../../../config/api_response_config.dart';
// import '../../../constants/app_color.dart';
// import '../../../providers/pinned_view_model.dart';
// import '../other_user_profile.dart';
//
// class RightPanel extends StatelessWidget {
//   final String profileImg;
//   final String name;
//   final String userId;
//   const RightPanel({
//     Key? key,
//     required this.size,
//     required this.name,
//     required this.profileImg,
//     required this.userId,
//   }) : super(key: key);
//
//   final Size size;
//   final bool isloading = false;
//
//   @override
//   Widget build(BuildContext context) {
//     return Consumer<PinnedViewModel>(builder: (context, pin, child) {
//       return Expanded(
//         child: SizedBox(
//           height: size.height,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.end,
//             children: <Widget>[
//               Expanded(
//                   child: Column(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 children: <Widget>[
//                   Container(
//                     decoration: BoxDecoration(
//                       border: Border.all(color: white),
//                       shape: BoxShape.circle,
//                     ),
//                     child: InkWell(
//                       // onTap: () => Navigator.push(
//                       //   context,
//                       //   MaterialPageRoute(
//                       //     builder: (builder) => OtherProfileScreen(
//                       //       userId: userId,
//                       //     ),
//                       //   ),
//                       // ),
//                       child: ClipRRect(
//                         borderRadius: BorderRadius.circular(20000),
//                         child: CachedNetworkImage(
//                           height: 50,
//                           width: 50,
//                           fit: BoxFit.cover,
//                           imageUrl: "https://viewstoryapp.com$profileImg",
//                           placeholder: (context, url) =>
//                               const Center(child: CupertinoActivityIndicator()),
//                           errorWidget: (context, url, error) =>
//                               Icon(Icons.error),
//                         ),
//                       ),
//                     ),
//                   ),
//                   Builder(builder: (context) {
//                     return Text(
//                       name,
//                       style: TextStyle(color: white, fontSize: 12),
//                     );
//                   }),
//                   const SizedBox(
//                     height: 10,
//                   ),
//                   Container(
//                     padding:
//                         const EdgeInsets.symmetric(vertical: 3, horizontal: 4),
//                     decoration: BoxDecoration(
//                         border: Border.all(color: white, width: 2),
//                         borderRadius: BorderRadius.circular(20)),
//                     child: Column(
//                       children: [
//                         // Container(
//                         //   padding: const EdgeInsets.all(4),
//                         //   decoration: const BoxDecoration(
//                         //       shape: BoxShape.circle,
//                         //       color: white),
//                         //   child: const Icon(Icons.pause),),
//                         const SizedBox(
//                           height: 10,
//                         ),
//                         InkWell(
//                             onTap: () async {
//                               // pin.pinCategoryUser(userId.toString());
//                               try {
//                                 await pin.pinCategoryUser(userId.toString());
//                                 if (pin.pinUser.success == true &&
//                                     context.mounted) {
//                                   showTopOverlayNotification(
//                                       title: pin.pinUser.message.toString());
//                                 } else {
//                                   showTopOverlayNotificationError(
//                                       title: pin.pinUser.message.toString());
//                                 }
//                               } catch (e) {
//                                 showTopOverlayNotificationError(
//                                     title: e.toString());
//                               }
//                             },
//                             child: Container(
//                               padding: const EdgeInsets.all(4),
//                               decoration: const BoxDecoration(
//                                   shape: BoxShape.circle, color: white),
//                               child: isLoadingOnly(pin.pinUserApiResponse)
//                                   ? const CircularProgressIndicator()
//                                   : const Icon(Icons.push_pin_outlined),
//                             )),
//                         const SizedBox(
//                           height: 10,
//                         ),
//                         Container(
//                           padding: const EdgeInsets.all(4),
//                           decoration: const BoxDecoration(
//                               shape: BoxShape.circle, color: white),
//                           child: const Icon(Icons.more_horiz),
//                         ),
//                         const SizedBox(
//                           height: 10,
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ))
//             ],
//           ),
//         ),
//       );
//     });
//   }
// }
