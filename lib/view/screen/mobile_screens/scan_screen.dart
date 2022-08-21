import 'dart:io';

import 'package:flutter/material.dart';
import 'package:la_vie/view_model/general_cubit/general_cubit.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import '../../../model/qr_code_scan/qr_code_model.dart';
import '../../constants/constants.dart';
import '../../components/model_bottom_sheet_scan_screen.dart';

class ScanScreen extends StatefulWidget {
  const ScanScreen({Key? key}) : super(key: key);

  @override
  State<ScanScreen> createState() => _ScanScreenState();
}

class _ScanScreenState extends State<ScanScreen> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      QrCodeHelper.qrcontroller!.pauseCamera();
    } else if (Platform.isIOS) {
      QrCodeHelper.qrcontroller!.resumeCamera();
    }
  }

  @override
  Widget build(BuildContext context) {
    var generalCubit = GeneralCubit.get(context);
    return WillPopScope(
      onWillPop: () async {
        generalCubit.changeBottomNavIndex(0);
        Navigator.of(context).pop();
        return false;
      },
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                flex: 5,
                child: QRView(
                  key: qrKey,
                  onQRViewCreated: generalCubit.onQRViewCreated,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
