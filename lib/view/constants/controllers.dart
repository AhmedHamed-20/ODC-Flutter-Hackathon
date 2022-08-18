import 'package:flutter/material.dart';

class TextFormFieldControllers {
  static TextEditingController emailLoginController = TextEditingController();
  static TextEditingController passwordLoginController =
      TextEditingController();

  static TextEditingController emailSignUpController = TextEditingController();
  static TextEditingController passwordSignUpController =
      TextEditingController();
  static TextEditingController passwordConfirmSignUpController =
      TextEditingController();
  static TextEditingController firstNameConfirmSignUpController =
      TextEditingController();
  static TextEditingController lastNameConfirmSignUpController =
      TextEditingController();
  static TextEditingController homeSearchController = TextEditingController();
  static TextEditingController forumsSearchController = TextEditingController();
  static TextEditingController titlePostController = TextEditingController();
  static TextEditingController descriptionPostController =
      TextEditingController();
}

class TabBarController {
  static TabController? tabController;
  static TabController? tabControllerWeb;
}
