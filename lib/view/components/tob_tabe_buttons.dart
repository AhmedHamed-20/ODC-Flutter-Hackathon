import 'package:flutter/material.dart';
import 'package:la_vie/view/constants/constants.dart';

Widget tobTabButtons({
  required List tabs,
  required int currentIndexColor,
  required int currentWidgetIndex,
  required BuildContext context,
}) {
  return Padding(
    padding: const EdgeInsets.all(AppPadding.p8),
    child: Container(
      width: AppWidth.w60,
      height: AppHeight.h70,
      decoration: BoxDecoration(
        color: currentIndexColor == tabs.indexOf(tabs[currentWidgetIndex])
            ? AppColors.buttonColor
            : AppColors.scaffoldBackgroundColor,
        border: Border.all(
          color: currentIndexColor == currentWidgetIndex
              ? AppColors.buttonColor
              : AppColors.textFieldBorderColorGrey,
        ),
      ),
      child: Center(
        child: Text(
          tabs[currentWidgetIndex],
          style: currentIndexColor == tabs.indexOf(tabs[currentWidgetIndex])
              ? Theme.of(context).textTheme.labelMedium
              : Theme.of(context).textTheme.titleMedium,
        ),
      ),
    ),
  );
}
