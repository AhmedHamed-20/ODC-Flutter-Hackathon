class LoginModel {
  static String? accessToken;
  static String? refreshToken;
  static String? userId;

  static void storeSignUpData(Map<String, dynamic> signUpData) {
    accessToken = signUpData['data']['accessToken'];
    refreshToken = signUpData['data']['refreshToken'];
    userId = signUpData['data']['user']['userId'];
  }
}
