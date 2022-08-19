import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie/model/cache/shared_preferences.dart';
import 'package:la_vie/model/data_models/get_my_data_model/get_my_data_model.dart';
import 'package:la_vie/model/data_models/login_model/user_login_model.dart';
import 'package:la_vie/model/data_models/login_model/user_signup_model.dart';
import 'package:la_vie/model/network/dio/dio.dart';
import 'package:la_vie/model/network/end_points/end_points.dart';

import 'login_states.dart';

class LoginCubit extends Cubit<LoginCubitStates> {
  LoginCubit() : super(InitialAppState());
  static LoginCubit get(context) => BlocProvider.of(context);
//////////////////////////var///////////////////////////////
  bool passwordloginObscureText = true;
  bool passwordSignUpObscureText = true;
  // to use in login screen and navigate it's become true
  bool dataGetSuccess = false;
  /////////////Func////////////////////////////////////////
  Future userLogin({
    required String email,
    required String password,
  }) async {
    emit(LoginLoadingData());
    return await DioHelper.postData(
      headers: {'Content-Type': 'application/json'},
      url: EndPoints.signIn,
      data: {
        "password": password,
        "email": email,
      },
    ).then(
      (value) async {
        LoginModel.storeSignUpData(value.data);
        CacheHelper.setData(key: 'accessToken', value: LoginModel.accessToken)
            .then((value) {})
            .catchError((onError) {});
        await getMyData(LoginModel.accessToken!);
        emit(LoginDataGetSuccess());
      },
    ).catchError(
      (error) {
        if (error is DioError) {
          print(error.response);
          emit(LoginDataGetError());
        }
      },
    );
  }

  Future signUp({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
  }) async {
    emit(SignUpLoadingData());
    return await DioHelper.postData(url: EndPoints.signUp, data: {
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'password': password,
    }, headers: {
      'Content-Type': 'application/json'
    }).then((value) async {
      SignUpModel.storeSignUpData(value.data);
      CacheHelper.setData(key: 'accessToken', value: SignUpModel.accessToken);
      await getMyData(SignUpModel.accessToken!);
      emit(SignUpDataGetSuccess());
    }).catchError((onError) {
      if (onError is DioError) {
        print(onError.response);
        emit(SignUpDataGetError());
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
        dataGetSuccess = true;
        GetMyDataModel.storeMyData(value.data);
        emit(UserDataGetSuccess());
      },
    ).catchError(
      (onError) {
        if (onError is DioError) {
          dataGetSuccess = false;
          print(onError.response);
          emit(UserDataGetError());
        }
      },
    );
  }

  void changeObscureValue({required bool inLogin}) {
    if (inLogin) {
      passwordloginObscureText = !passwordloginObscureText;
      emit(ChangePasswordObScureState());
    } else {
      passwordSignUpObscureText = !passwordSignUpObscureText;
      emit(ChangePasswordObScureState());
    }
  }
}
