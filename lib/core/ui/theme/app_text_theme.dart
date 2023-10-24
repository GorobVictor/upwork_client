import 'package:flutter/material.dart';
import 'package:upwork_client/utils/utils.dart';

abstract class AppTextTheme {
  static TextTheme get lightTheme => _lightTheme();

  static TextTheme get darkTheme => _darkTheme();

  static TextTheme _lightTheme() => const TextTheme(
        bodyLarge: TextStyle(
          color: AppColors.grey65,
        ),
        bodyMedium: TextStyle(
          color: AppColors.black,
        ),
        bodySmall: TextStyle(
          color: AppColors.grey65,
        ),
        titleSmall: TextStyle(
          color: AppColors.blueF4,
        ),
        titleLarge: TextStyle(
          color: AppColors.black,
        ),
        // Text field body
        titleMedium: TextStyle(
          color: AppColors.blueF4,
        ),
        // Text field label, Password validation item text
        displaySmall: TextStyle(
          color: AppColors.grey98,
        ),
        displayMedium: TextStyle(
          color: AppColors.black,
        ),
        // Drawer
        displayLarge: TextStyle(
          color: AppColors.white,
        ),
        headlineSmall: TextStyle(
          color: AppColors.blueF4,
        ),
        headlineLarge: TextStyle(
          color: AppColors.black,
        ),
      );

  static TextTheme _darkTheme() => const TextTheme(
        bodyLarge: TextStyle(
          color: AppColors.grey65,
        ),
        bodyMedium: TextStyle(
          color: AppColors.greyB9,
        ),
        bodySmall: TextStyle(
          color: AppColors.white,
        ),
        titleSmall: TextStyle(
          color: AppColors.blueF4,
        ),
        titleLarge: TextStyle(
          color: AppColors.white,
        ),
        // Text field body
        titleMedium: TextStyle(
          color: AppColors.blueF4,
        ),
        // Text field label, Password validation item text
        displaySmall: TextStyle(
          color: AppColors.blueB4,
        ),
        displayMedium: TextStyle(
          color: AppColors.blueB4,
        ),
        displayLarge: TextStyle(
          color: AppColors.black,
        ),
        headlineSmall: TextStyle(
          color: AppColors.blueB4,
        ),
        headlineLarge: TextStyle(
          color: AppColors.white,
        ),
      );
}
