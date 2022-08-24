import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class FacebookSignInModel {
  static AccessToken? accessTokenFacebook;
  static Map<String, dynamic>? userDatafacebook;
  static Future signinWithFaceBook() async {
    final LoginResult result = await FacebookAuth.instance.login();
    if (result.status == LoginStatus.success) {
      accessTokenFacebook = result.accessToken;
      // get the user data
      // by default we get the userId, email,name and picture

      final userData = await FacebookAuth.instance.getUserData();
      // final userData = await FacebookAuth.instance.getUserData(fields: "email,birthday,friends,gender,link");
      userDatafacebook = userData;
      print(userData);
    } else {
      print(result.status);
      print(result.message);
    }
    return result;
  }
}
