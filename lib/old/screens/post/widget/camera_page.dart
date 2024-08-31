// import 'dart:math';

// import 'package:camera/camera.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:storyv2/old/screens/post/widget/post_info_widget.dart';
// // import 'package:video_compress/video_compress.dart';
// import 'package:video_player/video_player.dart';

// import 'camera/camera_view_page.dart';
// import 'camera/video_view_page.dart';

// List<CameraDescription> cameras = [];

// class CameraPage extends StatelessWidget {
//   const CameraPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return CameraScreen();
//   }
// }

// class CameraScreen extends StatefulWidget {
//   const CameraScreen({Key? key}) : super(key: key);

//   @override
//   _CameraScreenState createState() => _CameraScreenState();
// }

// class _CameraScreenState extends State<CameraScreen> {
//   late CameraController _cameraController;
//   late Future<void> cameraValue;
//   bool isRecoring = false;
//   bool flash = false;
//   bool iscamerafront = true;
//   double transform = 0;
//   List<XFile>? _imageFile;
//   VideoPlayerController? videoController;

//   @override
//   void initState() {
//     super.initState();
//     _cameraController = CameraController(cameras[0], ResolutionPreset.high);
//     cameraValue = _cameraController.initialize();
//   }

//   final ImagePicker _picker = ImagePicker();

//   Future<void> _pickMultipleVideoAndImage(BuildContext context) async {
//     try {
//       final XFile? pickedFileList = await _picker.pickMedia(imageQuality: 85);
//       print("PICKED IMAGE::$pickedFileList");
//       if (pickedFileList != null) {
//         if (pickedFileList.path.contains(".mp4") ||
//             pickedFileList.path.contains(".mov")) {
//           await VideoCompress.setLogLevel(0);
//           final info = await VideoCompress.compressVideo(
//             pickedFileList.path,
//             quality: VideoQuality.MediumQuality,
//             deleteOrigin: false,
//             includeAudio: true,
//           );
//           _imageFile = [XFile(info!.path.toString())];
//           // print(info!.path);
//           // setState(() {
//           //   _counter = info.path!;
//           // });
//         }

//         setState(() {
//           _imageFile = [pickedFileList];
//           chooseMultipleImages(context);
//         });
//       }
//     } catch (e) {}
//   }

//   @override
//   void dispose() {
//     super.dispose();
//     _cameraController.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           FutureBuilder(
//               future: cameraValue,
//               builder: (context, snapshot) {
//                 if (snapshot.connectionState == ConnectionState.done) {
//                   return SizedBox(
//                       width: MediaQuery.of(context).size.width,
//                       height: MediaQuery.of(context).size.height,
//                       child: CameraPreview(_cameraController));
//                 } else {
//                   return Center(
//                       child: Container(
//                     color: Colors.black,
//                   )
//                       // CircularProgressIndicator(),
//                       );
//                 }
//               }),
//           Positioned(
//             bottom: 0.0,
//             child: Container(
//               color: Colors.black,
//               padding: EdgeInsets.only(top: 5, bottom: 5),
//               width: MediaQuery.of(context).size.width,
//               child: Column(
//                 children: [
//                   Row(
//                     mainAxisSize: MainAxisSize.max,
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: [
//                       Icon(Icons.fullscreen, color: Colors.white),
//                       IconButton(
//                           icon: Icon(
//                             flash ? Icons.flash_on : Icons.flash_off,
//                             color: Colors.white,
//                             size: 28,
//                           ),
//                           onPressed: () {
//                             setState(() {
//                               flash = !flash;
//                             });
//                             flash
//                                 ? _cameraController
//                                     .setFlashMode(FlashMode.torch)
//                                 : _cameraController.setFlashMode(FlashMode.off);
//                           }),
//                       GestureDetector(
//                         onLongPress: () async {
//                           await _cameraController.startVideoRecording();
//                           setState(() {
//                             isRecoring = true;
//                           });
//                         },
//                         onLongPressUp: () async {
//                           XFile videopath =
//                               await _cameraController.stopVideoRecording();
//                           setState(() {
//                             isRecoring = false;
//                           });
//                           Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                   builder: (builder) => VideoViewPage(
//                                         path: videopath,
//                                         selectImages: const [],
//                                       )));
//                         },
//                         onTap: () {
//                           if (!isRecoring) takePhoto(context);
//                         },
//                         child: isRecoring
//                             ? Icon(
//                                 Icons.radio_button_on,
//                                 color: Colors.red,
//                                 size: 80,
//                               )
//                             : Icon(
//                                 Icons.panorama_fish_eye,
//                                 color: Colors.white,
//                                 size: 70,
//                               ),
//                       ),
//                       IconButton(
//                           icon: Transform.rotate(
//                             angle: transform,
//                             child: Icon(
//                               Icons.flip_camera_ios,
//                               color: Colors.white,
//                               size: 28,
//                             ),
//                           ),
//                           onPressed: () async {
//                             setState(() {
//                               iscamerafront = !iscamerafront;
//                               transform = transform + pi;
//                             });
//                             int cameraPos = iscamerafront ? 0 : 1;
//                             _cameraController = CameraController(
//                                 cameras[cameraPos], ResolutionPreset.high);
//                             cameraValue = _cameraController.initialize();
//                           }),
//                       IconButton(
//                           onPressed: () async {
//                             _pickMultipleVideoAndImage(context);
//                           },
//                           icon: Icon(
//                             Icons.image_outlined,
//                             color: Colors.white,
//                             size: 28,
//                           ))
//                     ],
//                   ),
//                   SizedBox(
//                     height: 4,
//                   ),
//                   Text(
//                     "Hold for Video, tap for photo",
//                     style: TextStyle(
//                       color: Colors.white,
//                     ),
//                     textAlign: TextAlign.center,
//                   )
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   void takePhoto(BuildContext context) async {
//     XFile file = await _cameraController.takePicture();
//     print("IMAGE::PATH IS ::${file.path}");
//     Navigator.push(
//         context,
//         MaterialPageRoute(
//             builder: (builder) => CameraViewPage(
//                   path: file,
//                   selectImages: const [],
//                 )));
//   }

//   void chooseMultipleImages(BuildContext context) async {
//     if (_imageFile != null) {
//       print("navigate to the screen post:::");
//       Navigator.push(
//           context,
//           MaterialPageRoute(
//               builder: (context) => PostInfo(
//                     selectImages: _imageFile,
//                     path: XFile(""),
//                   )));
//     }
//   }
// }
