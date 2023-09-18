import 'package:flutter/material.dart';

class MyTheme{
  static Color primaryColor=Color(0xff5D9CEC);
  static Color whiteColor=Color(0xffFFFFFF);
  static Color greenColor=Color(0xff61E757);
  static Color redColor=Color(0xffEC4B4B);
  static Color blackColor=Color(0xff303030);
  static Color blackColorDark=Color(0xff141922);
  static ThemeData lightMode=ThemeData(
    scaffoldBackgroundColor: whiteColor,
    primaryColor:primaryColor,
      appBarTheme: AppBarTheme(
          backgroundColor: primaryColor
      ),
      textTheme: TextTheme(
        titleLarge: TextStyle(
          fontSize: 20,
          color: whiteColor,
          fontWeight: FontWeight.w700,
        ),
        titleMedium: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w700,
          color: blackColor,
        ),
        titleSmall: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w700,
          color: primaryColor,
        ),
      ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: primaryColor,
      showUnselectedLabels: false,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: primaryColor,
      iconSize: 30,
        shape: RoundedRectangleBorder(
            side: BorderSide(width: 3, color: whiteColor
            ),
            borderRadius: BorderRadius.circular(100))
    ),


  );
  static ThemeData darkMode=ThemeData(
    scaffoldBackgroundColor: blackColorDark,
    appBarTheme: AppBarTheme(
        backgroundColor: primaryColor
    ),
    primaryColor:primaryColor,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: primaryColor,
      showUnselectedLabels: false,
      unselectedItemColor: whiteColor,
      backgroundColor: blackColorDark,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: primaryColor,
      iconSize: 30,
        shape: RoundedRectangleBorder(
            side: BorderSide(width: 3, color: blackColorDark,

            ),
            borderRadius: BorderRadius.circular(100))
    ),

  );


}