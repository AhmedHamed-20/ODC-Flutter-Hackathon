import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:la_vie/view_model/login_cubit/login_cubit.dart';
import 'package:la_vie/view_model/login_cubit/login_states.dart';

import '../../constants/constants.dart';
import '../../constants/controllers.dart';
import '../../components/login_widget.dart';
import '../../components/or_connect_with_widget.dart';
import '../../components/sign_up_widget.dart';

class LoginScreenWeb extends StatefulWidget {
  const LoginScreenWeb({Key? key}) : super(key: key);

  @override
  State<LoginScreenWeb> createState() => _LoginScreenWebState();
}

class _LoginScreenWebState extends State<LoginScreenWeb>
    with TickerProviderStateMixin {
  @override
  void initState() {
    TabBarController.tabControllerWeb = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginCubitStates>(
      builder: (context, state) {
        var loginCubit = LoginCubit.get(context);
        return Column(
          children: [
            TabBar(
              unselectedLabelStyle: GoogleFonts.roboto(
                fontSize: AppFontSize.s30,
                fontWeight: FontWeight.w600,
              ),
              labelColor: Theme.of(context).primaryColor,
              unselectedLabelColor: AppColors.subtitleTextColor,
              controller: TabBarController.tabControllerWeb,
              labelStyle: GoogleFonts.roboto(
                fontSize: AppFontSize.s30,
                fontWeight: FontWeight.w600,
              ),
              indicatorColor: Theme.of(context).primaryColor,
              indicatorSize: TabBarIndicatorSize.label,
              tabs: const [
                Text(
                  'Sign up',
                ),
                Text(
                  'Login',
                ),
              ],
            ),
            const SizedBox(
              height: AppHeight.h10,
            ),
            Expanded(
              flex: 2,
              child: TabBarView(
                controller: TabBarController.tabControllerWeb,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.2,
                      right: MediaQuery.of(context).size.width * 0.2,
                    ),
                    child: signUpWidget(
                        passwordValidator: (value) =>
                            loginCubit.validatePassword(value),
                        emailValidator: (value) =>
                            loginCubit.validateEmail(value),
                        confirmPasswordValidator: (value) =>
                            loginCubit.validatePassowrdConfirm(
                                value,
                                TextFormFieldControllers
                                    .passwordSignUpController.text),
                        obScureText: loginCubit.passwordSignUpObscureText,
                        sufixIcon: IconButton(
                          onPressed: () {
                            loginCubit.changeObscureValue(inLogin: false);
                          },
                          icon: Icon(
                            loginCubit.passwordSignUpObscureText
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: AppColors.iconColorGrey,
                          ),
                        ),
                        context: context,
                        onTabOnSignUp: () {}),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.2,
                      right: MediaQuery.of(context).size.width * 0.2,
                    ),
                    child: loginWidget(
                      validatorEmail: (value) =>
                          loginCubit.validateEmail(value),
                      validatorPassword: (value) =>
                          loginCubit.validatePassword(value),
                      obScureText: loginCubit.passwordloginObscureText,
                      suffixIcon: IconButton(
                        onPressed: () {
                          loginCubit.changeObscureValue(inLogin: true);
                        },
                        icon: Icon(
                          loginCubit.passwordloginObscureText
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: AppColors.iconColorGrey,
                        ),
                      ),
                      context: context,
                      onPressedOnForgetPassword: () {},
                      onPressedOnLogin: () {},
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.2,
                  right: MediaQuery.of(context).size.width * 0.2,
                ),
                child: connectWith(context, () {}, () {}),
              ),
            )
          ],
        );
      },
      listener: (context, state) {},
    );
  }
}
