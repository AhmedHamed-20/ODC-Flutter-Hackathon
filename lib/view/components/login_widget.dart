import 'package:flutter/material.dart';
import 'package:la_vie/view_model/login_cubit/login_states.dart';

import 'defaults.dart';
import '../constants/constants.dart';
import '../constants/controllers.dart';

Widget loginWidget(
    {required BuildContext context,
    required VoidCallback onPressedOnLogin,
    required VoidCallback onPressedOnForgetPassword,
    required bool obScureText,
    required FormFieldValidator<String>? validatorPassword,
    required FormFieldValidator<String>? validatorEmail,
    LoginCubitStates? state,
    required Widget suffixIcon}) {
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
        const SizedBox(
          height: AppPadding.p8,
        ),
        Padding(
          padding: const EdgeInsets.only(
            bottom: AppPadding.p30,
          ),
          child: Form(
            autovalidateMode: AutovalidateMode.always,
            child: SizedBox(
              height: AppHeight.h70,
              child: defaultTextFormField(
                validator: validatorEmail,
                width: double.infinity,
                height: AppHeight.h46,
                radius: AppRadius.r5,
                context: context,
                controller: TextFormFieldControllers.emailLoginController,
                keyboardType: TextInputType.emailAddress,
              ),
            ),
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
          child: Form(
            autovalidateMode: AutovalidateMode.always,
            child: SizedBox(
              height: AppHeight.h100,
              child: defaultTextFormField(
                validator: validatorPassword,
                obscureText: obScureText,
                suffixIcon: suffixIcon,
                width: double.infinity,
                height: AppHeight.h100,
                radius: AppRadius.r5,
                context: context,
                controller: TextFormFieldControllers.passwordLoginController,
              ),
            ),
          ),
        ),
        state is LoginLoadingData
            ? Center(
                child: CircularProgressIndicator(
                  color: Theme.of(context).primaryColor,
                ),
              )
            : defaultButton(
                onPressed: onPressedOnLogin,
                buttonChild: Text(
                  'Login',
                  style: Theme.of(context).textTheme.labelMedium,
                ),
                width: double.infinity,
                height: AppHeight.h46,
              ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(
              onPressed: onPressedOnForgetPassword,
              child: Text(
                'Forget Password?',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Theme.of(context).primaryColor,
                    ),
              ),
            )
          ],
        )
      ],
    ),
  );
}
