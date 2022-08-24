import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie/model/data_models/forum_models/all_formus_model.dart';
import 'package:la_vie/model/data_models/forum_models/forums_me.dart';
import 'package:la_vie/view/components/top_tabe_buttons.dart';
import 'package:la_vie/view_model/forums_cubit/forums_cubit.dart';
import 'package:la_vie/view_model/forums_cubit/forums_state.dart';
import '../../components/bottom_sheet_comments.dart';
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
        if (state is CommunityIniteState &&
            (FormusMeModel.forumsMeData == null)) {
          print('embty');
          // forumsCubit.getAllForums(accessToken);
          forumsCubit.getForumsMe(accessToken);
        } else if (FormusMeModel.forumsMeData == null &&
            forumsCubit.tobTabButtonsForumsIndex == 1) {
          print('object');
          //  forumsCubit.getForumsMe(accessToken);
        }
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
          body: forumsCubit.loadForumsData
              ? Center(
                  child: CircularProgressIndicator(
                      color: Theme.of(context).primaryColor),
                )
              : Padding(
                  padding: const EdgeInsets.only(
                    left: AppPadding.p12,
                    right: AppPadding.p12,
                    top: AppPadding.p12,
                  ),
                  child: SingleChildScrollView(
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
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium
                                ?.copyWith(
                                  color: AppColors.titleTextColor,
                                ),
                          ),
                        ),
                        const SizedBox(
                          height: AppHeight.h8,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 0.08,
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
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return postDesign(
                                ontTabOnLikeText: () {},
                                ontTabOnCommentText: () {
                                  showModalBottomSheet(
                                    shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(
                                        AppRadius.r22,
                                      ),
                                      topRight: Radius.circular(
                                        AppRadius.r22,
                                      ),
                                    )),
                                    backgroundColor:
                                        Theme.of(context).backgroundColor,
                                    context: context,
                                    builder: (context) {
                                      return Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(
                                                AppPadding.p8),
                                            child: Text(
                                              'Comments',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleLarge,
                                            ),
                                          ),
                                          Expanded(
                                            child: ListView.builder(
                                              itemCount: forumsCubit
                                                          .tobTabButtonsForumsIndex ==
                                                      0
                                                  ? AllFormusModel
                                                      .countOfComments(index)
                                                  : FormusMeModel
                                                      .countOfComments(index),
                                              itemBuilder:
                                                  (context, indexOfComment) {
                                                return bottomSheetCommentsLikes(
                                                    context: context,
                                                    title: forumsCubit
                                                        .getCommentsUsersBetweenModels(
                                                            forumsCubit
                                                                .tobTabButtonsForumsIndex,
                                                            index,
                                                            indexOfComment)
                                                        .toString(),
                                                    imageUrl:
                                                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTfoEJnmZsFC7TOu4CTSzf0HiYTMctj8QberSv2zLyPoiDmHLuiXaBDCYuXGbetHewsg3Y&usqp=CAU');
                                              },
                                            ),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
                                context: context,
                                userPhoto: forumsCubit
                                    .getUserProfilePhotoBetweenModels(
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
                                postTitle:
                                    forumsCubit.getPostTitleBetweenModels(
                                        forumsCubit.tobTabButtonsForumsIndex,
                                        index),
                                userName:
                                    '${forumsCubit.getUserNameBetweenModels(forumsCubit.tobTabButtonsForumsIndex, index)} ${forumsCubit.getUserLastNameBetweenModels(forumsCubit.tobTabButtonsForumsIndex, index)}',
                                postPhotoUrl:
                                    forumsCubit.getPostImageBetweenModels(
                                        forumsCubit.tobTabButtonsForumsIndex,
                                        index),
                              );
                            },
                            itemCount: FormusMeModel.forumsMeData?.length,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
        );
      },
      listener: (context, state) {},
    );
  }
}
