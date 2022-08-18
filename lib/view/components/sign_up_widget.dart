import 'package:flutter/material.dart';

import 'defaults.dart';
import '../constants/constants.dart';
import '../constants/controllers.dart';

Widget signUpWidget(BuildContext context) {
  return SingleChildScrollView(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Name',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: AppColors.subtitleTextColor,
              ),
        ),
        SizedBox(
          height: AppPadding.p8,
        ),
        Padding(
          padding: EdgeInsets.only(bottom: AppPadding.p30),
          child: defaultTextFormField(
            width: double.infinity,
            height: AppHeight.h46,
            radius: AppRadius.r5,
            context: context,
            controller:
                TextFormFieldControllers.firstNameConfirmSignUpController,
            keyboardType: TextInputType.text,
          ),
        ),
        SizedBox(
          height: AppPadding.p8,
        ),
        Text(
          'Last Name',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: AppColors.subtitleTextColor,
              ),
        ),
        SizedBox(
          height: AppPadding.p8,
        ),
        Padding(
          padding: EdgeInsets.only(bottom: AppPadding.p30),
          child: defaultTextFormField(
            width: double.infinity,
            height: AppHeight.h46,
            radius: AppRadius.r5,
            context: context,
            controller:
                TextFormFieldControllers.lastNameConfirmSignUpController,
            keyboardType: TextInputType.text,
          ),
        ),
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
            controller: TextFormFieldControllers.emailSignUpController,
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
            controller: TextFormFieldControllers.passwordSignUpController,
          ),
        ),
        Text(
          'Confirm Password',
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
            controller:
                TextFormFieldControllers.passwordConfirmSignUpController,
          ),
        ),
        defaultButton(
          onPressed: () {},
          buttonChild: Text(
            'Sign Up',
            style: Theme.of(context).textTheme.labelMedium,
          ),
          width: double.infinity,
          height: AppHeight.h46,
        ),
      ],
    ),
  );
}
