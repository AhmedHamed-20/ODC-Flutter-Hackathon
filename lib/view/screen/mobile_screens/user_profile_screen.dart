import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie/model/data_models/get_my_data_model/get_my_data_model.dart';
import 'package:la_vie/view/components/alert_dialog.dart';
import 'package:la_vie/view/constants/controllers.dart';
import 'package:la_vie/view_model/general_cubit/general_cubit.dart';
import 'package:la_vie/view_model/general_cubit/general_cubit_states.dart';
import 'package:la_vie/view_model/user_profile_cubit/user_profile_cubit.dart';
import 'package:la_vie/view_model/user_profile_cubit/user_profile_cubit_states.dart';

import '../../components/change_information_widget.dart';
import '../../constants/constants.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserProfileCubit, UserProfileStates>(
      builder: (context, state) {
        var userPofileCubit = UserProfileCubit.get(context);
        return Scaffold(
          body: SafeArea(
            child: Column(
              children: [
                Expanded(
                  child: Stack(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.4,
                        child: Stack(
                          children: [
                            Image.network(
                              GetMyDataModel.imageUrl ??
                                  'https://us.123rf.com/450wm/mathier/mathier1905/mathier190500002/134557216-no-thumbnail-image-placeholder-for-forums-blogs-and-websites.jpg?ver=6',
                              width: MediaQuery.of(context).size.width,
                              fit: BoxFit.cover,
                            ),
                            Container(
                              color: Colors.black.withOpacity(0.8),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IconButton(
                                  icon: Icon(
                                    Icons.arrow_back_ios,
                                    color: AppColors.iconColorWhite,
                                  ),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                                IconButton(
                                  icon: Icon(
                                    Icons.logout_outlined,
                                    color: AppColors.iconColorWhite,
                                  ),
                                  onPressed: () {
                                    showDialog(
                                      context: context,
                                      builder: (context) {
                                        return alertDialog(
                                          title: 'Are you sure ?',
                                          context: context,
                                          subTitle: 'you want to logout',
                                          actions: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              TextButton(
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                                child: Text(
                                                  'No',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .titleMedium,
                                                ),
                                              ),
                                              BlocConsumer<GeneralCubit,
                                                  GeneralCubitStates>(
                                                builder: (context, state) {
                                                  var generalCubit =
                                                      GeneralCubit.get(context);
                                                  return TextButton(
                                                    onPressed: () {
                                                      generalCubit
                                                          .logOut(context);
                                                    },
                                                    child: Text(
                                                      'Yes',
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .titleMedium,
                                                    ),
                                                  );
                                                },
                                                listener: (context, state) {},
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                    );
                                  },
                                ),
                              ],
                            ),
                            Align(
                              alignment: AlignmentDirectional.center,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CircleAvatar(
                                    radius: AppRadius.r70,
                                    backgroundImage: NetworkImage(
                                      GetMyDataModel.imageUrl ??
                                          'https://us.123rf.com/450wm/mathier/mathier1905/mathier190500002/134557216-no-thumbnail-image-placeholder-for-forums-blogs-and-websites.jpg?ver=6',
                                    ),
                                  ),
                                  const SizedBox(
                                    height: AppHeight.h8,
                                  ),
                                  Text(
                                    '${GetMyDataModel.firstName} ${GetMyDataModel.lastName}',
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelMedium
                                        ?.copyWith(
                                          fontSize: AppFontSize.s20,
                                          fontWeight: FontWeight.w700,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional.bottomCenter,
                        child: Container(
                          width: double.infinity,
                          height: MediaQuery.of(context).size.height * 0.6,
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(AppRadius.r22),
                              topRight: Radius.circular(AppRadius.r22),
                            ),
                            color: Theme.of(context).backgroundColor,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(AppPadding.p12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: Theme.of(context)
                                        .primaryColor
                                        .withOpacity(0.1),
                                    borderRadius:
                                        BorderRadius.circular(AppRadius.r10),
                                  ),
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.all(AppPadding.p14),
                                    child: Row(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            color:
                                                Theme.of(context).primaryColor,
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                                color: AppColors
                                                    .starsCircleBorder),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(
                                                AppPadding.p6),
                                            child: Center(
                                              child: Image.asset(
                                                'assets/images/stars.png',
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: AppWidth.w8,
                                        ),
                                        Text(
                                          GetMyDataModel.userPoints == null
                                              ? 'You dont\'t have any points'
                                              : 'You have ${GetMyDataModel.userPoints.toString()} points',
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleLarge,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: AppHeight.h20,
                                ),
                                Text(
                                  'Edit Your Profile',
                                  style: Theme.of(context).textTheme.titleLarge,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(AppPadding.p12),
                                  child: changeInformation(
                                      onPressedOnConfirm: () {
                                        if (TextFormFieldControllers
                                                .changeNameController.text
                                                .contains(',') ==
                                            false) {
                                          flutterToast(
                                            msg:
                                                'please enter first name and last name separted by comma and with no spaces',
                                            backgroundColor:
                                                AppColors.toastError,
                                            textColor: AppColors.white,
                                          );
                                        } else {
                                          userPofileCubit.updateMyData(
                                            isEmail: false,
                                            context: context,
                                            accessToken: accessToken,
                                            firstName: TextFormFieldControllers
                                                .changeNameController.text
                                                .trim()
                                                .substring(
                                                    0,
                                                    TextFormFieldControllers
                                                        .changeNameController
                                                        .text
                                                        .indexOf(',')),
                                            lastName: TextFormFieldControllers
                                                .changeNameController.text
                                                .trim()
                                                .substring(
                                                    TextFormFieldControllers
                                                            .changeNameController
                                                            .text
                                                            .indexOf(',') +
                                                        1,
                                                    TextFormFieldControllers
                                                        .changeNameController
                                                        .text
                                                        .length),
                                          );
                                        }
                                      },
                                      context: context,
                                      controller: TextFormFieldControllers
                                          .changeNameController,
                                      title: 'Change Name',
                                      bottomSheetTitle: 'Enter your name'),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.all(AppElevation.eL12),
                                  child: changeInformation(
                                      onPressedOnConfirm: () {
                                        userPofileCubit.updateMyData(
                                          context: context,
                                          accessToken: accessToken,
                                          email: TextFormFieldControllers
                                              .changeEmailController.text,
                                        );
                                      },
                                      bottomSheetTitle: 'Enter Your Email',
                                      context: context,
                                      controller: TextFormFieldControllers
                                          .changeEmailController,
                                      title: 'Change Email'),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
      listener: (context, state) {},
    );
  }
}
