import 'package:flutter/material.dart';

import '../../constants/constants.dart';
import '../../components/model_bottom_sheet_scan_screen.dart';

class ScanScreen extends StatelessWidget {
  const ScanScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  Container(
                    color: Colors.green,
                  ),
                  GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                          isScrollControlled: true,
                          context: context,
                          builder: (context) {
                            return modelBottomSheetScan(context: context);
                          });
                    },
                    child: Align(
                      alignment: AlignmentDirectional.bottomCenter,
                      child: Card(
                        color: Colors.grey.withOpacity(0.6),
                        elevation: AppElevation.eL4,
                        child: ListTile(
                          title: Text(
                            'Ahmed Hamed',
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          subtitle: Text(
                            'subtitle',
                            style: Theme.of(context).textTheme.subtitle1,
                          ),
                          trailing: CircleAvatar(
                            backgroundColor: Theme.of(context).primaryColor,
                            radius: AppRadius.r22,
                            child: Icon(
                              Icons.arrow_forward,
                              color: AppColors.iconColorWhite,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
