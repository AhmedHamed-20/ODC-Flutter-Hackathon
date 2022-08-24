import 'package:flutter/material.dart';
import 'package:la_vie/view/constants/constants.dart';

Widget alertDialog(
    {required String title,
    required BuildContext context,
    required String subTitle,
    required Widget actions}) {
  return AlertDialog(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(
        AppRadius.r10,
      ),
    ),
    title: Text(
      title,
      style: Theme.of(context).textTheme.titleLarge,
    ),
    content: Text(
      subTitle,
      style: Theme.of(context).textTheme.titleMedium,
    ),
    actions: [
      actions,
    ],
  );
}
