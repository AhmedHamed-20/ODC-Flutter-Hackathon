import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie/model/data_models/product_model/all_products_model.dart';
import 'package:la_vie/view/components/top_tabe_buttons.dart';
import 'package:la_vie/view/screen/mobile_screens/search_screen_mobile.dart';
import 'package:la_vie/view_model/general_cubit/general_cubit.dart';
import 'package:la_vie/view_model/general_cubit/general_cubit_states.dart';
import '../../../model/data_models/cart_model/cart_model.dart';
import '../../components/defaults.dart';
import '../../components/model_bottom_sheet_scan_screen.dart';
import '../../constants/constants.dart';
import '../../constants/controllers.dart';
import '../../components/card_product.dart';
import 'card_screen.dart';

class HomeScreenMobile extends StatelessWidget {
  const HomeScreenMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GeneralCubit, GeneralCubitStates>(
      builder: (context, state) {
        var generalCubit = GeneralCubit.get(context);
        return Scaffold(
          body: generalCubit.loadAllProudctsData
              ? Center(
                  child: CircularProgressIndicator(
                      color: Theme.of(context).primaryColor),
                )
              : Column(
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
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelMedium
                                        ?.copyWith(
                                          color: AppColors.titleTextColor,
                                        ),
                                  ),
                                  context: context,
                                  height: AppHeight.h10,
                                  width: double.infinity,
                                  radius: AppRadius.r18,
                                  controller: TextFormFieldControllers
                                      .homeSearchController,
                                ),
                              ),
                            ),
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  navigatePushTo(
                                      navigateTO: const CartScreen(),
                                      context: context);
                                },
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(AppRadius.r5),
                                  ),
                                  color: Theme.of(context).primaryColor,
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.all(AppPadding.p8),
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
                        scrollDirection: Axis.horizontal,
                        itemCount: generalCubit.homeTabs.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              generalCubit.changeHomeTabIndex(index);
                            },
                            child: topTabButtons(
                              tabs: generalCubit.homeTabs,
                              currentIndexColor:
                                  generalCubit.currentHomeTabIndex,
                              currentWidgetIndex: index,
                              context: context,
                            ),
                          );
                        },
                      ),
                    ),
                    Flexible(
                      flex: 12,
                      child: GridView.builder(
                        padding: const EdgeInsets.only(
                          top: AppHeight.h80,
                        ),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: AppWidth.w10,
                          mainAxisSpacing: AppHeight.h80,
                        ),
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              showModalBottomSheet(
                                isScrollControlled: true,
                                context: context,
                                builder: (context) {
                                  return modelBottomSheetScan(
                                    context: context,
                                    title: generalCubit
                                        .getNameOProudctBetweenModels(
                                      generalCubit.currentHomeTabIndex,
                                      index,
                                    ),
                                    sunLight: generalCubit
                                        .getCharacteristicsofProudctBetweenModels(
                                            generalCubit.currentHomeTabIndex,
                                            index)[0],
                                    waterCapacity: generalCubit
                                        .getCharacteristicsofProudctBetweenModels(
                                            generalCubit.currentHomeTabIndex,
                                            index)[1],
                                    temperature: generalCubit
                                        .getCharacteristicsofProudctBetweenModels(
                                            generalCubit.currentHomeTabIndex,
                                            index)[2],
                                    description: generalCubit
                                        .getDecriptionofProudctBetweenModels(
                                            generalCubit.currentBlogTabIndex,
                                            index),
                                  );
                                },
                              );
                            },
                            child: cardProduct(
                              index: index,
                              context: context,
                              addToCartCallBack: () {
                                generalCubit.addToCard({
                                  'proudctId': generalCubit.getIdBetweenModles(
                                      generalCubit.currentHomeTabIndex, index),
                                  'name':
                                      generalCubit.getNameOProudctBetweenModels(
                                          generalCubit.currentHomeTabIndex,
                                          index),
                                  'price': generalCubit
                                      .getPriceofProudctBetweenModels(
                                          generalCubit.currentHomeTabIndex,
                                          index),
                                  'imageUrl': generalCubit
                                      .getPhotoofProudctBetweenModels(
                                          generalCubit.currentHomeTabIndex,
                                          index),
                                  'amount': generalCubit.getAmountBetweenModles(
                                      generalCubit.currentHomeTabIndex, index),
                                });
                              },
                              amount: generalCubit
                                  .getAmountBetweenModles(
                                      generalCubit.currentHomeTabIndex, index)
                                  .toString(),
                              imageUrl:
                                  generalCubit.getPhotoofProudctBetweenModels(
                                      generalCubit.currentHomeTabIndex, index),
                              minusCallBck: () {
                                //true to reduce number
                                generalCubit.changeCartCountNumber(true,
                                    generalCubit.currentHomeTabIndex, index);
                              },
                              plusCallBack: () {
                                // false to incremnet number
                                generalCubit.changeCartCountNumber(false,
                                    generalCubit.currentHomeTabIndex, index);
                              },
                              subTitle:
                                  '${generalCubit.getPriceofProudctBetweenModels(generalCubit.currentHomeTabIndex, index)} EGP',
                              title: generalCubit.getNameOProudctBetweenModels(
                                  generalCubit.currentHomeTabIndex, index),
                            ),
                          );
                        },
                        itemCount: generalCubit.getLengthOfEachmodel(
                            generalCubit.currentHomeTabIndex),
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
