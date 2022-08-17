import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie/presentation_layer/screen/mobile_screens/blog_screen_mobile.dart';
import 'package:la_vie/presentation_layer/screen/mobile_screens/community_screen_mobile.dart';
import 'package:la_vie/presentation_layer/screen/mobile_screens/home_screen_mobile.dart';
import 'package:la_vie/presentation_layer/screen/mobile_screens/shop_screen_mobile.dart';

import '../../../presentation_layer/screen/mobile_screens/notification_screen_mobile.dart';
import 'general_cubit_states.dart';

class GeneralCubit extends Cubit<GeneralCubitStates> {
  GeneralCubit() : super(InitialAppState());
  static GeneralCubit get(context) => BlocProvider.of(context);
/////////////////////////////////var..............
  int currentBottomNavIndex = 0;
//////////////////func//////////////......................
  List<Widget> screens = const [
    HomeScreenMobile(),
    BlogScreenMobile(),
    NotificationScreen(),
    ShopScreenMobile(),
  ];
  void changeBottomNavIndex(int index) {
    currentBottomNavIndex = index;
    emit(ChangeBottomNavIndex());
  }
}
