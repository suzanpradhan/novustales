import 'dart:math';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image_picker/image_picker.dart';
// import 'package:video_compress/video_compress.dart';
import 'package:video_player/video_player.dart';

import '../add_story_screen.dart';

List<CameraDescription> cameras = [];

class CameraPage extends StatelessWidget {
  const CameraPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const CameraScreen();
  }
}

class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});

  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  late CameraController _cameraController;
  late Future<void> _cameraInitialization;
  bool isRecoring = false;
  bool flash = false;
  bool iscamerafront = true;
  double transform = 0;
  XFile? _imageFile;
  VideoPlayerController? videoController;

  @override
  void initState() {
    super.initState();
    _cameraController = CameraController(cameras[0], ResolutionPreset.high);
    _cameraInitialization = _cameraController.initialize();
  }

  final ImagePicker _picker = ImagePicker();

  // Future<void> _pickMultipleVideoAndImage(BuildContext context) async {
  //   try {
  //     final XFile? pickedFileList = await _picker.pickMedia(imageQuality: 85);
  //     print("PICKED IMAGE::${pickedFileList}");
  //     if (pickedFileList != null) {
  //       if (pickedFileList.path.contains(".mp4") ||
  //           pickedFileList.path.contains(".mov")) {
  //         await VideoCompress.setLogLevel(0);
  //         final info = await VideoCompress.compressVideo(
  //           pickedFileList.path,
  //           quality: VideoQuality.MediumQuality,
  //           deleteOrigin: false,
  //           includeAudio: true,
  //         );
  //         _imageFile = [XFile(info!.path.toString())];
  //         // print(info!.path);
  //         // setState(() {
  //         //   _counter = info.path!;
  //         // });
  //       }
  //
  //       setState(() {
  //         _imageFile = [pickedFileList];
  //         chooseMultipleImages(context);
  //       });
  //     }
  //   } catch (e) {}
  // }

  @override
  void dispose() {
    super.dispose();
    _cameraController.dispose();
  }

  @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     body: Stack(
  //       children: [
  //         FutureBuilder(
  //             future: cameraValue,
  //             builder: (context, snapshot) {
  //               if (snapshot.connectionState == ConnectionState.done) {
  //                 return Container(
  //                     width: MediaQuery.of(context).size.width,
  //                     height: MediaQuery.of(context).size.height,
  //                     child: CameraPreview(_cameraController));
  //               } else {
  //                 return Center(
  //                     child: Container(
  //                       color: Colors.black,
  //                     )
  //                   // CircularProgressIndicator(),
  //                 );
  //               }
  //             }),
  //         Positioned(
  //           bottom: 0.0,
  //           child: Container(
  //             color: Colors.black,
  //             padding: EdgeInsets.only(top: 5, bottom: 5),
  //             width: MediaQuery.of(context).size.width,
  //             child: Column(
  //               children: [
  //                 Row(
  //                   mainAxisSize: MainAxisSize.max,
  //                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //                   children: [
  //                     Icon(Icons.fullscreen, color: Colors.white),
  //                     IconButton(
  //                         icon: Icon(
  //                           flash ? Icons.flash_on : Icons.flash_off,
  //                           color: Colors.white,
  //                           size: 28,
  //                         ),
  //                         onPressed: () {
  //                           setState(() {
  //                             flash = !flash;
  //                           });
  //                           flash
  //                               ? _cameraController
  //                               .setFlashMode(FlashMode.torch)
  //                               : _cameraController.setFlashMode(FlashMode.off);
  //                         }),
  //                     GestureDetector(
  //                       onLongPress: () async {
  //                         await _cameraController.startVideoRecording();
  //                         setState(() {
  //                           isRecoring = true;
  //                         });
  //                       },
  //                       onLongPressUp: () async {
  //                         XFile videopath =
  //                         await _cameraController.stopVideoRecording();
  //                         setState(() {
  //                           isRecoring = false;
  //                         });
  //                         // Navigator.push(
  //                         //     context,
  //                         //     MaterialPageRoute(
  //                         //         builder: (builder) => VideoViewPage(
  //                         //           path: videopath,
  //                         //           selectImages: [],
  //                         //         )));
  //                       },
  //                       onTap: () {
  //                         if (!isRecoring) takePhoto(context);
  //                       },
  //                       child: isRecoring
  //                           ? Icon(
  //                         Icons.radio_button_on,
  //                         color: Colors.red,
  //                         size: 80,
  //                       )
  //                           : Icon(
  //                         Icons.panorama_fish_eye,
  //                         color: Colors.white,
  //                         size: 70,
  //                       ),
  //                     ),
  //                     IconButton(
  //                         icon: Transform.rotate(
  //                           angle: transform,
  //                           child: Icon(
  //                             Icons.flip_camera_ios,
  //                             color: Colors.white,
  //                             size: 28,
  //                           ),
  //                         ),
  //                         onPressed: () async {
  //                           setState(() {
  //                             iscamerafront = !iscamerafront;
  //                             transform = transform + pi;
  //                           });
  //                           int cameraPos = iscamerafront ? 0 : 1;
  //                           _cameraController = CameraController(
  //                               cameras[cameraPos], ResolutionPreset.high);
  //                           cameraValue = _cameraController.initialize();
  //                         }),
  //                     IconButton(
  //                         onPressed: () async {
  //                           _pickMultipleVideoAndImage(context);
  //                         },
  //                         icon: Icon(
  //                           Icons.image_outlined,
  //                           color: Colors.white,
  //                           size: 28,
  //                         ))
  //                   ],
  //                 ),
  //                 SizedBox(
  //                   height: 4,
  //                 ),
  //                 Text(
  //                   "Hold for Video, tap for photo",
  //                   style: TextStyle(
  //                     color: Colors.white,
  //                   ),
  //                   textAlign: TextAlign.center,
  //                 )
  //               ],
  //             ),
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }
  //
  // void takePhoto(BuildContext context) async {
  //   XFile file = await _cameraController.takePicture();
  //   print("IMAGE::PATH IS ::${file.path}");
  //   // Navigator.push(
  //   //     context,
  //   //     MaterialPageRoute(
  //   //         builder: (builder) => CameraViewPage(
  //   //           path: file,
  //   //           selectImages: [],
  //   //         )));
  // }
  //
  // void chooseMultipleImages(BuildContext context) async {
  //   if (_imageFile != null) {
  //     print("navigate to the screen post:::");
  //     // Navigator.push(
  //     //     context,
  //     //     MaterialPageRoute(
  //     //         builder: (context) => PostInfo(
  //     //           selectImages: _imageFile,
  //     //           path: XFile(""),
  //     //         )));
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _buildCameraPreview(),
          Positioned(
            bottom: 0.0,
            child: _buildCameraControls(),
          ),
        ],
      ),
    );
  }

  Widget _buildCameraPreview() {
    return FutureBuilder(
      future: _cameraInitialization,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: CameraPreview(_cameraController),
          );
        } else {
          return Center(
            child: Container(
              color: Colors.black,
            ),
          );
        }
      },
    );
  }

  Widget _buildCameraControls() {
    return Container(
      color: Colors.black,
      padding: EdgeInsets.only(top: 5, bottom: 5),
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(Icons.fullscreen, color: Colors.white),
              IconButton(
                icon: Icon(
                  flash ? Icons.flash_on : Icons.flash_off,
                  color: Colors.white,
                  size: 28,
                ),
                onPressed: _toggleFlash,
              ),
              // _buildCaptureButton(),
              IconButton(
                icon: Transform.rotate(
                  angle: transform,
                  child: const Icon(
                    Icons.flip_camera_ios,
                    color: Colors.white,
                    size: 28,
                  ),
                ),
                onPressed: _toggleCamera,
              ),
              IconButton(
                onPressed: _pickVideoOrImage,
                icon: const Icon(
                  Icons.image_outlined,
                  color: Colors.white,
                  size: 28,
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          const Text(
            "Hold for Video, tap for photo",
            style: TextStyle(color: Colors.white),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  // Widget _buildCaptureButton() {
  //   return GestureDetector(
  //     onLongPress: _startVideoRecording,
  //     onLongPressUp: _stopVideoRecording,
  //     onTap: isRecoring ? null : () => takePhoto(context),
  //     child: isRecoring
  //         ? const Icon(
  //             Icons.radio_button_on,
  //             color: Colors.red,
  //             size: 80,
  //           )
  //         : const Icon(
  //             Icons.panorama_fish_eye,
  //             color: Colors.white,
  //             size: 70,
  //           ),
  //   );
  // }

  void _toggleFlash() {
    setState(() {
      flash = !flash;
    });
    flash
        ? _cameraController.setFlashMode(FlashMode.torch)
        : _cameraController.setFlashMode(FlashMode.off);
  }

  void _toggleCamera() async {
    setState(() {
      iscamerafront = !iscamerafront;
      transform = transform + pi;
    });
    int cameraPos = iscamerafront ? 0 : 1;
    _cameraController =
        CameraController(cameras[cameraPos], ResolutionPreset.high);
    _cameraInitialization = _cameraController.initialize();
  }

  Future<void> _startVideoRecording() async {
    await _cameraController.startVideoRecording();
    setState(() {
      isRecoring = true;
    });
  }

  // Future<void> _stopVideoRecording() async {
  //   XFile videoPath = await _cameraController.stopVideoRecording();
  //   setState(() {
  //     isRecoring = false;
  //   });
  //   // Compress the video
  //   try {
  //     await VideoCompress.setLogLevel(0);
  //     final compressedVideoInfo = await VideoCompress.compressVideo(
  //       videoPath.path,
  //       quality: VideoQuality.MediumQuality,
  //     );
  //     final compressedVideoPath = compressedVideoInfo!.path;

  //     print("Compressed video path: $compressedVideoPath");

  //     if (context.mounted) {
  //       navigateToAddStoryScreen(context, compressedVideoPath.toString());
  //     }
  //   } catch (error) {
  //     print("Error compressing video: $error");
  //   }
  // }

  Future<void> _pickVideoOrImage() async {
    try {
      final XFile? pickedFileList = await _picker.pickMedia(imageQuality: 85);

      if (pickedFileList != null) {
        await handlePickedFile(pickedFileList);
      }
    } catch (e) {
      // Handle errors
      print("Error picking media: $e");
    }
  }

  Future<void> handlePickedFile(XFile pickedFile) async {
    try {
      if (pickedFile.path.contains(".mp4") ||
          pickedFile.path.contains(".mov")) {
        // await handleVideo(pickedFile);
      } else {
        await handleImage(pickedFile);
      }
    } catch (e) {
      // Handle errors
      print("Error handling picked file: $e");
    }
  }

  // Future<void> handleVideo(XFile pickedVideo) async {
  //   try {
  //     final info = await VideoCompress.compressVideo(
  //       pickedVideo.path,
  //       quality: VideoQuality.MediumQuality,
  //       deleteOrigin: false,
  //       includeAudio: true,
  //     );

  //     if (context.mounted) {
  //       navigateToAddStoryScreen(
  //           context, XFile(info!.path.toString()).path.toString());
  //     }
  //   } catch (e) {
  //     // Handle video compression errors
  //     print("Error compressing video: $e");
  //   }
  // }

  Future<void> handleImage(XFile pickedImage) async {
    // XFile? compressedImageFile = await compressImage(pickedImage);

    // if (compressedImageFile != null) {
    //   print(
    //       "Compressed Image Path: ${await compressedImageFile.length()} :: ${compressedImageFile.path}");
    //   if (context.mounted) {
    //     navigateToAddStoryScreen(context, compressedImageFile.path);
    //   }
    // } else {
    //   // Handle compression failure
    //   print("Image compression failed.");
    // }
  }

  // Future<XFile?> compressImage(XFile originalFile) async {
  //   final Uint8List? compressedData = await FlutterImageCompress.compressWithFile(
  //     originalFile.path,
  //     quality: 80, // Adjust quality as needed
  //   );

  //   if (compressedData != null) {
  //     // Get the application documents directory
  //     final appDocumentsDirectory = await getApplicationDocumentsDirectory();

  //     // Save compressed data to a new file
  //     final compressedFilePath = '${appDocumentsDirectory.path}/compressed_image.jpg';
  //     await File(compressedFilePath).writeAsBytes(compressedData);

  //     return XFile(compressedFilePath);
  //   } else {
  //     // Handle compression failure or null value as needed
  //     return null;
  //   }
  // }

  void takePhoto(BuildContext context) async {
    XFile originalFile = await _cameraController.takePicture();
    if (context.mounted) {
      navigateToAddStoryScreen(context, originalFile.path);
    }
  }

  void navigateToAddStoryScreen(BuildContext context, String imagePath) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AddStoryScreen(assetPath: imagePath),
      ),
    );
  }
}
