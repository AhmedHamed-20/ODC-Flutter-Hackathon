import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:la_vie/model/cache/shared_preferences.dart';

import '../screen/web_screens/about_screen_web.dart';
import '../screen/web_screens/blog_screen_web.dart';
import '../screen/web_screens/community_screen_web.dart';
import '../screen/web_screens/home_screen_web.dart';
import '../screen/web_screens/shop_screen_web.dart';

String accessToken = CacheHelper.getData(key: 'accessToken') ?? '';
String refreshToken = CacheHelper.getData(key: 'refreshToken') ?? '';
String timeOfNextExam = CacheHelper.getData(key: 'timeOfNextExam') ?? '';

class AppFontSize {
  static const double s10 = 10;
  static const double s12 = 12;
  static const double s14 = 14;
  static const double s16 = 16;
  static const double s18 = 18;
  static const double s20 = 20;
  static const double s22 = 22;
  static const double s36 = 36;
  static const double s30 = 30;
}

class AppPadding {
  static const double p8 = 10;
  static const double p10 = 10;
  static const double p12 = 12;
  static const double p14 = 14;
  static const double p16 = 16;
  static const double p18 = 18;
  static const double p20 = 20;
  static const double p22 = 22;
  static const double p25 = 25;
  static const double p30 = 30;
  static const double p6 = 6;
}

class AppRadius {
  static const double r5 = 5;
  static const double r8 = 10;
  static const double r10 = 10;
  static const double r12 = 12;
  static const double r14 = 14;
  static const double r16 = 16;
  static const double r18 = 18;
  static const double r20 = 20;
  static const double r22 = 22;
  static const double r40 = 40;
  static const double r70 = 70;
}

class AppElevation {
  static const double eL0 = 0;
  static const double eL2 = 2;
  static const double eL4 = 4;
  static const double eL6 = 6;
  static const double eL8 = 8;
  static const double eL10 = 10;
  static const double eL12 = 12;
  static const double eL14 = 14;
  static const double eL16 = 16;
  static const double eL18 = 18;
  static const double el20 = 20;
  static const double eL22 = 22;
}

class AppHeight {
  static const double h1 = 1;
  static const double h2 = 2;
  static const double h4 = 4;
  static const double h6 = 6;
  static const double h8 = 8;
  static const double h10 = 10;
  static const double h12 = 12;
  static const double h14 = 14;
  static const double h16 = 16;
  static const double h18 = 18;
  static const double h20 = 20;

  static const double h22 = 22;

  static const double h28 = 28;

  static const double h31 = 31;

  static const double h46 = 46.5;
  static const double h70 = 70;
  static const double h80 = 80;
  static const double h100 = 100;
  static const double h130 = 130;
}

class AppWidth {
  static const double w2 = 2;
  static const double w4 = 4;
  static const double w6 = 6;
  static const double w8 = 8;
  static const double w10 = 10;
  static const double w12 = 12;
  static const double w14 = 14;
  static const double w16 = 16;
  static const double w18 = 18;
  static const double w20 = 20;
  static const double w22 = 22;
  static const double w44 = 44;
  static const double w60 = 60;
  static const double w65 = 65;

  static const double w100 = 100;
  static const double w130 = 130;
}

class AppColors {
  static Color white = Colors.white;
  static Color black = Colors.black;
  static Color toastSuccess = Colors.green;
  static Color toastWarning = Colors.yellow;
  static Color toastError = Colors.red;
  static Color navBarBackgroundColor = Colors.white;
  static Color scaffoldBackgroundColor = Colors.white;
  static Color primaryColor = const Color(0xff1ABC00);
  static Color transparentColor = Colors.transparent;
  static Color buttonColor = const Color(0xff1ABC00);
  static Color textColorButton = Colors.white;
  static Color titleTextColor = Colors.black;
  static Color subtitleTextColor = const Color(0xff6F6F6F);
  static Color iconColorBlack = Colors.black;
  static Color iconColorWhite = Colors.white;
  static Color iconColorGrey = const Color(0xff6F6F6F);
  static Color textFieldBorderColorGrey = const Color(0xff6F6F6F);
  static Color dividerColorGrey = const Color(0xff979797);
  static Color textFormFieldFillColor = const Color(0xffF8F8F8);
  static Color starsCircleBorder = const Color(0xffFFCA10);
  static Color changeNameGreenColor = const Color(0xff1D592C);
}

void navigatePushTo(
    {required Widget navigateTO, required BuildContext context}) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (BuildContext context) {
        return navigateTO;
      },
    ),
  );
}

void flutterToast({
  required String msg,
  required Color backgroundColor,
  required Color textColor,
  Toast? length = Toast.LENGTH_SHORT,
}) {
  Fluttertoast.showToast(
    toastLength: length,
    msg: msg,
    backgroundColor: backgroundColor,
    textColor: textColor,
  );
}

void navigatePushAndRemove(
    {required Widget navigateTO, required BuildContext context}) {
  Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(
      builder: (BuildContext context) {
        return navigateTO;
      },
    ),
    (route) => false,
  );
}

List<Map<String, Widget>> navBarList = [
  {'Home': HomeScreenWeb()},
  {'Shope': ShopScreenWeb()},
  {'Blog': BlogScreenWeb()},
  {'About': AboutScreenWeb()},
  {'Community': CommunityScreenWeb()}
];
Widget appBarWidgets(BuildContext context, int index) {
  List<Widget> appBarWidgetsdata = [
    Image.asset('assets/images/logo.png'),
    const SizedBox(),
    Text(
      'Notification',
      style: Theme.of(context).textTheme.titleLarge,
    ),
    const SizedBox(),
  ];
  return appBarWidgetsdata[index];
}
