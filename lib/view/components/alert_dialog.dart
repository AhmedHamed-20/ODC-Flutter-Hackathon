import 'package:flutter/material.dart';

Widget alertDialog(
    {required String title,
    required BuildContext context,
    required String subTitle,
    required Widget actions}) {
  return AlertDialog(
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
