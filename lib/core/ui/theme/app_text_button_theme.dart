import 'package:flutter/material.dart';
import 'package:upwork_client/utils/utils.dart';

abstract class AppTextButtonTheme {
  static TextButtonThemeData get lightTheme => _lightTheme();

  static TextButtonThemeData get darkTheme => _darkTheme();

  static TextButtonThemeData _lightTheme() => TextButtonThemeData(
        style: TextButton.styleFrom(
          backgroundColor: AppColors.white,
          foregroundColor: AppColors.blueF4,
          textStyle: const TextStyle(fontSize: 12),
          side: const BorderSide(color: Colors.transparent),
        ),
      );

  static TextButtonThemeData _darkTheme() => TextButtonThemeData(
        style: TextButton.styleFrom(
          backgroundColor: AppColors.blue39,
          foregroundColor: AppColors.blueF4,
          textStyle: const TextStyle(fontSize: 12),
          side: const BorderSide(
            color: AppColors.blue39,
          ),
        ),
      );
}
