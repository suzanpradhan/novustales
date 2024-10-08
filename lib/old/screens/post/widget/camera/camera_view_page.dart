import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

import '../post_info_widget.dart';

class CameraViewPage extends StatelessWidget {
  const CameraViewPage(
      {super.key, required this.path, required this.selectImages});
  final XFile path;
  final List<XFile>? selectImages;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            icon: Icon(
              Icons.check,
              size: 27,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PostInfo(
                            path: path,
                            selectImages: selectImages,
                          )));
            },
          )
        ],
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height - 150,
              child: Image.file(
                File(path.path),
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
