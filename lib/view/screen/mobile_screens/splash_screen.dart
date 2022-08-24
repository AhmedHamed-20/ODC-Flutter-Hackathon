import 'dart:async';
import 'package:flutter/material.dart';
import 'package:la_vie/model/cache/shared_preferences.dart';
import 'package:la_vie/view/constants/constants.dart';
import 'package:la_vie/view/layout/mobile_layout.dart';
import 'package:la_vie/view/screen/mobile_screens/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(const Duration(seconds: 2), () async {
      Widget startApp;

      if (await CacheHelper.getData(key: 'accessToken') != null) {
        startApp = const MobileLayout();
      } else {
        startApp = LoginScreen();
      }
      navigatePushAndRemove(context: context, navigateTO: startApp);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Center(
        child: Container(
          width: 200,
          height: 200,
          padding: const EdgeInsets.all(30),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: Theme.of(context).backgroundColor,
          ),
          child: Center(
            child: Image.asset(
              'assets/images/logo.png',
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}
