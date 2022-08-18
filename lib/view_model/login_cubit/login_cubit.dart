import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'login_states.dart';

class LoginCubit extends Cubit<LoginCubitStates> {
  LoginCubit() : super(InitialAppState());
  static LoginCubit get(context) => BlocProvider.of(context);
}
