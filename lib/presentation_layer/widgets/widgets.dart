import 'package:flutter/material.dart';

import '../constants/constants.dart';
import '../constants/controllers.dart';
import '../screen/components/components.dart';

Widget loginWidget(BuildContext context) {
  return SingleChildScrollView(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Email',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: AppColors.subtitleTextColor,
              ),
        ),
        SizedBox(
          height: AppPadding.p8,
        ),
        Padding(
          padding: EdgeInsets.only(
            bottom: AppPadding.p30,
          ),
          child: defaultTextFormField(
            width: double.infinity,
            height: AppHeight.h46,
            radius: AppRadius.r5,
            context: context,
            controller: TextFormFieldControllers.emailLoginController,
            keyboardType: TextInputType.emailAddress,
          ),
        ),
        Text(
          'Password',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: AppColors.subtitleTextColor,
              ),
        ),
        SizedBox(
          height: AppPadding.p8,
        ),
        Padding(
          padding: EdgeInsets.only(
            bottom: AppPadding.p30,
          ),
          child: defaultTextFormField(
            width: double.infinity,
            height: AppHeight.h46,
            radius: AppRadius.r5,
            context: context,
            controller: TextFormFieldControllers.passwordLoginController,
            keyboardType: TextInputType.emailAddress,
          ),
        ),
        defaultButton(
          onPressed: () {},
          buttonChild: Text(
            'Login',
            style: Theme.of(context).textTheme.labelMedium,
          ),
          width: double.infinity,
          height: AppHeight.h46,
        ),
      ],
    ),
  );
}
