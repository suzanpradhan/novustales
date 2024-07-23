import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:storyv2/old/screens/profile/scan_qr_camera.dart';

import '../../constants/app_image.dart';

class QRImage extends StatefulWidget {
  final String userId;

  @override
  const QRImage({super.key, required this.userId});

  @override
  _QRImageState createState() => _QRImageState();
}

class _QRImageState extends State<QRImage> {
  String gradientCode = '';
  Color color1 = Colors.blue;
  Color color2 = Colors.purple;

  void generateGradient() {
    final Random random = Random();
    color1 = Color.fromRGBO(
        random.nextInt(256), random.nextInt(256), random.nextInt(256), 1);
    color2 = Color.fromRGBO(
        random.nextInt(256), random.nextInt(256), random.nextInt(256), 1);

    gradientCode = '''
      background: linear-gradient(to bottom, ${color1.toString()}, ${color2.toString()});
    ''';

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: color1,
        centerTitle: true,
        actions: [
          InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const QrViewCameraScreen()));
              },
              child: SvgPicture.asset(svgScan, semanticsLabel: 'Scan Qr')),
          const SizedBox(width: 10)
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [color1, color2],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                  child: Card(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: QrImageView(
                    data: widget.userId,
                    size: 250,
                    padding: const EdgeInsets.all(10),
                    backgroundColor: Colors.white,
                  ),
                ),
              )),
            ],
          ),
        ),
      ),
    );
  }
}
