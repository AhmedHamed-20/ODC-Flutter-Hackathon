import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie/model/data_models/cart_model/cart_model.dart';
import 'package:la_vie/view/components/cart_blogs_design.dart';
import 'package:la_vie/view_model/general_cubit/general_cubit.dart';
import 'package:la_vie/view_model/general_cubit/general_cubit_states.dart';

import '../../components/defaults.dart';
import '../../constants/constants.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GeneralCubit, GeneralCubitStates>(
      builder: (context, state) {
        var generalCubit = GeneralCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'My Card',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            centerTitle: true,
            elevation: 0,
            backgroundColor: AppColors.transparentColor,
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                color: AppColors.iconColorGrey,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
          body: CardModel.cartData.elementAt(0) == 0
              ? Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.2,
                    ),
                    Image.asset('assets/images/card_empty.png'),
                    const SizedBox(
                      height: AppHeight.h8,
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.symmetric(horizontal: AppPadding.p8),
                      child: Text(
                        'Your cart is empty',
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              fontSize: AppFontSize.s20,
                            ),
                      ),
                    ),
                    const SizedBox(
                      height: AppHeight.h4,
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.symmetric(horizontal: AppPadding.p8),
                      child: Text(
                        'Sorry, the keyword you entered cannot be found, please check again or search with another keyword.',
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(fontSize: AppFontSize.s18),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      flex: 6,
                      child: ListView.builder(
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(AppPadding.p12),
                            child: Padding(
                                padding: const EdgeInsets.all(AppPadding.p12),
                                child: cartWithBlogsDesign(
                                  context: context,
                                  photoUrl: CardModel.getPhotoUrl(index),
                                  title: Text(
                                    CardModel.getName(index),
                                    style:
                                        Theme.of(context).textTheme.titleLarge,
                                  ),
                                  subTitle: Text(
                                    CardModel.getPrice(index).toString(),
                                    style: Theme.of(context)
                                        .textTheme
                                        .subtitle1
                                        ?.copyWith(
                                            color:
                                                Theme.of(context).primaryColor),
                                  ),
                                  moreSubTitle: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          color:
                                              AppColors.textFormFieldFillColor,
                                          borderRadius: BorderRadius.circular(
                                              AppRadius.r10),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(
                                              AppPadding.p8),
                                          child: Row(
                                            children: [
                                              InkWell(
                                                onTap: () {},
                                                child: Icon(
                                                  Icons.remove,
                                                  color: Theme.of(context)
                                                      .primaryColor,
                                                ),
                                              ),
                                              const SizedBox(
                                                width: AppWidth.w2,
                                              ),
                                              Text(
                                                CardModel.getAmount(index)
                                                    .toString(),
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .titleMedium,
                                              ),
                                              const SizedBox(
                                                width: AppWidth.w2,
                                              ),
                                              InkWell(
                                                onTap: () {},
                                                child: Icon(
                                                  Icons.add,
                                                  color: Theme.of(context)
                                                      .primaryColor,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {},
                                        child: Icon(
                                          Icons.delete,
                                          color: Theme.of(context).primaryColor,
                                        ),
                                      )
                                    ],
                                  ),
                                )),
                          );
                        },
                        itemCount: CardModel.cartData.length,
                      ),
                    ),
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.all(AppPadding.p12),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Total',
                                  style: Theme.of(context).textTheme.titleLarge,
                                ),
                                Text(
                                  '${generalCubit.totoalCardPrice} EGP',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleLarge
                                      ?.copyWith(
                                        color: Theme.of(context).primaryColor,
                                      ),
                                ),
                              ],
                            ),
                            defaultButton(
                              onPressed: () {},
                              buttonChild: Text(
                                'Checkout',
                                style: Theme.of(context).textTheme.labelMedium,
                              ),
                              width: double.infinity,
                              height: AppHeight.h46,
                            ),
                          ],
                        ),
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
