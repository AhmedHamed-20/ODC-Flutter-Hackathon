import 'package:flutter/material.dart';
import 'package:la_vie/view_model/login_cubit/login_states.dart';

import 'defaults.dart';
import '../constants/constants.dart';
import '../constants/controllers.dart';

Widget signUpWidget({
  LoginCubitStates? states,
  required BuildContext context,
  required onTabOnSignUp,
  required Widget sufixIcon,
  required bool obScureText,
}) {
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
        const SizedBox(
          height: AppPadding.p8,
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: AppPadding.p30),
          child: defaultTextFormField(
            width: double.infinity,
            height: AppHeight.h46,
            radius: AppRadius.r5,
            context: context,
            controller: TextFormFieldControllers.firstNameSignUpController,
            keyboardType: TextInputType.text,
          ),
        ),
        const SizedBox(
          height: AppPadding.p8,
        ),
        Text(
          'Last Name',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: AppColors.subtitleTextColor,
              ),
        ),
        const SizedBox(
          height: AppPadding.p8,
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: AppPadding.p30),
          child: defaultTextFormField(
            width: double.infinity,
            height: AppHeight.h46,
            radius: AppRadius.r5,
            context: context,
            controller: TextFormFieldControllers.lastNameSignUpController,
            keyboardType: TextInputType.text,
          ),
        ),
        Text(
          'Email',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: AppColors.subtitleTextColor,
              ),
        ),
        const SizedBox(
          height: AppPadding.p8,
        ),
        Padding(
          padding: const EdgeInsets.only(
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
        const SizedBox(
          height: AppPadding.p8,
        ),
        Padding(
          padding: const EdgeInsets.only(
            bottom: AppPadding.p30,
          ),
          child: defaultTextFormField(
            obscureText: obScureText,
            suffixIcon: sufixIcon,
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
        const SizedBox(
          height: AppPadding.p8,
        ),
        Padding(
          padding: const EdgeInsets.only(
            bottom: AppPadding.p30,
          ),
          child: defaultTextFormField(
            obscureText: obScureText,
            suffixIcon: sufixIcon,
            width: double.infinity,
            height: AppHeight.h46,
            radius: AppRadius.r5,
            context: context,
            controller:
                TextFormFieldControllers.passwordConfirmSignUpController,
          ),
        ),
        states is SignUpLoadingData
            ? Center(
                child: CircularProgressIndicator(
                  color: Theme.of(context).primaryColor,
                ),
              )
            : defaultButton(
                onPressed: onTabOnSignUp,
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
