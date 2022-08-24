import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie/model/data_models/forum_models/all_formus_model.dart';
import 'package:la_vie/model/data_models/forum_models/forums_me.dart';
import 'package:la_vie/model/network/dio/dio.dart';
import 'package:la_vie/model/network/end_points/end_points.dart';
import 'package:la_vie/view/constants/constants.dart';
import 'dart:io' as Io;

import 'forums_state.dart';

class ForumsCubit extends Cubit<ForumsCubitStates> {
  ForumsCubit() : super(InitialAppState());
  static ForumsCubit get(context) => BlocProvider.of(context);
  /////////////////////////var///////////////////////////////
  bool loadForumsData = false;
  int tobTabButtonsForumsIndex = 0;
  List forumsTabs = ['All Forums', 'My Forums'];
  File? file;
  String? finalImage;
  ////////////////////////func//////////////////////////////////
  Future getAllForums(String accessToken) async {
    loadForumsData = true;
    emit(LoadAllForumsData());
    return await DioHelper.getData(
      url: EndPoints.getAllForums,
      headers: {
        'Authorization': 'Bearer $accessToken',
        'Content-Type': 'application/json'
      },
    ).then((value) {
      AllFormusModel.storeData(value.data);
      //print(value.data);
    }).catchError((onError) {
      if (onError is DioError) {
        print(onError.response);
        loadForumsData = false;
        emit(AllForumsDataGetError());
      }
    });
  }

  Future getForumsMe(String accessToken) async {
    //  emit(LoadAllForumsData());
    return await DioHelper.getData(
      url: EndPoints.getMeForums,
      headers: {
        'Authorization': 'Bearer $accessToken',
        'Content-Type': 'application/json'
      },
    ).then((value) {
      FormusMeModel.storeData(value.data);
      loadForumsData = false;
      print(value.data);
      emit(AllForumsDataGetSuccess());
    }).catchError((onError) {
      if (onError is DioError) {
        print(onError.response);
        loadForumsData = false;
        emit(AllForumsDataGetError());
      }
    });
  }

  void changeTobTabIndex(int index) {
    tobTabButtonsForumsIndex = index;
    emit(ChangeTobTabIndex());
  }

  String getPostImageBetweenModels(int currentTabIndex, int widgetIndex) {
    switch (currentTabIndex) {
      case 0:
        {
          return AllFormusModel.getForumImage(widgetIndex);
        }
      case 1:
        {
          return FormusMeModel.getForumImage(widgetIndex);
        }
      default:
        {
          return 'https://media.istockphoto.com/vectors/default-image-icon-vector-missing-picture-page-for-website-design-or-vector-id1357365823?k=20&m=1357365823&s=612x612&w=0&h=ZH0MQpeUoSHM3G2AWzc8KkGYRg4uP_kuu0Za8GFxdFc=';
        }
    }
  }

  String getPostTitleBetweenModels(int currentTabIndex, int widgetIndex) {
    switch (currentTabIndex) {
      case 0:
        {
          return AllFormusModel.getForumTitle(widgetIndex);
        }
      case 1:
        {
          return FormusMeModel.getForumTitle(widgetIndex);
        }
      default:
        {
          return 'temp';
        }
    }
  }

  String getPostDescriptionBetweenModels(int currentTabIndex, int widgetIndex) {
    switch (currentTabIndex) {
      case 0:
        {
          return AllFormusModel.getForumDesciption(widgetIndex);
        }
      case 1:
        {
          return FormusMeModel.getForumDesciption(widgetIndex);
        }
      default:
        {
          return 'temp';
        }
    }
  }

  int getPostLikesCountBetweenModels(int currentTabIndex, int widgetIndex) {
    switch (currentTabIndex) {
      case 0:
        {
          return AllFormusModel.countOfLikes(widgetIndex);
        }
      case 1:
        {
          return FormusMeModel.countOfLikes(widgetIndex);
        }
      default:
        {
          return 1;
        }
    }
  }

  int getPostCommentsCountBetweenModels(int currentTabIndex, int widgetIndex) {
    switch (currentTabIndex) {
      case 0:
        {
          return AllFormusModel.countOfComments(widgetIndex);
        }
      case 1:
        {
          return FormusMeModel.countOfComments(widgetIndex);
        }
      default:
        {
          return 1;
        }
    }
  }

  String getUserProfilePhotoBetweenModels(
      int currentTabIndex, int widgetIndex) {
    switch (currentTabIndex) {
      case 0:
        {
          return 'https://media.istockphoto.com/vectors/default-image-icon-vector-missing-picture-page-for-website-design-or-vector-id1357365823?k=20&m=1357365823&s=612x612&w=0&h=ZH0MQpeUoSHM3G2AWzc8KkGYRg4uP_kuu0Za8GFxdFc=';
        }
      case 1:
        {
          return FormusMeModel.getUserPhoto(widgetIndex);
        }
      default:
        {
          return 'https://media.istockphoto.com/vectors/default-image-icon-vector-missing-picture-page-for-website-design-or-vector-id1357365823?k=20&m=1357365823&s=612x612&w=0&h=ZH0MQpeUoSHM3G2AWzc8KkGYRg4uP_kuu0Za8GFxdFc=';
        }
    }
  }

  String getUserNameBetweenModels(int currentTabIndex, int widgetIndex) {
    switch (currentTabIndex) {
      case 0:
        {
          return 'temp';
        }
      case 1:
        {
          return FormusMeModel.getUserName(widgetIndex);
        }
      default:
        {
          return 'temp';
        }
    }
  }

  String getUserLastNameBetweenModels(int currentTabIndex, int widgetIndex) {
    switch (currentTabIndex) {
      case 0:
        {
          return 'temp2';
        }
      case 1:
        {
          return FormusMeModel.getUserLastName(widgetIndex);
        }
      default:
        {
          return 'temp2';
        }
    }
  }

  String getCommentsUsersBetweenModels(
      int currentTabIndex, int widgetIndex, int indexOfComment) {
    switch (currentTabIndex) {
      case 0:
        {
          return AllFormusModel.getUserComment(widgetIndex, indexOfComment);
        }
      case 1:
        {
          return FormusMeModel.getUserComment(widgetIndex, indexOfComment);
        }
      default:
        {
          return 'temp2';
        }
    }
  }

  String base64Encode(List<int> bytes) => base64.encode(bytes);

  Future pickImage() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      file = File(result.files.single.path.toString());
      print(file?.path);
      final bytes = await Io.File(file!.path).readAsBytes();
      finalImage = "data:image/png;base64,${base64Encode(bytes)}";

      print(finalImage);
    } else {
      // User canceled the picker
    }
    return result;
  }

  void emitForumsState() {
    emit(CommunityIniteState());
  }

  Future createPost({
    required String accessToken,
    required String postName,
    required String postDescription,
    required String photoUrl,
  }) {
    return DioHelper.postData(
      url: EndPoints.createPost,
      data: {
        'title': postName,
        'description': postDescription,
        'imageBase64': photoUrl,
      },
      headers: {
        'Authorization': 'Bearer $accessToken',
        'Content-Type': 'application/json'
      },
    ).then((value) {
      print(value.data);
      flutterToast(
          msg: 'post created success',
          backgroundColor: AppColors.toastSuccess,
          textColor: AppColors.white);
      emit(PostCreatedSuccess());
    }).catchError((onError) {
      if (onError is DioError) {
        print(onError.response);
      }
    });
  }
}
