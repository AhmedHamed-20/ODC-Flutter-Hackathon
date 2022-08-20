import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie/model/data_models/blogs/blogs_data_model.dart';
import 'package:la_vie/model/network/dio/dio.dart';
import 'package:la_vie/model/network/end_points/end_points.dart';
import 'package:la_vie/view/screen/mobile_screens/blog_screen_mobile.dart';
import 'package:la_vie/view/screen/mobile_screens/user_profile_screen.dart';

import '../../../view/screen/mobile_screens/home_screen_mobile.dart';
import '../../../view/screen/mobile_screens/notification_screen_mobile.dart';
import '../../../view/screen/mobile_screens/scan_screen.dart';
import '../../model/data_models/get_my_data_model/get_my_data_model.dart';
import 'general_cubit_states.dart';

class GeneralCubit extends Cubit<GeneralCubitStates> {
  GeneralCubit() : super(InitialAppState());
  static GeneralCubit get(context) => BlocProvider.of(context);
/////////////////////////////////var..............
  int currentBottomNavIndex = 0;
  int currentBlogTabIndex = 0;

  bool loadBlogsData = false;
  List blogsTabs = ['Plants', 'Seeds', 'Tools'];
//////////////////func//////////////......................

  List<Widget> screens = const [
    HomeScreenMobile(),
    ScanScreen(),
    NotificationScreen(),
    UserProfileScreen(),
    BlogScreenMobile(),
  ];
  List blogsModelData = [
    BlogsDataModel.plants,
    BlogsDataModel.seeds,
    BlogsDataModel.tools,
  ];
  void changeBottomNavIndex(int index) {
    currentBottomNavIndex = index;
    emit(ChangeBottomNavIndex());
  }

  void changeBlogsTabIndex(int index) {
    currentBlogTabIndex = index;
    emit(ChangeBlogsTabIndex());
  }

  void emitBlogsIntState() {
    emit(BlogsIntState());
  }

  Future getBlogsData({required String accessToken}) async {
    loadBlogsData = true;
    emit(LoadBlogsData());
    return await DioHelper.getData(
      url: EndPoints.blogs,
      headers: {
        'Authorization': 'Bearer $accessToken',
        'Content-Type': 'application/json'
      },
    ).then((value) {
      BlogsDataModel.storeDate(value.data);
      print(BlogsDataModel.plants);
      loadBlogsData = false;
      emit(
        BlogsDataGetSuccess(),
      );
    }).catchError((onError) {
      if (DioError is DioError) {
        emit(BlogsDataGetError());
        print(onError.response);
      }
    });
  }

  getMyData(String accessToken) {
    return DioHelper.getData(
      url: EndPoints.getMe,
      headers: {
        'Authorization': 'Bearer $accessToken',
        'Content-Type': 'application/json'
      },
    ).then(
      (value) {
        print(value);
        GetMyDataModel.storeMyData(value.data);
        emit(UserDataGetSuccess());
      },
    ).catchError(
      (onError) {
        if (onError is DioError) {
          print(onError.response);
          emit(UserDataGetError());
        }
      },
    );
  }
}
