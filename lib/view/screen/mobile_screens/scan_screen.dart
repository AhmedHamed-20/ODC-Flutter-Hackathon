import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie/view/constants/constants.dart';
import 'package:la_vie/view_model/general_cubit/general_cubit.dart';
import 'package:la_vie/view_model/general_cubit/general_cubit_states.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class ScanScreen extends StatefulWidget {
  const ScanScreen({Key? key}) : super(key: key);

  @override
  State<ScanScreen> createState() => _ScanScreenState();
}

class _ScanScreenState extends State<ScanScreen> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  // QRViewController? controller;
  // Barcode? result;

  // void reassemble() {
  //   super.reassemble();
  //   if (Platform.isAndroid) {
  //     QrCodeHelper.qrcontroller!.pauseCamera();
  //   } else if (Platform.isIOS) {
  //     QrCodeHelper.qrcontroller!.resumeCamera();
  //   }
  // }
  // @override
  // void dispose() {
  //   controller?.dispose();
  //   super.dispose();
  // }

  // void onQRViewCreated(QRViewController controller) {
  //   this.controller = controller;
  //   controller.scannedDataStream.listen((scanData) {
  //     result = scanData;
  //     setState(() {
  //       print(result?.code);
  //     });
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    var generalCubit = GeneralCubit.get(context);
    return BlocConsumer<GeneralCubit, GeneralCubitStates>(
      builder: (context, state) {
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
                      overlay: QrScannerOverlayShape(
                        cutOutSize: MediaQuery.of(context).size.width * 0.8,
                        borderColor: Theme.of(context).primaryColor,
                        borderLength: AppWidth.w20,
                        borderRadius: AppRadius.r10,
                        borderWidth: AppWidth.w10,
                      ),
                    ),
                  ),
                  Text(
                    generalCubit.result?.code ?? 'wait',
                    style: Theme.of(context).textTheme.titleLarge,
                  )
                ],
              ),
            ),
          ),
        );
      },
      listener: (context, state) {},
    );
  }
}
