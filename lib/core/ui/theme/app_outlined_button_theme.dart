import 'package:flutter/material.dart';
import 'package:upwork_client/utils/styles/colors/app_colors.dart';

abstract class AppOutlinedButtonTheme {
  static OutlinedButtonThemeData get lightTheme => _lightTheme();

  static OutlinedButtonThemeData get darkTheme => _darkTheme();

  static OutlinedButtonThemeData _lightTheme() => OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          backgroundColor: AppColors.white,
          foregroundColor: AppColors.green00,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          side: const BorderSide(color: AppColors.green00, width: 2),
          textStyle: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
          elevation: 0,
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
        ),
      );

  static OutlinedButtonThemeData _darkTheme() => OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
            backgroundColor: AppColors.blue56,
            foregroundColor: AppColors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
            side: const BorderSide(color: AppColors.blue8C),
            textStyle: const TextStyle(fontSize: 14),
            elevation: 0,
            padding: const EdgeInsets.symmetric(vertical: 16)),
      );
}
