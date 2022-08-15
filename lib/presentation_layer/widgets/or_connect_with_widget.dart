import 'package:flutter/material.dart';

import '../constants/constants.dart';

Widget connectWith(BuildContext context, VoidCallback onTabOnGoogle,
    VoidCallback onTabOnFacebook) {
  return Column(
    children: [
      Expanded(
        flex: 1,
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Divider(
                    thickness: AppHeight.h1,
                    color: AppColors.dividerColorGrey,
                  ),
                ),
                Text(
                  ' or continue with ',
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall
                      ?.copyWith(color: Theme.of(context).primaryColor),
                ),
                Expanded(
                  child: Divider(
                    thickness: AppHeight.h1,
                    color: AppColors.dividerColorGrey,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: AppHeight.h12,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: onTabOnGoogle,
                  child: Image.asset('assets/images/google.png'),
                ),
                SizedBox(
                  width: AppWidth.w16,
                ),
                GestureDetector(
                  onTap: onTabOnFacebook,
                  child: Image.asset('assets/images/facebook.png'),
                )
              ],
            ),
          ],
        ),
      ),
    ],
  );
}
