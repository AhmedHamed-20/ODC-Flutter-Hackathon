import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie/data_layer/bloc/general_cubit/general_cubit_states.dart';
import 'package:la_vie/presentation_layer/constants/constants.dart';
import 'package:la_vie/presentation_layer/constants/controllers.dart';

import '../data_layer/bloc/general_cubit/general_cubit.dart';
import '../presentation_layer/components/components.dart';

class MobileLayout extends StatelessWidget {
  const MobileLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GeneralCubit, GeneralCubitStates>(
      builder: (context, state) {
        var generalCubit = GeneralCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            backgroundColor: AppColors.transparentColor,
            elevation: AppElevation.eL0,
            title: Image.asset('assets/images/logo.png'),
            centerTitle: true,
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: generalCubit.currentBottomNavIndex,
            onTap: generalCubit.changeBottomNavIndex,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'home',
              ),
            ],
          ),
          body: generalCubit.screens[generalCubit.currentBottomNavIndex],
        );
      },
      listener: (context, state) {},
    );
  }
}
