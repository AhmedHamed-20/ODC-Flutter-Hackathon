import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie/model/data_models/get_my_data_model/get_my_data_model.dart';
import 'package:la_vie/model/network/dio/dio.dart';
import 'package:la_vie/model/network/end_points/end_points.dart';
import 'package:la_vie/view_model/user_profile_cubit/user_profile_cubit_states.dart';

class UserProfileCubit extends Cubit<UserProfileStates> {
  UserProfileCubit() : super(InitialAppState());
  static UserProfileCubit get(context) => BlocProvider.of(context);

  Future updateMyData({
    required String accessToken,
    String? email,
    String? firstName,
    String? lastName,
  }) async {
    print(firstName);
    print(lastName);

    return await DioHelper.patchData(url: EndPoints.updateMyData, headers: {
      'Authorization': 'Bearer $accessToken',
      'Content-Type': 'application/json',
    }, data: {
      'firstName': firstName ?? GetMyDataModel.firstName,
      'lastName': lastName ?? GetMyDataModel.lastName,
      'email': email ?? GetMyDataModel.email,
    }).then((value) {
      print(value.data);
      GetMyDataModel.storeMyData(value.data);
      emit(DataChangedSuccess());
    }).catchError((onError) {
      if (onError is DioError) {
        print(onError.response);
        emit(DataChangedError());
      }
    });
  }
}
