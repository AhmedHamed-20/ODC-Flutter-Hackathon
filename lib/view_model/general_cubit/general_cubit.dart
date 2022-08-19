import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie/model/data_models/blogs/blogs_data_model.dart';
import 'package:la_vie/model/network/dio/dio.dart';
import 'package:la_vie/model/network/end_points/end_points.dart';
import 'package:la_vie/view/screen/mobile_screens/blog_screen_mobile.dart';

import '../../../view/screen/mobile_screens/home_screen_mobile.dart';
import '../../../view/screen/mobile_screens/notification_screen_mobile.dart';
import '../../../view/screen/mobile_screens/scan_screen.dart';
import '../../../view/screen/mobile_screens/shop_screen_mobile.dart';
import 'general_cubit_states.dart';

class GeneralCubit extends Cubit<GeneralCubitStates> {
  GeneralCubit() : super(InitialAppState());
  static GeneralCubit get(context) => BlocProvider.of(context);
/////////////////////////////////var..............
  int currentBottomNavIndex = 0;
//////////////////func//////////////......................
  List<Widget> screens = const [
    HomeScreenMobile(),
    ScanScreen(),
    NotificationScreen(),
    ShopScreenMobile(),
    BlogScreenMobile(),
  ];
  void changeBottomNavIndex(int index) {
    currentBottomNavIndex = index;
    emit(ChangeBottomNavIndex());
  }

  Future getBlogsData({required String accessToken}) async {
    return await DioHelper.getData(
      url: EndPoints.blogs,
      headers: {
        'Authorization': 'Bearer $accessToken',
        'Content-Type': 'application/json'
      },
    ).then((value) {
      BlogsDataModel.storeDate(value.data);
      print(BlogsDataModel.plants);
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
}
