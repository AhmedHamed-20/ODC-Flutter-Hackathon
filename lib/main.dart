import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie/data_layer/bloc/login_cubit/login_cubit.dart';
import 'package:la_vie/data_layer/bloc/login_cubit/login_states.dart';
import 'package:la_vie/presentation_layer/screen/login_screen.dart';
import 'package:la_vie/presentation_layer/theme/app_theme.dart';

void main() {
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
      ],
      child: BlocConsumer<LoginCubit, LoginCubitStates>(
        builder: (context, state) {
          return MaterialApp(
            theme: lightMode,
            home: const LoginScreen(),
          );
        },
        listener: (context, state) {},
      ),
    );
  }
}
