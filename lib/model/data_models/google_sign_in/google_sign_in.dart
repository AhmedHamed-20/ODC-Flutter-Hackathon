import 'package:google_sign_in/google_sign_in.dart';

class GoogleSigninModel {
  static GoogleSignInAccount? userInfo;
  static final googleSignIn = GoogleSignIn();
  static Future<GoogleSignInAccount?> signin() async {
    userInfo = await googleSignIn.signIn();
    print(userInfo);
    return googleSignIn.signIn();
  }

  static String? getUserName() {
    return userInfo?.displayName;
  }

  static String? getUserId() {
    return userInfo?.id;
  }

  static String? getUserPhoto() {
    return userInfo?.photoUrl;
  }

  static String? getUserEmail() {
    return userInfo?.email;
  }
}
