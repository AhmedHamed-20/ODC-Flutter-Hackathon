abstract class LoginCubitStates {}

class InitialAppState extends LoginCubitStates {}

class LoginLoadingData extends LoginCubitStates {}

class LoginDataGetSuccess extends LoginCubitStates {}

class LoginDataGetError extends LoginCubitStates {}

class SignUpLoadingData extends LoginCubitStates {}

class SignUpDataGetSuccess extends LoginCubitStates {}

class SignUpDataGetError extends LoginCubitStates {}

class UserDataGetSuccess extends LoginCubitStates {}

class UserDataGetError extends LoginCubitStates {}

class ChangePasswordObScureState extends LoginCubitStates {}
