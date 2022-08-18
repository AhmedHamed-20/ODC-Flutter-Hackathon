import 'dart:math' as math; // import this
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie/view/components/nav_bar_web.dart';
import 'package:la_vie/view_model/login_cubit/login_cubit.dart';
import 'package:la_vie/view_model/login_cubit/login_states.dart';

import '../components/defaults.dart';
import '../constants/constants.dart';

import '../screen/web_screens/login_screen_web.dart';

class LayoutScreenWeb extends StatelessWidget {
  const LayoutScreenWeb({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginCubitStates>(
      builder: (context, state) {
        return Scaffold(
          body: Stack(
            children: [
              Positioned(
                left: 0,
                top: 70,
                child: Image.asset('assets/images/web_tree.png'),
              ),
              Positioned(
                right: 0,
                bottom: 0,
                child: Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.rotationY(math.pi),
                  child: Image.asset(
                    'assets/images/web_tree.png',
                  ),
                ),
              ),
              Column(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 70,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: AppPadding.p20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            flex: 1,
                            child: Image.asset('assets/images/logo.png'),
                          ),
                          navBarWeb(navBarList),
                          Flexible(
                            flex: 1,
                            child: defaultButton(
                                onPressed: () {},
                                buttonChild: Text(
                                  'Sign Up',
                                  style:
                                      Theme.of(context).textTheme.labelMedium,
                                ),
                                width: AppWidth.w100,
                                height: AppHeight.h46),
                          )
                        ],
                      ),
                    ),
                  ),
                  const Expanded(child: LoginScreenWeb()),
                ],
              ),
            ],
          ),
        );
      },
      listener: (context, state) {},
    );
  }
}
