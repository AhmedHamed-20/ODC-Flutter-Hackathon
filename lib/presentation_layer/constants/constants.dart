import 'package:flutter/material.dart';
import 'package:la_vie/presentation_layer/screen/web_screens/about_screen_web.dart';
import 'package:la_vie/presentation_layer/screen/web_screens/blog_screen_web.dart';
import 'package:la_vie/presentation_layer/screen/web_screens/community_screen_web.dart';
import 'package:la_vie/presentation_layer/screen/web_screens/home_screen_web.dart';
import 'package:la_vie/presentation_layer/screen/web_screens/shop_screen_web.dart';

class AppFontSize {
  static double s10 = 10;
  static double s12 = 12;
  static double s14 = 14;
  static double s16 = 16;
  static double s18 = 18;
  static double s20 = 20;
  static double s22 = 22;
  static double s36 = 36;
  static double s30 = 30;
}

class AppPadding {
  static double p8 = 10;
  static double p10 = 10;
  static double p12 = 12;
  static double p14 = 14;
  static double p16 = 16;
  static double p18 = 18;
  static double p20 = 20;
  static double p22 = 22;
  static double p25 = 25;
  static double p30 = 30;
}

class AppRadius {
  static double r5 = 5;
  static double r8 = 10;
  static double r10 = 10;
  static double r12 = 12;
  static double r14 = 14;
  static double r16 = 16;
  static double r18 = 18;
  static double r20 = 20;
  static double r22 = 22;
}

class AppElevation {
  static double eL0 = 0;
  static double eL2 = 2;
  static double eL4 = 4;
  static double eL6 = 6;
  static double eL8 = 8;
  static double eL10 = 10;
  static double eL12 = 12;
  static double eL14 = 14;
  static double eL16 = 16;
  static double eL18 = 18;
  static double el20 = 20;
  static double eL22 = 22;
}

class AppHeight {
  static double h1 = 1;
  static double h2 = 2;
  static double h4 = 4;
  static double h6 = 6;
  static double h8 = 8;
  static double h10 = 10;
  static double h12 = 12;
  static double h14 = 14;
  static double h16 = 16;
  static double h18 = 18;
  static double h20 = 20;
  static double h22 = 22;
  static double h46 = 46.5;
  static double h70 = 70;

  static double h100 = 100;
}

class AppWidth {
  static double w2 = 2;
  static double w4 = 4;
  static double w6 = 6;
  static double w8 = 8;
  static double w10 = 10;
  static double w12 = 12;
  static double w14 = 14;
  static double w16 = 16;
  static double w18 = 18;
  static double w20 = 20;
  static double w22 = 22;
  static double w44 = 44;
  static double w100 = 100;
}

class AppColors {
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
}

List<Map<String, Widget>> navBarList = [
  {'Home': HomeScreenWeb()},
  {'Shope': ShopScreenWeb()},
  {'Blog': BlogScreenWeb()},
  {'About': AboutScreenWeb()},
  {'Community': CommunityScreenWeb()}
];
