import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie/model/data_models/blogs/blogs_data_model.dart';
import 'package:la_vie/model/network/end_points/end_points.dart';
import 'package:la_vie/view_model/general_cubit/general_cubit.dart';
import 'package:la_vie/view_model/general_cubit/general_cubit_states.dart';
import '../../components/cart_blogs_design.dart';
import '../../components/tob_tabe_buttons.dart';
import '../../constants/constants.dart';
import 'blog_detailes.dart';

class BlogScreenMobile extends StatelessWidget {
  const BlogScreenMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GeneralCubit, GeneralCubitStates>(
      builder: (context, state) {
        var generalCubit = GeneralCubit.get(context);
        //to check state first to call data when user enter the screen
        //and then check model to call data onc time not every time he enter

        if (state is BlogsIntState &&
            (BlogsDataModel.plants == null &&
                BlogsDataModel.tools == null &&
                BlogsDataModel.seeds == null)) {
          generalCubit.getBlogsData(accessToken: accessToken);
        }
        return WillPopScope(
          onWillPop: () async {
            generalCubit.changeBottomNavIndex(0);
            Navigator.of(context).pop();
            return false;
          },
          child: Scaffold(
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
                  generalCubit.changeBottomNavIndex(0);
                  Navigator.of(context).pop();
                },
              ),
              title: Text(
                'Blogs',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            body: generalCubit.loadBlogsData == true
                ? Center(
                    child: CircularProgressIndicator(
                      color: Theme.of(context).primaryColor,
                    ),
                  )
                : Column(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: AppHeight.h46,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: generalCubit.blogsTabs.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  generalCubit.changeBlogsTabIndex(index);
                                },
                                child: tobTabButtons(
                                  currentWidgetIndex: index,
                                  context: context,
                                  currentIndexColor:
                                      generalCubit.currentBlogTabIndex,
                                  tabs: generalCubit.blogsTabs,
                                ),
                              );
                            }),
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemCount: BlogsDataModel.getCurrentTabList(
                                  generalCubit.currentBlogTabIndex)
                              ?.length,
                          itemBuilder: (contex, index) {
                            return GestureDetector(
                              onTap: () {
                                navigatePushTo(
                                    navigateTO: BlogDetailes(
                                      generalCubit.currentBlogTabIndex == 0
                                          ? BlogsDataModel.getPlantDescription(
                                              index: index)
                                          : generalCubit.currentBlogTabIndex ==
                                                  1
                                              ? BlogsDataModel
                                                  .getSeedDescription(
                                                      index: index)
                                              : BlogsDataModel
                                                  .getToolsDescription(
                                                      index: index),
                                      generalCubit.currentBlogTabIndex == 0
                                          ? BlogsDataModel.getPlantName(
                                              index: index)
                                          : generalCubit.currentBlogTabIndex ==
                                                  1
                                              ? BlogsDataModel.getSeedName(
                                                  index: index)
                                              : BlogsDataModel.getToolsName(
                                                  index: index),
                                      generalCubit.currentBlogTabIndex == 0
                                          ? BlogsDataModel.getPlantPhoto(
                                              index: index)
                                          : generalCubit.currentBlogTabIndex ==
                                                  1
                                              ? BlogsDataModel.getSeedPhoto(
                                                  index: index)
                                              : BlogsDataModel.getToolsPhoto(
                                                  index: index),
                                    ),
                                    context: context);
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(AppPadding.p12),
                                child: Column(
                                  children: [
                                    cartWithBlogsDesign(
                                      title: Text(
                                        '2 days ago',
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleLarge
                                            ?.copyWith(
                                              color: Theme.of(context)
                                                  .primaryColor,
                                            ),
                                      ),
                                      subTitle: Text(
                                        generalCubit.currentBlogTabIndex == 0
                                            ? BlogsDataModel.getPlantName(
                                                index: index)
                                            : generalCubit
                                                        .currentBlogTabIndex ==
                                                    1
                                                ? BlogsDataModel.getSeedName(
                                                    index: index)
                                                : BlogsDataModel.getToolsName(
                                                    index: index),
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleLarge,
                                      ),
                                      context: contex,
                                      photoUrl: generalCubit
                                                  .currentBlogTabIndex ==
                                              0
                                          ? BlogsDataModel.getPlantPhoto(
                                              index: index)
                                          : generalCubit.currentBlogTabIndex ==
                                                  1
                                              ? BlogsDataModel.getSeedPhoto(
                                                  index: index)
                                              : BlogsDataModel.getToolsPhoto(
                                                  index: index),
                                      moreSubTitle: Column(
                                        children: [
                                          Text(
                                            generalCubit.currentBlogTabIndex ==
                                                    0
                                                ? BlogsDataModel
                                                    .getPlantDescription(
                                                        index: index)
                                                : generalCubit
                                                            .currentBlogTabIndex ==
                                                        1
                                                    ? BlogsDataModel
                                                        .getSeedDescription(
                                                            index: index)
                                                    : BlogsDataModel
                                                        .getToolsDescription(
                                                            index: index),
                                            style: Theme.of(context)
                                                .textTheme
                                                .subtitle1,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
          ),
        );
      },
      listener: (context, state) {},
    );
  }
}
