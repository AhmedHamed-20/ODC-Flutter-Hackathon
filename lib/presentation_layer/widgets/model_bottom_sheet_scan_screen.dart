import 'package:flutter/material.dart';
import 'package:la_vie/presentation_layer/components/components.dart';

import 'package:la_vie/presentation_layer/constants/constants.dart';

Widget modelBottomSheetScan({required BuildContext context}) {
  return SizedBox(
    height: MediaQuery.of(context).size.height,
    child: Column(
      children: [
        GestureDetector(
          child: Flexible(
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Container(
                height: MediaQuery.of(context).size.height * 0.5,
                color: Colors.transparent,
                child: Padding(
                  padding: const EdgeInsets.all(AppPadding.p18),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Card(
                            color: Colors.black.withOpacity(0.6),
                            child: Padding(
                              padding: const EdgeInsets.all(AppPadding.p8),
                              child: Icon(
                                Icons.home,
                                color: AppColors.iconColorGrey,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: AppWidth.w8,
                          ),
                          Text(
                            '25 %',
                            style: Theme.of(context).textTheme.labelMedium,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        Flexible(
          child: Container(
            height: MediaQuery.of(context).size.height * 0.5,
            decoration: BoxDecoration(
              color: Theme.of(context).backgroundColor,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(
                  AppRadius.r22,
                ),
                topRight: Radius.circular(
                  AppRadius.r22,
                ),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(
                AppPadding.p12,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    flex: 7,
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(AppPadding.p6),
                            child: Text(
                              'SNAKE PLANT (SANSEVIERIA)',
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(AppPadding.p6),
                            child: Text(
                              'Native to southern Africa, snake plants are well adapted to conditions similar to those in southern regions of the United States. Because of this, they may be grown outdoors for part of all of the year in USDA zones 8 and warmer',
                              style: Theme.of(context).textTheme.subtitle1,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(AppPadding.p6),
                            child: Text(
                              'Native to southern Africa, snake plants are well adapted to conditions similar to those in southern regions of the United States. Because of this, they may be grown outdoors for part of all of the year in USDA zones 8 and warmer',
                              style: Theme.of(context).textTheme.subtitle1,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: defaultButton(
                        onPressed: () {},
                        buttonChild: Padding(
                          padding: const EdgeInsets.all(AppPadding.p12),
                          child: Text(
                            'Go To Blog',
                            style: Theme.of(context).textTheme.labelMedium,
                          ),
                        ),
                        width: double.infinity,
                        height: double.infinity),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
