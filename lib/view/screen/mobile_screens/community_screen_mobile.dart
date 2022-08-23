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
                                ontTabOnLikeText: () {
                                  showModalBottomSheet(
                                    backgroundColor:
                                        Theme.of(context).backgroundColor,
                                    shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(AppRadius.r22),
                                      topRight: Radius.circular(AppRadius.r22),
                                    )),
                                    context: context,
                                    builder: (context) {
                                      return ListView.builder(
                                          itemCount: 3,
                                          itemBuilder: (context, index) {
                                            return bottomSheetCommentsLikes(
                                              context: context,
                                              title: 'title',
                                              imageUrl:
                                                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTfoEJnmZsFC7TOu4CTSzf0HiYTMctj8QberSv2zLyPoiDmHLuiXaBDCYuXGbetHewsg3Y&usqp=CAU',
                                            );
                                          });
                                    },
                                  );
                                },
                                ontTabOnCommentText: () {
                                  showBottomSheet(
                                    context: context,
                                    builder: (context) {
                                      return ListView.builder(
                                          itemCount: forumsCubit
                                                      .tobTabButtonsForumsIndex ==
                                                  0
                                              ? AllFormusModel.countOfComments(
                                                  index)
                                              : FormusMeModel.countOfComments(
                                                  index),
                                          itemBuilder: (context, index) {
                                            return bottomSheetCommentsLikes(
                                                context: context,
                                                title: forumsCubit
                                                    .getCommentsUsersBetweenModels(
                                                        forumsCubit
                                                            .tobTabButtonsForumsIndex,
                                                        index),
                                                imageUrl:
                                                    'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAASYAAACrCAMAAAD8Q8FaAAABJlBMVEX///8hcfHf4eX///3f4eMhcfL///obbvH+//zo6us8fOXv8fHd3+Mhce/e4OIzVWWStegLa/QAaOIBQcuStOnR1dszVWYAYukcR1kxVWIsUGELa/H79/gAYeX5//n2/Pu3v8Zie4bi4OiGlZ7k5eP69/sAYuH9//Xc5OwbRVQAPsvl9/quyO2MsOnt9PqYtOIAYfO/2OpUjd1TiOLP3+1gleGFqei2y+jS6O8+c+RDg+PG1fE/gukgbPvr9fHF2eV6o+ttnOxbkesAWuScwuypt799kJpun+Jhhqwede4nXac1VFgkb80hc9xrg5RecYCZrrVIa3Jfb3W8y+9CX3BygoqWqavGx9qSnatQdZIpWZksSFIaPE91jMcANrYAL8ZceM0AKK8+EMyCAAAIwklEQVR4nO2cfVfaSh7HSSaTSZRJCCsJkEgEAwSr4gNX60Nb7RW97r1tr9W7211327vv/03sTBAIARVYzuac4fc5pkbtH8nnzHznl5khmQwAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAMD/GYSiA008Bn9edtB0pH2ZaYM0FSFViw5t5EC9P/HvmrbUnppvttfWckPWnjl2dtVl9tRuOJZluZMPd3js7S+vJtQ8cogkYUyp9CKEWLm0LzY1kLrvYMw1vSyJe3IPlrUxsVw+JH0PkS7puYNS2vDTvt6UYONXo9+OCHlWUU+TtN5J+3rTgmm6fbW79Vvb8oYT0tZfie6YJvenzHKmk6ZVnMnhPf5bKtF8ZjkrTKbp50GESyTKIOISx1knhLA0GmlpGDvhclZOSK04cU2YuPmVo+PO287x0Uk+kVpYcrcTlpZEGntaWx9IIreEuKfHPkL1uqb6/tk5SXQ9Fk7LSWykY73s3XpO83r4vv/+hCTiHZ+816diVawKC8VGOiyR9WPk1eueyqh46o6b1CStf1BkY0j8PI5iGHrat7ZIkDrsdCyhtyusGVXOjg5Pzm86b/MEk4Qmqy3XZFlRFPlF2H/IiuSJR3g/f7B1U2FtKDx0CHUtq3GbTCbeMS+4pmlQsl7aN7c44nUTbbxhgRSeWL1Bj+JJswYr+rSaROp2iGkaDGMXzYrnn1gU84dgZolQTPDI1AGmbmdUkyGHz/a7tG9ugcQi3N33fDW3x9xwev9GZzFNxNoORmzom8Vq9hlPad/b4uB105MmnPdZft/SWxbblOaHxDseti6CkfjeaNmtTXlSoity2je3ONhI5zxpIOda3es4mP1I3bZaUftcDoc7KlmnemyYU+SNol3erE0e+NK+ucXBNfUHsY8Z3ztzbnlsuzlWhPdqTE+7jFcFJN8J4uXA8mjCfU2IabJuMYtwd03168wS+6qjj3FNmIXTmKaJkoTSpFX62URWVN8LHcp7nbu2urrLvnZ9lurnIzXm3k5Ck7kEmjJDTbjhs3pgJZrRpaSRbzQaP7eR1/TzI1Wme6jHu1ikSRddU6xuwu6+WveuGpTXAvwLY1Zveuq+O1Jf0rxeiNEtm+Xr+C9qWSE1qYP5JveGacqcWjSyRCnZy6mqh26sEU0S/qU4pNWyTbPcag1+bH0VsjUNI1zic5MVb3fFumX5xIrwvZ/8pqeFDSmh6a+/lszSE2aP4Y92a6PnSKgqnLemWOyoTb+ye+G8syxiNY58v+5nDpKTBPi3cg/u5enUNm376bRYEFAT8zTURN0cqzBZA1q7Obhov216ah21neTiAf70uRrBPJmfv1S/fKlWH0y7/KX3224oYKfjmgYaMHXaSPPqPlJRBlUqXsW/WpeS0yk4fxZNUO4+lMzHkA9ygV4t28WCrsu1miyLGOHxiRQ+I+Dc7CK/oml8dq5SZ/2PJXmy1+21FcUwsrVqyS5+4L0rW+OZVKvVsllDMfqSWKcTZkFBi6+sUMJi/ORqtxk9yjV3rz4xS3hsysm91BUjm5U3S3b5d1kxFKXQMs07VgmMTGqKlE1Ija/TYVZXEjd/kDve385d5tl5tHaX5LY3l9It2+VrmcuJiqeaPDpRIJQmpDpJEVTiW772LPYMPHE7DyadyFOhZdu/hsyO/kfJLHfl0cYklKYJewgw5mnEp+OwNHF7AXavuCZFf3iqkkKzZLYKEzQJk018nW7MBeXtKGpKk3fQkaMaL4v0zUfW60JF2SiWzLtQ5NYUm72cHnIaKjyHeK8zQ4WXAzzL5eSyVNo3tzjiC1DT43YiDeEdK5e6OrMV9bkx0r65xaHNo4lK2wof1vTf2VPK3e41G+c+j09gipRNWmwBagZ2eusGYdk0W99KUZKPLa+IlE3M0+zZhOlhEJUE4bcyKzHZ11edbygQWNMsmwoHEFozapGnUomluF3ckMfXoETSFN9qMQPufVQSKDydbJ5MxvjuC5GyKbYANVNz2pEjT3L4YNt2q8CVTdAkDPNqOtAjEXq3aJpm+Q99giaRCoKR2cvpwZ/CqA7fKNrsQcUuburjkgyBNMUWoGYifyYbhl4osmh6tFlV8Lfx/TwiZRPXNIclieQCJSjwOfDy3x/Yt+K3UOSCgK/TTZhRehV8qbMex3KJFZYFk8V4cWxNUyhNsQWoWSzhlfBbZKmrB0HBZH2vWE3syVSMtG9uccw50mFM//HILBW7MquYah1eZZZKG3p8ixjTJEw2zTWRwmekyD/5ytyGHPA2VAu/8pgqXmdjPc8QqDVNnJabBvJbqfzwod96gvBzkRUG5XJslS4rVEEwzzOdxCun1nXIelxfSth95I93/9oYtiaBInyu+SaJb/PNH+uxyFaycqFaLA12EPQ0iZNNIwtQM2iSrHsla4zMC9S6d61qKGRrQtpcmiRC3aMgUVBmFTnLV8dF1DTfSMc/nXgajM8x1QTVNNNHokfJhxOnBcTMJqQ6c2miEjkOlIn75gd9MO2bWxz8PQTzNSaJ7AQvfhpKpLoJIXQ+T4RzTR+DF9qSaNmEctbrSpJEu6Lz75cmmzIZzz+f3hPh+wto9HoeSp2z4BVN4oC85psVi0xJZCn6lB379q4dGMuiiaeTv/1xZSrO+Y5xlxDXZf+QdwdB8LwlwTRlonWDHvzdcurgXBuco+hcUzP//vGXId+Pk3W4wNmU4a+mQBmNg6L37GnJc/R0jrTjHyOWXh7pZME0TQ16O9T0/f61T9kLVDfNyvcnSVtbr7Sl5db051bPEutxz3wkEzQx2ls9S/f6FK9tSPti06MThdPW/UvPvH0Eel3DrPhbW1GPe92SYqymfbEp8ucW63HvX29KTJNY7yaaCbX9I2pLL8/IcbLL3JhQ5z9nQRC9oyn7AkZWrqd9qanif3i/OgVpX2bK+L6qLs2L9wAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAP53/gvXg+d81uBivQAAAABJRU5ErkJggg==');
                                          });
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
                            itemCount: forumsCubit.tobTabButtonsForumsIndex == 0
                                ? AllFormusModel.forumsData?.length
                                : FormusMeModel.forumsMeData?.length,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
        );
      },
      listener: (context, state) {},
    );
  }
}
