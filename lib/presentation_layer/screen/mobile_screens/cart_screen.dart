import 'package:flutter/material.dart';

import '../../constants/constants.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Cart',
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
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(AppPadding.p12),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  AppRadius.r16,
                ),
              ),
              elevation: AppElevation.eL4,
              child: Padding(
                padding: const EdgeInsets.all(AppPadding.p12),
                child: Row(
                  children: [
                    Flexible(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(AppRadius.r5),
                        ),
                        child: Image.asset(
                          'assets/images/cart_empty.png',
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: AppWidth.w8,
                    ),
                    Flexible(
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Title',
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          Text(
                            '200 EGP',
                            style: Theme.of(context)
                                .textTheme
                                .subtitle1
                                ?.copyWith(
                                    color: Theme.of(context).primaryColor),
                          ),
                          const SizedBox(
                            height: AppHeight.h8,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: AppColors.textFormFieldFillColor,
                                  borderRadius:
                                      BorderRadius.circular(AppRadius.r10),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(AppPadding.p8),
                                  child: Row(
                                    children: [
                                      InkWell(
                                        onTap: () {},
                                        child: Icon(
                                          Icons.remove,
                                          color: Theme.of(context).primaryColor,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: AppWidth.w2,
                                      ),
                                      Text(
                                        ' 1 ',
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
                                          color: Theme.of(context).primaryColor,
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
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
        itemCount: 5,
      ),
    );
  }
}
