import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie/view_model/forums_cubit/forums_cubit.dart';
import 'package:la_vie/view_model/forums_cubit/forums_state.dart';

import '../../components/defaults.dart';
import '../../constants/constants.dart';
import '../../constants/controllers.dart';

class CreatePostScreen extends StatelessWidget {
  const CreatePostScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ForumsCubit, ForumsCubitStates>(
      builder: (context, state) {
        var forumsCubit = ForumsCubit.get(context);
        return Scaffold(
          resizeToAvoidBottomInset: true,
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
              'Create New Post',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(AppPadding.p12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    forumsCubit.pickImage();
                  },
                  child: Center(
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Theme.of(context).primaryColor,
                        ),
                        color: Theme.of(context).backgroundColor,
                        borderRadius: BorderRadius.circular(
                          AppRadius.r5,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(AppPadding.p30),
                        child: Column(
                          children: [
                            Icon(
                              Icons.add,
                              color: Theme.of(context).primaryColor,
                            ),
                            const SizedBox(
                              height: AppHeight.h8,
                            ),
                            Text(
                              'Add Photo',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge
                                  ?.copyWith(
                                    color: Theme.of(context).primaryColor,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Text(
                  'Title',
                  style: Theme.of(context).textTheme.subtitle1,
                ),
                const SizedBox(
                  height: AppHeight.h8,
                ),
                defaultTextFormField(
                  width: double.infinity,
                  height: AppHeight.h46,
                  radius: AppRadius.r5,
                  context: context,
                  controller: TextFormFieldControllers.titlePostController,
                ),
                const SizedBox(
                  height: AppHeight.h8,
                ),
                Text(
                  'Description',
                  style: Theme.of(context).textTheme.subtitle1,
                ),
                const SizedBox(
                  height: AppHeight.h8,
                ),
                defaultTextFormField(
                  maxLine: 6,
                  width: double.infinity,
                  height: AppHeight.h100,
                  radius: AppRadius.r5,
                  context: context,
                  controller:
                      TextFormFieldControllers.descriptionPostController,
                ),
                const SizedBox(
                  height: AppHeight.h12,
                ),
                defaultButton(
                  onPressed: () {
                    forumsCubit.createPost(
                      accessToken: accessToken,
                      photoUrl: forumsCubit.finalImage!,
                      postDescription: TextFormFieldControllers
                          .descriptionPostController.text,
                      postName:
                          TextFormFieldControllers.titlePostController.text,
                    );
                  },
                  buttonChild: Text(
                    'Post',
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                  width: double.infinity,
                  height: AppHeight.h46,
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
