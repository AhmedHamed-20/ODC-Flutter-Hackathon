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
        return Scaffold(
          appBar: AppBar(
            backgroundColor: AppColors.transparentColor,
            elevation: AppElevation.eL0,
            title: Image.asset('assets/images/logo.png'),
            centerTitle: true,
          ),
          body: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(AppPadding.p12),
                child: Row(
                  children: [
                    Expanded(
                      flex: 4,
                      child: mobileHomeSearchBar(
                        prefixIcon: Icon(
                          Icons.search,
                          color: AppColors.iconColorGrey,
                        ),
                        label: Text(
                          'Search',
                          style:
                              Theme.of(context).textTheme.labelMedium?.copyWith(
                                    color: AppColors.titleTextColor,
                                  ),
                        ),
                        context: context,
                        height: AppHeight.h10,
                        width: double.infinity,
                        radius: AppRadius.r18,
                        controller:
                            TextFormFieldControllers.homeSearchController,
                      ),
                    ),
                    Expanded(
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(AppRadius.r5),
                        ),
                        color: Theme.of(context).primaryColor,
                        child: Padding(
                          padding: EdgeInsets.all(AppPadding.p8),
                          child: Icon(
                            Icons.shopping_cart_outlined,
                            color: AppColors.iconColorWhite,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
      listener: (context, state) {},
    );
  }
}
