import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie/model/data_models/forum_models/all_formus_model.dart';
import 'package:la_vie/model/data_models/forum_models/forums_me.dart';
import 'package:la_vie/view/components/top_tabe_buttons.dart';
import 'package:la_vie/view_model/forums_cubit/forums_cubit.dart';
import 'package:la_vie/view_model/forums_cubit/forums_state.dart';
import 'package:la_vie/view_model/general_cubit/general_cubit.dart';
import 'package:la_vie/view_model/general_cubit/general_cubit_states.dart';

import '../../components/defaults.dart';
import '../../constants/constants.dart';
import '../../constants/controllers.dart';
import '../../components/post_design.dart';
import 'create_post.dart';

class CommunityScreenMobile extends StatelessWidget {
  const CommunityScreenMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ForumsCubit, ForumsCubitStates>(
      builder: (context, state) {
        var forumsCubit = ForumsCubit.get(context);
        return Scaffold(
          floatingActionButton: FloatingActionButton(
            backgroundColor: Theme.of(context).primaryColor,
            onPressed: () {
              navigatePushTo(
                  navigateTO: const CreatePostScreen(), context: context);
            },
            child: Icon(
              Icons.add,
              color: AppColors.iconColorWhite,
            ),
          ),
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
              'Discussion Forums',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          body: ConditionalBuilder(
              builder: (context) {
                return Center(
                  child: CircularProgressIndicator(
                      color: Theme.of(context).primaryColor),
                );
              },
              condition: forumsCubit.loadForumsData,
              fallback: (context) {
                return Padding(
                  padding: const EdgeInsets.only(
                    left: AppPadding.p12,
                    right: AppPadding.p12,
                    top: AppPadding.p12,
                  ),
                  child: Column(
                    children: [
                      mobileHomeSearchBar(
                        width: double.infinity,
                        height: AppHeight.h10,
                        radius: AppRadius.r10,
                        context: context,
                        controller:
                            TextFormFieldControllers.forumsSearchController,
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
                      ),
                      const SizedBox(
                        height: AppHeight.h8,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: AppHeight.h70,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: forumsCubit.forumsTabs.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                forumsCubit.changeTobTabIndex(index);
                              },
                              child: topTabButtons(
                                  tabs: forumsCubit.forumsTabs,
                                  currentIndexColor:
                                      forumsCubit.tobTabButtonsForumsIndex,
                                  currentWidgetIndex: index,
                                  context: context),
                            );
                          },
                        ),
                      ),
                      const SizedBox(
                        height: AppHeight.h8,
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemBuilder: (context, index) {
                            return postDesign(
                              context: context,
                              userPhoto:
                                  forumsCubit.getUserProfilePhotoBetweenModels(
                                      forumsCubit.tobTabButtonsForumsIndex,
                                      index),
                              postDate: 'a month ago',
                              onTabOnLike: () {},
                              postDescription:
                                  forumsCubit.getPostDescriptionBetweenModels(
                                      forumsCubit.tobTabButtonsForumsIndex,
                                      index),
                              postLikes: forumsCubit
                                  .getPostLikesCountBetweenModels(
                                      forumsCubit.tobTabButtonsForumsIndex,
                                      index)
                                  .toString(),
                              postReplies:
                                  '${forumsCubit.getPostCommentsCountBetweenModels(forumsCubit.tobTabButtonsForumsIndex, index)} Replies',
                              postTitle: forumsCubit.getPostTitleBetweenModels(
                                  forumsCubit.tobTabButtonsForumsIndex, index),
                              userName:
                                  '${forumsCubit.getUserNameBetweenModels(forumsCubit.tobTabButtonsForumsIndex, index)} ${forumsCubit.getUserLastNameBetweenModels(forumsCubit.tobTabButtonsForumsIndex, index)}',
                              postPhotoUrl:
                                  forumsCubit.getPostImageBetweenModels(
                                      forumsCubit.tobTabButtonsForumsIndex,
                                      index),
                            );
                          },
                          itemCount: forumsCubit.tobTabButtonsForumsIndex == 0
                              ? AllFormusModel.forumsData?.length
                              : FormusMeModel.forumsMeData?.length,
                        ),
                      ),
                    ],
                  ),
                );
              }),
        );
      },
      listener: (context, state) {},
    );
  }
}
