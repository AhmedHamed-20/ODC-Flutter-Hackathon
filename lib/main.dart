import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie/model/cache/shared_preferences.dart';
import 'package:la_vie/model/network/dio/dio.dart';
import 'package:la_vie/view/constants/constants.dart';
import 'package:la_vie/view/screen/mobile_screens/login_screen.dart';

import 'package:la_vie/view/theme/app_theme.dart';

import 'view/layout/mobile_layout.dart';
import 'view/layout/web_layout.dart';
import 'view_model/general_cubit/general_cubit.dart';
import 'view_model/login_cubit/login_cubit.dart';
import 'view_model/login_cubit/login_states.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await DioHelper.init();
  await CacheHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: ((context) => LoginCubit()),
        ),
        BlocProvider(
          create: ((context) => GeneralCubit()..getMyData(accessToken)),
        ),
      ],
      child: BlocConsumer<LoginCubit, LoginCubitStates>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: lightMode,
            home: LayoutBuilder(
              builder: ((context, constraints) {
                if (constraints.minWidth <= 824 ||
                    constraints.minHeight <= 412) {
                  return accessToken == '' ? LoginScreen() : MobileLayout();
                }
                return const LayoutScreenWeb();
              }),
            ),
          );
        },
        listener: (context, state) {},
      ),
    );
  }
}
