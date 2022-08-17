import 'package:flutter/material.dart';
import 'package:la_vie/presentation_layer/components/components.dart';
import 'package:la_vie/presentation_layer/constants/constants.dart';

Widget cardProduct({
  required BuildContext context,
  required String imageUrl,
  required String title,
  required String subTitle,
  required String amount,
  required VoidCallback addToCarCallBack,
  required VoidCallback plusCallBack,
  required VoidCallback minusCallBck,
}) {
  return Card(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(
        AppRadius.r10,
      ),
    ),
    elevation: AppElevation.eL2,
    child: Padding(
      padding: const EdgeInsets.all(AppPadding.p12),
      child: Stack(
        fit: StackFit.expand,
        clipBehavior: Clip.none,
        children: [
          Positioned(
            left: -10,
            top: -90,
            child: Image.asset(
              imageUrl,
            ),
          ),
          Positioned(
            right: 0,
            top: 0,
            child: Row(
              children: [
                GestureDetector(
                  onTap: minusCallBck,
                  child: Container(
                    color: AppColors.textFormFieldFillColor,
                    child: Icon(
                      Icons.remove,
                      color: AppColors.iconColorGrey,
                    ),
                  ),
                ),
                Text(
                  amount,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                GestureDetector(
                  onTap: plusCallBack,
                  child: Container(
                    color: AppColors.textFormFieldFillColor,
                    child: Icon(
                      Icons.add,
                      color: AppColors.iconColorGrey,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: AlignmentDirectional.bottomStart,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Text(
                  subTitle,
                  style: Theme.of(context).textTheme.subtitle1,
                ),
                SizedBox(
                  width: double.infinity,
                  child: MaterialButton(
                    color: Theme.of(context).primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(AppRadius.r5),
                    ),
                    onPressed: addToCarCallBack,
                    child: Text(
                      'Add To Cart',
                      style: Theme.of(context).textTheme.labelMedium,
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
}
