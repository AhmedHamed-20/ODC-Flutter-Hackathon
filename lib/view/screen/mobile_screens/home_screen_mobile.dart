import 'package:flutter/material.dart';
import 'package:la_vie/view/screen/mobile_screens/search_screen_mobile.dart';
import '../../components/defaults.dart';
import '../../constants/constants.dart';
import '../../constants/controllers.dart';
import '../../components/card_product.dart';
import 'cart_screen.dart';

class HomeScreenMobile extends StatelessWidget {
  const HomeScreenMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Flexible(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(AppPadding.p12),
              child: Row(
                children: [
                  Expanded(
                    flex: 4,
                    child: GestureDetector(
                      onTap: () {
                        navigatePushTo(
                            navigateTO: const SearchScreenMobile(),
                            context: context);
                      },
                      child: mobileHomeSearchBar(
                        enabled: false,
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
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        navigatePushTo(
                            navigateTO: const CartScreen(), context: context);
                      },
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(AppRadius.r5),
                        ),
                        color: Theme.of(context).primaryColor,
                        child: Padding(
                          padding: const EdgeInsets.all(AppPadding.p8),
                          child: Icon(
                            Icons.shopping_cart_outlined,
                            color: AppColors.iconColorWhite,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Flexible(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(
                      left: AppPadding.p8, right: AppPadding.p8),
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.textFormFieldFillColor,
                      borderRadius: BorderRadius.circular(AppRadius.r5),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: Text(
                          'All',
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                      ),
                    ),
                  ),
                );
              },
              itemCount: 5,
              scrollDirection: Axis.horizontal,
            ),
          ),
          Flexible(
            flex: 12,
            child: GridView.builder(
              padding: const EdgeInsets.only(
                top: AppHeight.h80,
              ),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: AppWidth.w10,
                mainAxisSpacing: AppHeight.h80,
              ),
              itemBuilder: (context, index) {
                return cardProduct(
                  context: context,
                  addToCarCallBack: () {},
                  amount: '1',
                  imageUrl: 'assets/images/tree_home.png',
                  minusCallBck: () {},
                  plusCallBack: () {},
                  subTitle: 'subTitle',
                  title: 'Title',
                );
              },
              itemCount: 3,
            ),
          ),
        ],
      ),
    );
  }
}
