// import 'dart:io';
//
// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:story_time/story_page_view/story_page_view.dart';
// import 'package:video_player/video_player.dart';
//
// class PreviewPost extends StatefulWidget {
//   final String mediaType;
//   final PickedFile media;
//   const PreviewPost({
//     super.key,
//     required this.mediaType,
//     required this.media,
//   });
//
//   @override
//   State<PreviewPost> createState() => _PreviewPostState();
// }
//
// class _PreviewPostState extends State<PreviewPost> {
//   late ValueNotifier<IndicatorAnimationCommand> indicatorAnimationController;
//   VideoPlayerController? _videoController;
//   bool isInitialized = false;
//
//   @override
//   void initState() {
//     super.initState();
//     indicatorAnimationController = ValueNotifier<IndicatorAnimationCommand>(
//       IndicatorAnimationCommand(resume: true),
//     );
//   }
//
//   @override
//   void dispose() {
//     indicatorAnimationController.dispose();
//     if (_videoController != null) {
//       _videoController!.dispose();
//     }
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     double width = MediaQuery.of(context).size.width;
//     double height = MediaQuery.of(context).size.height;
//
//     return Scaffold(
//       body: SafeArea(
//         child: StoryPageView(
//           initialPage: 0,
//           onStoryIndexChanged: (int newStoryIndex) {
//             indicatorAnimationController.value = IndicatorAnimationCommand(
//               duration: Duration(seconds: 10),
//             );
//           },
//           itemBuilder: (context, pageIndex, storyIndex) {
//             if (widget.mediaType == "video") {
//               _videoController =
//                   VideoPlayerController.file(File(widget.media.path))
//                     ..initialize().then((_) {
//                       _videoController!.play();
//
//                       indicatorAnimationController.value =
//                           IndicatorAnimationCommand(
//                         duration: _videoController!.value.duration,
//                       );
//                     });
//             }
//
//             return GestureDetector(
//               onVerticalDragDown: (DragDownDetails value) {
//                 Navigator.of(context).pop();
//               },
//               child: SizedBox(
//                 height: height,
//                 width: width,
//                 child: Stack(
//                   children: [
//                     Positioned.fill(
//                       child: Container(color: Colors.black),
//                     ),
//                     if (widget.mediaType == "image")
//                       Image(
//                         height: double.maxFinite,
//                         width: double.maxFinite,
//                         fit: BoxFit.fitWidth,
//                         image: FileImage(
//                           File(widget.media.path),
//                         ),
//                       )
//                     else
//                       Center(
//                         child: AspectRatio(
//                           aspectRatio: _videoController!.value.aspectRatio,
//                           child: VideoPlayer(_videoController!),
//                         ),
//                       ),
//                   ],
//                 ),
//               ),
//             );
//           },
//           gestureItemBuilder: (context, pageIndex, storyIndex) {
//             return Stack(
//               children: [
//                 Align(
//                   alignment: Alignment.topRight,
//                   child: Padding(
//                     padding: const EdgeInsets.only(top: 32),
//                     child: IconButton(
//                       padding: EdgeInsets.zero,
//                       color: Colors.white,
//                       icon: const Icon(Icons.close),
//                       onPressed: () {
//                         Navigator.pop(context);
//                       },
//                     ),
//                   ),
//                 ),
//               ],
//             );
//           },
//           indicatorAnimationController: indicatorAnimationController,
//           initialStoryIndex: (pageIndex) {
//             return pageIndex;
//           },
//           pageLength: 1,
//           storyLength: (int pageIndex) {
//             return 1;
//           },
//           onPageLimitReached: () {
//             Navigator.pop(context);
//           },
//         ),
//       ),
//     );
//   }
// }
