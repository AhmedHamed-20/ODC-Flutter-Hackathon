import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie/model/data_models/forum_models/all_formus_model.dart';
import 'package:la_vie/model/data_models/forum_models/forums_me.dart';
import 'package:la_vie/model/network/dio/dio.dart';
import 'package:la_vie/model/network/end_points/end_points.dart';

import 'forums_state.dart';

class ForumsCubit extends Cubit<ForumsCubitStates> {
  ForumsCubit() : super(InitialAppState());
  static ForumsCubit get(context) => BlocProvider.of(context);
  /////////////////////////var///////////////////////////////
  bool loadForumsData = false;
  int tobTabButtonsForumsIndex = 0;
  List forumsTabs = ['All Forums', 'My Forums'];
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
    }).catchError((onError) {
      if (onError is DioError) {
        print(onError.response);
        loadForumsData = false;
        emit(AllForumsDataGetError());
      }
    });
  }

  Future getForumsMe(String accessToken) async {
    emit(LoadAllForumsData());
    return await DioHelper.getData(
      url: EndPoints.getMeForums,
      headers: {
        'Authorization': 'Bearer $accessToken',
        'Content-Type': 'application/json'
      },
    ).then((value) {
      FormusMeModel.storeData(value.data);
      loadForumsData = false;
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
}
