
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../ui/home_view.dart';
import '../ui/login_view.dart';

class AppManager {
  static late SharedPreferences _preferences;
  static Future<void> initAppData() async {
    _preferences = await SharedPreferences.getInstance();
  }

  static bool isUserLoggedIn(){
    return _preferences.getBool('logged-in') ?? false;
  }

  static bool isLightMode(){
    return _preferences.getBool('light-mode') ?? true;
  }

  static Future<void> setLightMode(bool value) async {
    await _preferences.setBool('light-mode', value);
  }

  static Widget getView(){
    return isUserLoggedIn() ? HomeView() : LoginView();
  }

  static Future<void> setLoggedIn(bool value) async {
    await _preferences.setBool('logged-in', value);
  }

}



