import 'package:flutter/material.dart';

import '../../components/defaults.dart';
import '../../constants/constants.dart';
import '../../constants/controllers.dart';

class SearchScreenMobile extends StatelessWidget {
  const SearchScreenMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.transparentColor,
        elevation: AppElevation.eL0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: AppColors.iconColorGrey,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Padding(
          padding: const EdgeInsets.only(top: AppPadding.p8),
          child: mobileHomeSearchBar(
            prefixIcon: Icon(
              Icons.search,
              color: AppColors.iconColorGrey,
            ),
            label: Text(
              'Search',
              style: Theme.of(context).textTheme.labelMedium?.copyWith(
                    color: AppColors.titleTextColor,
                  ),
            ),
            context: context,
            width: double.infinity,
            height: double.infinity,
            radius: AppRadius.r5,
            controller: TextFormFieldControllers.homeSearchController,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            left: AppPadding.p12,
            right: AppPadding.p12,
            top: AppPadding.p12,
          ),
          child: Column(
            children: [
              ListTile(
                leading: Icon(
                  Icons.access_time_rounded,
                  color: AppColors.iconColorGrey,
                ),
                title: Text(
                  'hamed',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                trailing: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.clear,
                    color: AppColors.iconColorGrey,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
