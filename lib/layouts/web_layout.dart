import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie/data_layer/bloc/login_cubit/login_cubit.dart';
import 'package:la_vie/data_layer/bloc/login_cubit/login_states.dart';
import 'package:la_vie/presentation_layer/components/components.dart';
import 'package:la_vie/presentation_layer/constants/constants.dart';

import '../presentation_layer/screen/web_screens/login_screen_web.dart';
import '../presentation_layer/widgets/nav_bar_web.dart';

class LayoutScreenWeb extends StatelessWidget {
  const LayoutScreenWeb({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginCubitStates>(
      builder: (context, state) {
        return Scaffold(
          body: Column(
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
                          flex: 2,
                          child: Image.asset('assets/images/logo.png')),
                      navBarWeb(navBarList),
                      Flexible(
                        flex: 1,
                        child: defaultButton(
                            onPressed: () {},
                            buttonChild: Text(
                              'Sign Up',
                              style: Theme.of(context).textTheme.labelMedium,
                            ),
                            width: AppWidth.w100,
                            height: AppHeight.h46),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(child: LoginScreenWeb()),
            ],
          ),
        );
      },
      listener: (context, state) {},
    );
  }
}
