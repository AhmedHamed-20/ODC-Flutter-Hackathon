import 'package:flutter/material.dart';

import '../../components/components.dart';
import '../../constants/constants.dart';
import '../../constants/controllers.dart';
import '../../widgets/card_product.dart';

class HomeScreenMobile extends StatelessWidget {
  const HomeScreenMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
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
                    style: Theme.of(context).textTheme.labelMedium?.copyWith(
                          color: AppColors.titleTextColor,
                        ),
                  ),
                  context: context,
                  height: AppHeight.h10,
                  width: double.infinity,
                  radius: AppRadius.r18,
                  controller: TextFormFieldControllers.homeSearchController,
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
        Expanded(
          child: GridView.builder(
            padding: EdgeInsets.only(
              top: AppHeight.h10,
            ),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: AppWidth.w10,
              mainAxisSpacing: AppHeight.h46,
            ),
            itemBuilder: (context, index) {
              return cardProduct();
            },
            itemCount: 3,
          ),
        ),
      ],
    );
  }
}
