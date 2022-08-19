import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie/view_model/general_cubit/general_cubit.dart';
import 'package:la_vie/view_model/general_cubit/general_cubit_states.dart';

import '../../components/cart_blogs_design.dart';
import '../../constants/constants.dart';
import 'blog_detailes.dart';

class BlogScreenMobile extends StatelessWidget {
  const BlogScreenMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GeneralCubit, GeneralCubitStates>(
      builder: (context, state) {
        var generalCubit = GeneralCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: AppColors.transparentColor,
            elevation: 0,
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                color: AppColors.iconColorGrey,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            title: Text(
              'Blogs',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          body: ListView.builder(
            itemCount: 5,
            itemBuilder: (contex, index) {
              return GestureDetector(
                onTap: () {
                  navigatePushTo(navigateTO: BlogDetailes(), context: context);
                },
                child: Padding(
                  padding: const EdgeInsets.all(AppPadding.p12),
                  child: cartWithBlogsDesign(
                    title: Text(
                      '2 days ago',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            color: Theme.of(context).primaryColor,
                          ),
                    ),
                    subTitle: Text(
                      '5 Tips to treat plants',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    context: contex,
                    photoUrl: 'assets/images/cart_empty.png',
                    moreSubTitle: Column(
                      children: [
                        Text(
                          'leaf, in botany, any usually ',
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
      listener: (context, state) {},
    );
  }
}
