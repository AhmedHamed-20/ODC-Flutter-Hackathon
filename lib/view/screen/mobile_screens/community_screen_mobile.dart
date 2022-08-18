import 'package:flutter/material.dart';

import '../../components/defaults.dart';
import '../../constants/constants.dart';
import '../../constants/controllers.dart';
import '../../components/post_design.dart';
import 'create_post.dart';

class CommunityScreenMobile extends StatelessWidget {
  const CommunityScreenMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
      body: Padding(
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
              controller: TextFormFieldControllers.forumsSearchController,
              prefixIcon: Icon(
                Icons.search,
                color: AppColors.iconColorGrey,
              ),
              label: Text(
                'Search',
                style: Theme.of(context).textTheme.labelMedium?.copyWith(
                      color: AppColors.titleTextColor,
                    ),
              ),
            ),
            const SizedBox(
              height: AppHeight.h8,
            ),
            Row(
              children: [
                defaultButton(
                  onPressed: () {},
                  buttonChild: Text(
                    'All Forums',
                    style: Theme.of(context).textTheme.labelMedium?.copyWith(
                          fontSize: AppFontSize.s12,
                        ),
                  ),
                  width: AppWidth.w100,
                  height: AppHeight.h31,
                ),
                const SizedBox(
                  width: AppWidth.w8,
                ),
                defaultButton(
                  onPressed: () {},
                  buttonChild: Text(
                    'My Forums',
                    style: Theme.of(context).textTheme.labelMedium?.copyWith(
                          fontSize: AppFontSize.s12,
                        ),
                  ),
                  width: AppWidth.w100,
                  height: AppHeight.h31,
                ),
              ],
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
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSyp4gAct8mXsUK_purhunJBH5baCGdd7j8-MKYs98cnMjWZUniSXBdp9DvzzHmqs_5TyY&usqp=CAU',
                    postDate: 'a month ago',
                    onTabOnLike: () {},
                    postDescription: 'description',
                    postLikes: '0 like',
                    postReplies: '2 Relies',
                    postTitle: 'Title',
                    userName: 'Ahmed Hamed',
                    postPhotoUrl:
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSyp4gAct8mXsUK_purhunJBH5baCGdd7j8-MKYs98cnMjWZUniSXBdp9DvzzHmqs_5TyY&usqp=CAU',
                  );
                },
                itemCount: 5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
