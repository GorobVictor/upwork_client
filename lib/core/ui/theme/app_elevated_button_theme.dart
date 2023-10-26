import 'package:flutter/material.dart';
import 'package:upwork_client/utils/styles/colors/app_colors.dart';

abstract class AppElevatedButtonTheme {
  static ElevatedButtonThemeData get lightTheme => _lightTheme();

  static ElevatedButtonThemeData get darkTheme => _darkTheme();

  static ElevatedButtonThemeData _lightTheme() => ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          disabledBackgroundColor: AppColors.whiteD4,
          disabledForegroundColor: AppColors.grey98,
          backgroundColor: AppColors.green00,
          foregroundColor: AppColors.white, //textColor
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          textStyle: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
          elevation: 0,
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
        ),
      );

  static ElevatedButtonThemeData _darkTheme() => ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          disabledBackgroundColor: AppColors.blue50,
          disabledForegroundColor: AppColors.blueB4,
          backgroundColor: AppColors.black70,
          foregroundColor: AppColors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          textStyle: const TextStyle(fontSize: 14),
          elevation: 0,
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
        ),
      );
}
