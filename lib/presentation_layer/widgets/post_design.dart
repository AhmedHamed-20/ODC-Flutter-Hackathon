import 'package:flutter/material.dart';
import 'package:la_vie/presentation_layer/constants/constants.dart';

Widget postDesign({
  required BuildContext context,
  required String userPhoto,
  required String userName,
  required String postDate,
  required String postTitle,
  required String postDescription,
  String? postPhotoUrl = '',
  required String postReplies,
  required VoidCallback onTabOnLike,
  required String postLikes,
}) {
  return Card(
    elevation: AppElevation.eL2,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(AppRadius.r5),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(AppPadding.p8),
          child: Row(
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(
                  userPhoto,
                ),
              ),
              const SizedBox(
                width: AppWidth.w8,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    userName,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Text(
                    postDate,
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(
          height: AppHeight.h8,
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: AppPadding.p8,
            right: AppPadding.p8,
          ),
          child: Text(
            postTitle,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: Theme.of(context).primaryColor,
                  fontSize: AppFontSize.s20,
                ),
          ),
        ),
        const SizedBox(
          height: AppHeight.h8,
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: AppPadding.p8,
            right: AppPadding.p8,
          ),
          child: Text(
            postDescription,
            style: Theme.of(context).textTheme.subtitle1,
          ),
        ),
        const SizedBox(
          height: AppHeight.h8,
        ),
        postPhotoUrl == ''
            ? const SizedBox()
            : Center(
                child: Image.network(
                  postPhotoUrl.toString(),
                  width: double.infinity,
                  fit: BoxFit.fill,
                ),
              ),
        const SizedBox(
          height: AppHeight.h8,
        ),
        Row(
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: onTabOnLike,
                  icon: Icon(
                    Icons.thumb_up_alt_outlined,
                    color: AppColors.iconColorGrey,
                  ),
                ),
                Text(
                  postLikes,
                  style: Theme.of(context).textTheme.subtitle1,
                ),
              ],
            ),
            const SizedBox(
              width: AppWidth.w16,
            ),
            Text(
              postReplies,
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ],
        ),
      ],
    ),
  );
}
