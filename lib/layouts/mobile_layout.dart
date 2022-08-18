import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';
import 'package:la_vie/data_layer/bloc/general_cubit/general_cubit_states.dart';
import 'package:la_vie/presentation_layer/constants/constants.dart';
import '../data_layer/bloc/general_cubit/general_cubit.dart';
import '../presentation_layer/screen/mobile_screens/community_screen_mobile.dart';
import '../presentation_layer/screen/mobile_screens/scan_screen.dart';
import '../presentation_layer/screen/mobile_screens/user_profile_screen.dart';

class MobileLayout extends StatelessWidget {
  const MobileLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GeneralCubit, GeneralCubitStates>(
      builder: (context, state) {
        var generalCubit = GeneralCubit.get(context);
        return Scaffold(
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: FloatingActionButton(
            backgroundColor: Theme.of(context).primaryColor,
            clipBehavior: Clip.antiAlias,
            onPressed: () {
              navigatePushTo(
                  navigateTO: const CommunityScreenMobile(), context: context);
            },
            child: const Icon(
              IconlyBroken.home,
            ),
          ),
          appBar: AppBar(
            backgroundColor: AppColors.transparentColor,
            elevation: AppElevation.eL0,
            title: appBarWidgets(context, generalCubit.currentBottomNavIndex),
            centerTitle: true,
          ),
          bottomNavigationBar: BottomAppBar(
            shape: const CircularNotchedRectangle(),
            elevation: AppElevation.eL4,
            notchMargin: AppPadding.p8,
            clipBehavior: Clip.antiAlias,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.max,
              children: [
                IconButton(
                  onPressed: () {
                    generalCubit.changeBottomNavIndex(0);
                  },
                  icon: const Icon(
                    IconlyBroken.home,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    navigatePushTo(
                        navigateTO: const ScanScreen(), context: context);
                    generalCubit.currentBottomNavIndex = 1;
                    //  generalCubit.changeBottomNavIndex(1);
                  },
                  icon: const Icon(
                    IconlyBroken.scan,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    generalCubit.changeBottomNavIndex(2);
                  },
                  icon: const Icon(
                    IconlyBroken.notification,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    navigatePushTo(
                        navigateTO: const UserProfileScreen(),
                        context: context);
                    generalCubit.currentBottomNavIndex = 3;
                  },
                  icon: const Icon(
                    IconlyBroken.profile,
                  ),
                ),
              ],
            ),
          ),
          body: generalCubit.screens[generalCubit.currentBottomNavIndex],
        );
      },
      listener: (context, state) {},
    );
  }
}
