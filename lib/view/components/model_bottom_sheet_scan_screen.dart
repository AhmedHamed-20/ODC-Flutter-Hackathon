import 'package:flutter/material.dart';

import 'defaults.dart';
import '../constants/constants.dart';

Widget modelBottomSheetScan({
  required BuildContext context,
  required String title,
  required String description,
  String? additiontalDescription,
  required int temperature,
  required int waterCapacity,
  required int sunLight,
}) {
  return SizedBox(
    height: MediaQuery.of(context).size.height,
    child: Column(
      children: [
        Flexible(
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
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Card(
                          color: Colors.black.withOpacity(0.6),
                          child: Padding(
                            padding: const EdgeInsets.all(AppPadding.p8),
                            child: Icon(
                              Icons.wb_sunny_outlined,
                              color: AppColors.iconColorGrey,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: AppWidth.w8,
                        ),
                        Text(
                          '$sunLight % \nSun Light',
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Card(
                          color: Colors.black.withOpacity(0.6),
                          child: Padding(
                            padding: const EdgeInsets.all(AppPadding.p8),
                            child: Icon(
                              Icons.water_drop_outlined,
                              color: AppColors.iconColorGrey,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: AppWidth.w8,
                        ),
                        Text(
                          '$waterCapacity % \nWater Capacity',
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Card(
                          color: Colors.black.withOpacity(0.6),
                          child: Padding(
                            padding: const EdgeInsets.all(AppPadding.p8),
                            child: Icon(
                              Icons.device_thermostat,
                              color: AppColors.iconColorGrey,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: AppWidth.w8,
                        ),
                        Text(
                          '$temperature c \nTemperature',
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
                              title,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge
                                  ?.copyWith(fontSize: AppFontSize.s20),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(AppPadding.p6),
                            child: Text(
                              description,
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle1
                                  ?.copyWith(color: AppColors.iconColorGrey),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(AppPadding.p6),
                            child: Text(
                              additiontalDescription ??
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
                      height: double.infinity,
                    ),
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
