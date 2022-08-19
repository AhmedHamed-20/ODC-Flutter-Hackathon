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
  /////////////Func////////////////////////////////////////
  userLogin({
    required String email,
    required String password,
  }) {
    DioHelper.postData(
      headers: {'Content-Type': 'application/json'},
      url: EndPoints.signIn,
      data: {
        "password": password,
        "email": email,
      },
    ).then(
      (value) {
        LoginModel.storeSignUpData(value.data);
        CacheHelper.setData(key: 'accessToken', value: LoginModel.accessToken)
            .then((value) {})
            .catchError((onError) {});
        getMyData(LoginModel.accessToken!);
      },
    ).catchError(
      (error) {
        if (error is DioError) {
          print(error.response);
        }
      },
    );
  }

  void signUp({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
  }) {
    DioHelper.postData(url: EndPoints.signUp, data: {
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'password': password,
    }, headers: {
      'Content-Type': 'application/json'
    }).then((value) {
      SignUpModel.storeSignUpData(value.data);
      CacheHelper.setData(key: 'accessToken', value: SignUpModel.accessToken);
      getMyData(SignUpModel.accessToken!);
    }).catchError((onError) {
      if (onError is DioError) {
        print(onError.response);
      }
    });
  }

  void getMyData(String accessToken) {
    DioHelper.getData(
      url: EndPoints.getMe,
      headers: {
        'Authorization': 'Bearer $accessToken',
        'Content-Type': 'application/json'
      },
    ).then(
      (value) {
        GetMyDataModel.storeMyData(value.data);
      },
    ).catchError(
      (onError) {
        if (onError is DioError) {
          print(onError.response);
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
