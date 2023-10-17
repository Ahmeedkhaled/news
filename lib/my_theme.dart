import 'package:flutter/material.dart';

class MyTheme{
  static Color primaryColor=Color(0xff39A552);
  static Color whiteColor=Color(0xffFFFFFF);
  static Color navyBlueColor=Color(0xff4F5A69);
  static Color blackColor=Color(0xff303030);

  static ThemeData lightMode=ThemeData(
    primaryColor: primaryColor,
    appBarTheme: AppBarTheme(
      backgroundColor: primaryColor,
      centerTitle: true,
      shape: UnderlineInputBorder(
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(45),
          bottomLeft: Radius.circular(45),
        ),
      ),
      elevation: 0,
      toolbarHeight: 80,
    ),
    drawerTheme: DrawerThemeData(
      width: 280,
    ),
    textTheme: TextTheme(
      titleSmall: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w400,
        color: whiteColor,

      ),
      titleMedium: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w700,
        color: blackColor,

      ),
      titleLarge: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w400,
        color: whiteColor,

      ),
      bodySmall: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w400,
        color: primaryColor,

      ),

    ),

  );
}