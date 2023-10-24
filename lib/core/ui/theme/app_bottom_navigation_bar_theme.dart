import 'package:flutter/material.dart';
import 'package:upwork_client/utils/styles/colors/app_colors.dart';

abstract class AppBottomNavigationBarTheme {
  static BottomNavigationBarThemeData get lightTheme => _lightTheme();

  static BottomNavigationBarThemeData get darkTheme => _darkTheme();

  static BottomNavigationBarThemeData _lightTheme() =>
      const BottomNavigationBarThemeData(
        selectedItemColor: AppColors.green00,
        unselectedItemColor: AppColors.greenD5,
        backgroundColor: AppColors.greenD5,
        //type: BottomNavigationBarType.fixed,
      );

  static BottomNavigationBarThemeData _darkTheme() =>
      const BottomNavigationBarThemeData(
        selectedItemColor: AppColors.green00,
        unselectedItemColor: AppColors.grey65,
        backgroundColor: AppColors.black70,
        type: BottomNavigationBarType.fixed,
      );
}
