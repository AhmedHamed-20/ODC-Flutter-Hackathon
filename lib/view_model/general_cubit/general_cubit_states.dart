import 'package:la_vie/view_model/general_cubit/general_cubit.dart';

abstract class GeneralCubitStates {}

class InitialAppState extends GeneralCubitStates {}

class ChangeBottomNavIndex extends GeneralCubitStates {}

class ChangeBlogsTabIndex extends GeneralCubitStates {}

class BlogsDataGetSuccess extends GeneralCubitStates {}

class BlogsDataGetError extends GeneralCubitStates {}

class BlogsIntState extends GeneralCubitStates {}

class LoadBlogsData extends GeneralCubitStates {}

class UserDataGetSuccess extends GeneralCubitStates {}

class UserDataGetError extends GeneralCubitStates {}
