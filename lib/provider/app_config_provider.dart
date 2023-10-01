import 'package:flutter/material.dart';
import 'package:todo_app/my_theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppConfigProvider extends ChangeNotifier {
  String appLanguage = "en";
  ThemeMode appTheme = ThemeMode.light;
  void changeLanguage(String newLanguage) async {
    if (appLanguage == newLanguage) {
      return;
    }
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    appLanguage = newLanguage;
    sharedPreferences.setString("language", appLanguage);
    notifyListeners();
  }

  void changeTheme(ThemeMode newTheme) {
    if (appTheme == newTheme) {
      return;
    }
    appTheme = newTheme;
    notifyListeners();
  }

  bool isDarkMode() {
    return appTheme == MyTheme.darkMode;
  }
}
