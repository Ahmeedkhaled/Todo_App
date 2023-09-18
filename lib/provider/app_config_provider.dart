import 'package:flutter/material.dart';
import 'package:todo_app/my_theme.dart';

class AppConfigProvider extends ChangeNotifier{
  String appLanguage="en";
  ThemeMode appTheme=ThemeMode.light;

  void changeLanguage(String newLanguage){
    if(appLanguage==newLanguage){
      return;
    }
    appLanguage=newLanguage;
    notifyListeners();
  }
  void changeTheme(ThemeMode newTheme){
    if(appTheme==newTheme){
      return;
    }
    appTheme=newTheme;
    notifyListeners();
  }
  bool isDarkMode(){
  return  appTheme==MyTheme.darkMode;
  }
}