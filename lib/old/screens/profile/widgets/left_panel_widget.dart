// import 'dart:convert';
//
// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';
//
// import '../../../constants/app_color.dart';
// import '../../../widgets/details_bottom_sheet_widget.dart';
//
// class LeftPanel extends StatelessWidget {
//   final String? caption;
//   final String? views;
//   final String? image;
//   final String? name;
//   const LeftPanel({
//     Key? key,
//     required this.size,
//     this.caption,
//     this.views,
//     this.image,
//     this.name,
//   }) : super(key: key);
//
//   final Size size;
//
//   String decodeEmojiText(String encodedText) {
//     return utf8.decode(encodedText.runes.toList());
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: size.width * 0.8,
//       height: size.height,
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Text(
//             "",
//             style: TextStyle(
//                 color: white, fontWeight: FontWeight.bold, fontSize: 14),
//           ),
//           Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Row(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Container(
//                     decoration: BoxDecoration(
//                       border: Border.all(color: white),
//                       shape: BoxShape.circle,
//                     ),
//                     child: InkWell(
//                       onTap: () {
//                         // _videoController!.pause();
//                         // Navigator.push(
//                         //   context,
//                         //   MaterialPageRoute(
//                         //     builder: (builder) =>
//                         //         OtherProfileScreen(
//                         //       userId: widget.userId
//                         //           .toString(),
//                         //     ),
//                         //   ),
//                         // );
//                       },
//                       child: ClipRRect(
//                         borderRadius: BorderRadius.circular(20000),
//                         child: CachedNetworkImage(
//                           height: 35,
//                           width: 35,
//                           fit: BoxFit.cover,
//                           imageUrl: "https://viewstoryapp.com${image}",
//                           placeholder: (context, url) =>
//                               const Center(child: CupertinoActivityIndicator()),
//                           errorWidget: (context, url, error) =>
//                               Icon(Icons.error),
//                         ),
//                       ),
//                     ),
//                   ),
//                   SizedBox(
//                     width: 5,
//                   ),
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         name.toString(),
//                         style: TextStyle(color: white, fontSize: 13),
//                       ),
//                       Row(
//                         children: [
//                           Icon(
//                             Icons.remove_red_eye,
//                             color: Colors.blueAccent,
//                             size: 18,
//                           ),
//                           SizedBox(
//                             width: 5,
//                           ),
//                           Text(
//                             views ?? "0",
//                             style: TextStyle(color: Colors.blueAccent, fontSize: 13, height: 1.5),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//               SizedBox(height:7),
//               Builder(builder: (context) {
//                 int testLengthy = caption.toString().length;
//                 final decodedEmoji = decodeEmojiText(caption.toString());
//                 if (testLengthy > 30) {
//                   return RichText(
//                     text: TextSpan(
//                       style: TextStyle(
//                           color: white,
//                           // fontWeight: FontWeight.normal,
//                           fontSize: 14),
//                       children: [
//                         TextSpan(
//                           text: decodedEmoji.toString().substring(0, 30),
//                         ),
//                         TextSpan(
//                           text: "  Read more",
//                           style: const TextStyle(color: Colors.blue),
//                           recognizer: TapGestureRecognizer()
//                             ..onTap = () {
//                               bottomDetails(context, decodedEmoji.toString());
//                             },
//                         ),
//                       ],
//                     ),
//                     maxLines: 1,
//                     overflow: TextOverflow.fade,
//                   );
//                 } else {
//                   return Text(
//                     decodedEmoji.toString(),
//                     style: TextStyle(
//                         color: white,
//                         // fontWeight: FontWeight.normal,
//                         fontSize: 14
//                     ),
//                   );
//                 }
//               }),
//               SizedBox(height:6),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
