import 'package:flutter/material.dart';
import 'package:la_vie/view/constants/constants.dart';

class BlogDetailes extends StatelessWidget {
  const BlogDetailes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.4,
            child: Image.asset('assets/images/cart_empty.png'),
          ),
          const SizedBox(
            height: AppHeight.h8,
          ),
          Padding(
            padding: const EdgeInsets.all(AppPadding.p12),
            child: Text(
              'title',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(fontSize: AppFontSize.s20),
            ),
          ),
          const SizedBox(
            height: AppHeight.h8,
          ),
          Padding(
            padding: const EdgeInsets.all(AppPadding.p16),
            child: Text(
              'leaf, in botany, any usually flattened green outgrowth from the stem of  ',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontSize: AppFontSize.s18,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
