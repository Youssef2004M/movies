import 'package:flutter/material.dart';
import 'package:movies_app/app_colors/colors.dart';

abstract class MyTheme {
  static ThemeData themeData = ThemeData(
    primaryColor: AppColors.yellow,
    appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(color: AppColors.yellow),
      backgroundColor: AppColors.black,
      centerTitle: true,
      titleTextStyle: TextStyle(
          fontWeight: FontWeight.w400, fontSize: 16, color: AppColors.yellow),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          padding: EdgeInsets.all(16),
          backgroundColor: AppColors.yellow,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(15)))),
    ),
    scaffoldBackgroundColor: AppColors.black,
    textTheme: TextTheme(
      titleSmall: TextStyle(
          fontWeight: FontWeight.w400, fontSize: 16, color: AppColors.yellow),
      titleMedium: TextStyle(
          fontWeight: FontWeight.w500, fontSize: 20, color: AppColors.yellow),
      titleLarge: TextStyle(
          fontWeight: FontWeight.bold, fontSize: 24, color: AppColors.yellow),
      bodySmall: TextStyle(
          fontWeight: FontWeight.w400, fontSize: 16, color: Colors.white),
      bodyMedium: TextStyle(
          fontWeight: FontWeight.w600, fontSize: 20, color: Colors.white),
      bodyLarge: TextStyle(
          fontWeight: FontWeight.bold, fontSize: 24, color: Colors.white),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      backgroundColor: AppColors.grey,
      selectedItemColor: AppColors.yellow,
      unselectedItemColor: Colors.white,
    )
  );

  static ThemeData getThemeData() {
    return themeData;
  }
}
