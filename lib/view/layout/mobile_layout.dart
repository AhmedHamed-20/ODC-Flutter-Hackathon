import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';
import 'package:la_vie/model/cache/shared_preferences.dart';
import 'package:la_vie/model/data_models/forum_models/all_formus_model.dart';
import 'package:la_vie/model/data_models/forum_models/forums_me.dart';
import 'package:la_vie/view/screen/mobile_screens/community_screen_mobile.dart';
import 'package:la_vie/view/screen/mobile_screens/exam_screen.dart';
import 'package:la_vie/view_model/forums_cubit/forums_cubit.dart';
import 'package:la_vie/view_model/forums_cubit/forums_state.dart';
import 'package:la_vie/view_model/general_cubit/general_cubit.dart';
import 'package:la_vie/view_model/general_cubit/general_cubit_states.dart';
import '../constants/constants.dart';
import '../screen/mobile_screens/blog_screen_mobile.dart';
import '../screen/mobile_screens/scan_screen.dart';
import '../screen/mobile_screens/user_profile_screen.dart';

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
              var date = DateTime.now().add(const Duration(days: 8));
              print(date);
              generalCubit.changeBottomNavIndex(0);
            },
            child: const Icon(
              IconlyBroken.home,
            ),
          ),
          appBar: AppBar(
            actions: [
              BlocConsumer<ForumsCubit, ForumsCubitStates>(
                builder: (context, state) {
                  var forumsCubit = ForumsCubit.get(context);
                  return IconButton(
                    onPressed: () {
                      // to not get data every time he navigate
                      navigatePushTo(
                          navigateTO: const CommunityScreenMobile(),
                          context: context);
                      forumsCubit.emitForumsState();
                    },
                    icon: Icon(
                      Icons.forum,
                      color: AppColors.iconColorGrey,
                    ),
                  );
                },
                listener: (context, state) {},
              ),
              generalCubit.checkTimeOfExam(timeOfNextExam)
                  ? const SizedBox.shrink()
                  : IconButton(
                      onPressed: () {
                        navigatePushTo(
                            navigateTO: const ExamScreen(), context: context);
                        CacheHelper.setData(
                            key: 'timeOfNextExam',
                            value: DateTime.now()
                                .add(
                                  const Duration(days: 7),
                                )
                                .toString());
                      },
                      icon: Icon(
                        Icons.question_mark,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
            ],
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
                    navigatePushTo(
                      navigateTO: const BlogScreenMobile(),
                      context: context,
                    );
                    generalCubit.emitBlogsIntState();
                    //    generalCubit.currentBottomNavIndex = 4;
                  },
                  icon: Image.asset(
                    'assets/images/fire.png',
                  ),
                ),
                IconButton(
                  onPressed: () {
                    navigatePushTo(
                        navigateTO: const ScanScreen(), context: context);
                    generalCubit.currentBottomNavIndex = 1;
                  },
                  icon: Icon(
                    IconlyBroken.scan,
                    color: AppColors.iconColorBlack,
                    size: AppHeight.h28,
                  ),
                ),
                const SizedBox.shrink(),
                IconButton(
                  onPressed: () {
                    generalCubit.changeBottomNavIndex(2);
                  },
                  icon: Icon(
                    IconlyBroken.notification,
                    color: AppColors.iconColorBlack,
                    size: AppHeight.h28,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    navigatePushTo(
                        navigateTO: const UserProfileScreen(),
                        context: context);
                    generalCubit.currentBottomNavIndex = 3;
                  },
                  icon: Icon(
                    IconlyBroken.profile,
                    color: AppColors.iconColorBlack,
                    size: AppHeight.h28,
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
