import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QrCodeHelper {
  static final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  static Barcode? result;
  static QRViewController? qrcontroller;

  static void onQRViewCreated(QRViewController controller) {
    qrcontroller = controller;
    controller.scannedDataStream.listen((scanData) {
      result = scanData;
      print(result);
    });
  }
}
