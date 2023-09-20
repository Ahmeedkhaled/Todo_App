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
          color: blackColor,
          fontWeight: FontWeight.w700,
        ),
        titleMedium: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w700,
          color: whiteColor,
        ),
        titleSmall: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w700,
          color: primaryColor,
        ),
        bodySmall: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.w700,
          color: blackColor,
        ),
      ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: primaryColor,
      showUnselectedLabels: false,
      unselectedItemColor: blackColor,
      backgroundColor: blackColorDark,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: primaryColor,
      iconSize: 30,
        shape: RoundedRectangleBorder(
            side: BorderSide(width: 3, color: whiteColor
            ),
            borderRadius: BorderRadius.circular(100))
    ),
    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: whiteColor
    ),
      bottomAppBarTheme: BottomAppBarTheme(
        color: whiteColor,


  ));
  static ThemeData darkMode=ThemeData(

      textTheme: TextTheme(
        titleLarge: TextStyle(
          fontSize: 20,
          color: blackColor,
          fontWeight: FontWeight.w700,
        ),
        titleMedium: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w700,
          color: whiteColor,
        ),
        titleSmall: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w700,
          color: primaryColor,
        ),
        bodySmall: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.w700,
          color: blackColor,
        ),
      ),

      scaffoldBackgroundColor: blackColorDark,
    appBarTheme: AppBarTheme(
        backgroundColor: primaryColor
    ),
    primaryColor:primaryColor,
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: primaryColor,
      iconSize: 30,
        shape: RoundedRectangleBorder(
            side: BorderSide(width: 3, color: blackColorDark,

            ),
            borderRadius: BorderRadius.circular(100))
    ),
    bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: whiteColor
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: primaryColor,
      showUnselectedLabels: false,
      unselectedItemColor: whiteColor,
      backgroundColor: blackColorDark,
    ),
    bottomAppBarTheme: BottomAppBarTheme(
      color: blackColorDark,
    )



  );


}