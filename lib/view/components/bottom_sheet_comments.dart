import 'package:flutter/material.dart';

import '../constants/constants.dart';

Widget bottomSheetCommentsLikes(
    {required BuildContext context,
    required String title,
    required String imageUrl}) {
  return Container(
    width: MediaQuery.of(context).size.width,
    decoration: BoxDecoration(
      color: Theme.of(context).backgroundColor,
    ),
    child: Padding(
      padding: const EdgeInsets.all(AppPadding.p8),
      child: ListTile(
        title: Text(title),
        leading: CircleAvatar(
          radius: AppRadius.r22,
          backgroundImage: NetworkImage(
            imageUrl,
          ),
        ),
      ),
    ),
  );
}
