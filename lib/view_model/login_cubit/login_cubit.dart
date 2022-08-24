import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie/model/cache/shared_preferences.dart';
import 'package:la_vie/model/data_models/get_my_data_model/get_my_data_model.dart';
import 'package:la_vie/model/data_models/login_model/user_login_model.dart';
import 'package:la_vie/model/data_models/login_model/user_signup_model.dart';
import 'package:la_vie/model/network/dio/dio.dart';
import 'package:la_vie/model/network/end_points/end_points.dart';
import 'package:la_vie/view/constants/constants.dart';
import 'package:la_vie/view/constants/controllers.dart';
import 'package:la_vie/view_model/general_cubit/general_cubit.dart';

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
    required BuildContext context,
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
        CacheHelper.setData(
            key: 'refreshToken', value: LoginModel.refreshToken);

        CacheHelper.setData(key: 'accessToken', value: LoginModel.accessToken);
        TextFormFieldControllers.emailLoginController.clear();
        TextFormFieldControllers.passwordLoginController.clear();
        await getMyData(LoginModel.accessToken!).then((value) {
          flutterToast(
              msg: 'Welcome (:',
              backgroundColor: AppColors.toastSuccess,
              textColor: AppColors.white);
        });
        accessToken = CacheHelper.getData(key: 'accessToken');
        //   await GeneralCubit.get(context).getAllProudctsData(accessToken);
        emit(LoginDataGetSuccess());
      },
    ).catchError(
      (error) {
        if (error is DioError) {
          flutterToast(
              msg: error.response?.statusMessage ?? 'error',
              backgroundColor: AppColors.toastError,
              textColor: AppColors.white);
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
    required BuildContext context,
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
      CacheHelper.setData(key: 'refreshToken', value: SignUpModel.refreshToken);
      accessToken = CacheHelper.getData(key: 'accessToken');
      await getMyData(SignUpModel.accessToken!);
      TextFormFieldControllers.emailSignUpController.clear();
      TextFormFieldControllers.firstNameSignUpController.clear();
      TextFormFieldControllers.lastNameSignUpController.clear();
      TextFormFieldControllers.passwordSignUpController.clear();
      TextFormFieldControllers.passwordConfirmSignUpController.clear();
      emit(SignUpDataGetSuccess());
    }).catchError((onError) {
      if (onError is DioError) {
        flutterToast(
            msg: onError.response?.statusMessage ?? 'error',
            backgroundColor: AppColors.toastError,
            textColor: AppColors.white);
        print(onError.response);
        emit(SignUpDataGetError());
      }
    });
  }

  Future signInWithGoogle({
    required String? id,
    required String? photoUrl,
    required String? name,
    required String? email,
  }) async {
    return await DioHelper.postData(
      url: EndPoints.signInWithGoogle,
      data: {
        "id": id,
        "email": email,
        "firstName": name,
        "lastName": name,
        "picture": photoUrl ??
            'https://upload.wikimedia.org/wikipedia/commons/1/14/No_Image_Available.jpg?20200913095930',
      },
      headers: {'Content-Type': 'application/json'},
    ).then((value) {
      print(value);
    }).catchError((onError) {
      if (onError is DioError) {
        flutterToast(
            msg: onError.response?.statusMessage ?? 'error',
            backgroundColor: AppColors.toastError,
            textColor: AppColors.white);
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
        dataGetSuccess = true;
        GetMyDataModel.storeMyData(value.data);
        emit(UserDataGetSuccess());
      },
    ).catchError(
      (onError) {
        if (onError is DioError) {
          dataGetSuccess = false;
          flutterToast(
              msg: onError.response?.statusMessage ?? 'error',
              backgroundColor: AppColors.toastError,
              textColor: AppColors.white);
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

  String? validatePassword(String? value) {
    RegExp regex = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$');
    if (value == null) {
      return 'Please enter password';
    } else {
      if (!regex.hasMatch(value)) {
        return 'should contain one(upper case-lower case - digit) Must be at least 8 characters in length ';
      } else {
        return null;
      }
    }
  }

  String? validateEmail(String? value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = RegExp(pattern.toString());

    if (value == null) {
      return 'Please enter Email';
    } else if (!(regex.hasMatch(value))) {
      return "Invalid Email";
    } else {
      return null;
    }
  }

  String? validatePassowrdConfirm(String? value, String password) {
    if (value == null) {
      return 'Please enter password';
    } else if (value != password) {
      return "Invalid Password";
    } else {
      return null;
    }
  }
}
