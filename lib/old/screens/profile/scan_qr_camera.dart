import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:smooth_sheets/smooth_sheets.dart';
import 'package:storyv2/old/screens/profile/send_coin_text_field_screen.dart';

import '../../helper/custom_loader.dart';
import '../../helper/overlay_notification.dart';

class QrViewCameraScreen extends StatefulWidget {
  const QrViewCameraScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _QrViewCameraScreenState();
}

class _QrViewCameraScreenState extends State<QrViewCameraScreen> {
  Barcode? result;
  bool isLoading = false;
  bool isNavigating = false;
  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller?.pauseCamera();
    }
    controller?.resumeCamera();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(flex: 4, child: _buildQrView(context)),
            // Expanded(
            //     flex: 1,
            //     child: ElevatedButton(
            //       onPressed: () {
            //         Navigator.push(
            //           context,
            //           ModalSheetRoute(
            //             builder: (context) => SendCoinScreen(userId: result.toString()),
            //           ),
            //         );
            //       },
            //       child: const Text("Text me"),
            //     )),
          ],
        ),
      ),
    );
  }

  Widget _buildQrView(BuildContext context) {
    var scanArea = (MediaQuery.of(context).size.width < 400 ||
            MediaQuery.of(context).size.height < 400)
        ? 150.0
        : 300.0;
    return QRView(
      key: qrKey,
      onQRViewCreated: _onQRViewCreated,
      overlay: QrScannerOverlayShape(
          borderColor: Colors.red,
          borderRadius: 10,
          borderLength: 30,
          borderWidth: 10,
          cutOutSize: scanArea),
      onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
    );
  }

  // void _onQRViewCreated(QRViewController controller) {
  //   print("helo qr is happeno::");
  //   setState(() {
  //     this.controller = controller;
  //   });
  //   controller.scannedDataStream.listen((scanData) {
  //     result = scanData;
  //     print("RESUTL SCAN DATA::${result?.code}");
  //
  //     if (result != null) {
  //       Navigator.push(
  //         context,
  //         ModalSheetRoute(
  //           builder: (context) => SendCoinScreen(userId: result!.code.toString(),),
  //         ),
  //       );
  //     }
  //   });
  // }

  void _onQRViewCreated(QRViewController controller) {
    print("helo qr is happeno::");
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) {
      if (!isNavigating) {
        setState(() {
          isNavigating = true;
        });
        result = scanData;
        print("RESULT SCAN DATA:: ${result?.code}");

        if (result != null) {
          Navigator.push(
            context,
            ModalSheetRoute(
              builder: (context) =>
                  SendCoinScreen(userId: result!.code.toString()),
            ),
          ).then((_) {
            isNavigating = false;
          });
        }
      }
    });
  }

  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    // log('${DateTime.now().toIso8601String()}_onPermissionSet $p');
    if (!p) {
      showTopOverlayNotification(
          title: "Permission is Required. Please try again.",
          icon: Icons.error,
          color: Colors.red);
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
