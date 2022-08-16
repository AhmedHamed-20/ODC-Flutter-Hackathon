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
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: onTabOnGoogle,
                  child: Card(
                    elevation: AppElevation.eL2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(AppRadius.r5),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(AppPadding.p12),
                      child: Row(
                        children: [
                          Image.asset('assets/images/google.png'),
                          SizedBox(
                            width: AppWidth.w8,
                          ),
                          Text(
                            'Continue with Google',
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall
                                ?.copyWith(
                                  fontSize: AppFontSize.s18,
                                  color: AppColors.iconColorGrey,
                                ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: onTabOnFacebook,
                  child: Card(
                    elevation: AppElevation.eL2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(AppRadius.r5),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(AppPadding.p12),
                      child: Row(
                        children: [
                          Image.asset('assets/images/facebook.png'),
                          SizedBox(
                            width: AppWidth.w8,
                          ),
                          Text(
                            'Continue with Facebook',
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall
                                ?.copyWith(
                                  fontSize: AppFontSize.s18,
                                  color: AppColors.iconColorGrey,
                                ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    ],
  );
}
