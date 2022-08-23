import 'package:flutter/material.dart';

import '../constants/constants.dart';
import 'defaults.dart';

Widget changeInformation(
    {required BuildContext context,
    required TextEditingController controller,
    required String title,
    required String bottomSheetTitle,
    required VoidCallback onPressedOnConfirm}) {
  return GestureDetector(
    onTap: () {
      showModalBottomSheet(
          enableDrag: true,
          isScrollControlled: true,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(
                AppRadius.r22,
              ),
              topRight: Radius.circular(
                AppRadius.r22,
              ),
            ),
          ),
          backgroundColor: Theme.of(context).backgroundColor,
          context: context,
          builder: (context) {
            return SizedBox(
              height: MediaQuery.of(context).size.height * 0.6,
              child: Padding(
                padding: const EdgeInsets.all(AppPadding.p14),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      bottomSheetTitle,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(
                      height: AppHeight.h18,
                    ),
                    Text(
                      'separate between last name and first name by comma ,',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(
                      height: AppHeight.h18,
                    ),
                    defaultTextFormField(
                      width: double.infinity,
                      height: AppHeight.h46,
                      radius: AppRadius.r10,
                      context: context,
                      controller: controller,
                    ),
                    const SizedBox(
                      height: AppHeight.h18,
                    ),
                    defaultButton(
                      onPressed: onPressedOnConfirm,
                      buttonChild: Text(
                        'Confirm',
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                      width: double.infinity,
                      height: AppHeight.h46,
                    )
                  ],
                ),
              ),
            );
          });
    },
    child: Card(
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: AppColors.changeNameGreenColor,
          child: Icon(
            Icons.sync_alt,
            color: AppColors.iconColorWhite,
          ),
        ),
        title: Text(
          title,
          style: Theme.of(context).textTheme.labelLarge,
        ),
        trailing: Icon(
          Icons.arrow_forward,
          color: AppColors.iconColorGrey,
        ),
      ),
    ),
  );
}
