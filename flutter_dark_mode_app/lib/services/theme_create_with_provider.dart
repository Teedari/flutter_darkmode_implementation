import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CustomTheme with ChangeNotifier {
  static final darkModeString = 'isDark';
  //create a bool to hold the value if theme is dark or not
  bool isDark;

  CustomTheme({this.isDark = false});

  swithThemeMode({bool darkMode}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    isDark = darkMode;
    // if(isDark){
    //create storage to hold dark mode after restarting the device
    await prefs.setBool(darkModeString, isDark);
    // }else{}

    notifyListeners();
  }

  ThemeMode getThemeMode() => isDark ? ThemeMode.dark : ThemeMode.light;
}
