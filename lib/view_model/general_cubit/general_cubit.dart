import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie/model/data_models/product_model/all_products_model.dart';
import 'package:la_vie/model/data_models/product_model/all_tools_model.dart';
import 'package:la_vie/model/data_models/product_model/plants_product_model.dart';
import 'package:la_vie/model/network/dio/dio.dart';
import 'package:la_vie/model/network/end_points/end_points.dart';
import 'package:la_vie/view/screen/mobile_screens/blog_screen_mobile.dart';
import 'package:la_vie/view/screen/mobile_screens/user_profile_screen.dart';

import '../../../view/screen/mobile_screens/home_screen_mobile.dart';
import '../../../view/screen/mobile_screens/notification_screen_mobile.dart';
import '../../../view/screen/mobile_screens/scan_screen.dart';
import '../../model/data_models/blogs/blogs_data_model.dart';
import '../../model/data_models/get_my_data_model/get_my_data_model.dart';
import '../../model/data_models/product_model/seeds_product_mode.dart';
import 'general_cubit_states.dart';

class GeneralCubit extends Cubit<GeneralCubitStates> {
  GeneralCubit() : super(InitialAppState());
  static GeneralCubit get(context) => BlocProvider.of(context);
/////////////////////////////////var..............
  int currentBottomNavIndex = 0;
  int currentBlogTabIndex = 0;
  int currentHomeTabIndex = 0;
  bool loadAllProudctsData = false;
  bool loadBlogsData = false;
  List blogsTabs = ['Plants', 'Seeds', 'Tools'];
  List homeTabs = ['All', 'Plants', 'Seeds', 'Tools'];

//////////////////func//////////////......................

  List<Widget> screens = const [
    HomeScreenMobile(),
    ScanScreen(),
    NotificationScreen(),
    UserProfileScreen(),
    BlogScreenMobile(),
  ];

  void changeBottomNavIndex(int index) {
    currentBottomNavIndex = index;
    emit(ChangeBottomNavIndex());
  }

  void changeBlogsTabIndex(int index) {
    currentBlogTabIndex = index;
    emit(ChangeBlogsTabIndex());
  }

  void changeHomeTabIndex(int index) {
    currentHomeTabIndex = index;
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

  Future getMyData(String accessToken) async {
    return await DioHelper.getData(
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

  Future getAllProudctsData(String accessToken) async {
    loadAllProudctsData = true;
    emit(LoadAllProudctsData());
    return await DioHelper.getData(
      url: EndPoints.getAllProducst,
      headers: {
        'Authorization': 'Bearer $accessToken',
        'Content-Type': 'application/json'
      },
    ).then(
      (value) {
        AllProductsModel.storeDate(value.data);
        print('allseed ${AllProductsModel.allSeeds}');
        loadAllProudctsData = false;
        emit(AllProudctsDataGetSuccess());
      },
    ).catchError(
      (onError) {
        if (onError is DioError) {
          loadAllProudctsData = false;
          print(onError.response);
          emit(AllProudctsDataGetError());
        }
      },
    );
  }

  String getNameOProudctBetweenModels(
      int currenthometabIndex, int widgetIndex) {
    switch (currenthometabIndex) {
      case 0:
        {
          return AllProductsModel.getNameOfProduct(
            widgetIndex,
          );
        }
      case 1:
        {
          return AllPlants.getNameOfPlants(widgetIndex);
        }
      case 2:
        {
          return AllSeeds.getNameOfSeed(
            widgetIndex,
          );
        }
      case 3:
        {
          return AllTools.getNameOfTools(widgetIndex);
        }
      default:
        {
          return 'title';
        }
    }
  }

  int getLengthOfEachmodel(int currenthometabIndex) {
    switch (currenthometabIndex) {
      case 0:
        {
          return AllProductsModel.allProdcutsData?.length ?? 1;
        }
      case 1:
        {
          return AllProductsModel.allPlants?.length ?? 1;
        }
      case 2:
        {
          return AllProductsModel.allSeeds?.length ?? 1;
        }

      case 3:
        {
          return AllProductsModel.allTools?.length ?? 1;
        }
      default:
        {
          return 1;
        }
    }
  }

  int getPriceofProudctBetweenModels(int currentHometabIndex, int widgetIndex) {
    switch (currentHometabIndex) {
      case 0:
        {
          return AllProductsModel.getPriceOfProduct(widgetIndex);
        }
      case 1:
        {
          return AllPlants.getPriceOfPlants(widgetIndex);
        }
      case 2:
        {
          return AllSeeds.getPriceOfSeed(widgetIndex);
        }

      case 3:
        {
          return AllTools.getPriceOfTools(widgetIndex);
        }
      default:
        {
          return 0;
        }
    }
  }

  List getCharacteristicsofProudctBetweenModels(
      int currentHometabIndex, int widgetIndex) {
    switch (currentHometabIndex) {
      case 0:
        {
          List characteristics = [0];
          characteristics.add(
            AllProductsModel.getSunLightOfProduct(widgetIndex),
          );

          characteristics.add(
            AllProductsModel.getWaterCapacityOfProduct(widgetIndex),
          );

          characteristics.add(
            AllProductsModel.getTemperatureOfProduct(widgetIndex),
          );
          characteristics.removeAt(0);
          return characteristics;
        }
      case 1:
        {
          List characteristics = [0];
          characteristics.add(
            AllPlants.getSunLightOfPlant(widgetIndex),
          );

          characteristics.add(
            AllPlants.getWaterCapacityOfPlant(widgetIndex),
          );

          characteristics.add(
            AllPlants.getTempOfPlant(widgetIndex),
          );
          characteristics.removeAt(0);

          return characteristics;
        }
      case 2:
        {
          return [25, 10, 10];
        }

      case 3:
        {
          return [25, 10, 10];
        }
      default:
        {
          return [25, 10, 10];
        }
    }
  }

  String getPhotoofProudctBetweenModels(
      int currenthometabIndex, int widgetIndex) {
    switch (currenthometabIndex) {
      case 0:
        {
          return AllProductsModel.getImageUrlOfProduct(widgetIndex);
        }
      case 1:
        {
          return AllPlants.getPhotoOfPlants(widgetIndex);
        }
      case 2:
        {
          return AllSeeds.getPhotoOfSeed(widgetIndex);
        }
      case 3:
        {
          return AllTools.getPhotoOfTools(widgetIndex);
        }
      default:
        {
          return 'https://media.istockphoto.com/vectors/default-image-icon-vector-missing-picture-page-for-website-design-or-vector-id1357365823?k=20&m=1357365823&s=612x612&w=0&h=ZH0MQpeUoSHM3G2AWzc8KkGYRg4uP_kuu0Za8GFxdFc=';
        }
    }
  }

  String getDecriptionofProudctBetweenModels(
      int currenthometabIndex, int widgetIndex) {
    switch (currenthometabIndex) {
      case 0:
        {
          return AllProductsModel.getDescriptionOfProduct(widgetIndex);
        }
      case 1:
        {
          return AllPlants.getDescriptionOfPlants(widgetIndex);
        }
      case 2:
        {
          return AllSeeds.getDescriptionOfSeeds(widgetIndex);
        }
      case 3:
        {
          return AllTools.getDescriptionOfTools(widgetIndex);
        }
      default:
        {
          return 'temp';
        }
    }
  }
}
