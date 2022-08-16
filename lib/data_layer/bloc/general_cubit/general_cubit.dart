import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'general_cubit_states.dart';

class GeneralCubit extends Cubit<GeneralCubitStates> {
  GeneralCubit() : super(InitialAppState());
  static GeneralCubit get(context) => BlocProvider.of(context);
}
