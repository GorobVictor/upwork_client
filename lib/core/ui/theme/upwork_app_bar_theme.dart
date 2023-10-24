import 'package:flutter/material.dart';
import 'package:upwork_client/utils/styles/colors/app_colors.dart';

abstract class UpworkAppBarTheme {
  static AppBarTheme get lightTheme => _lightTheme();

  static AppBarTheme get darkTheme => _darkTheme();

  static AppBarTheme _lightTheme() => const AppBarTheme(
    elevation: 0,
        iconTheme: IconThemeData(color: AppColors.white),
        backgroundColor: AppColors.green00,
        titleTextStyle: TextStyle(
          color: AppColors.white,
        ),
      );

  static AppBarTheme _darkTheme() => lightTheme.copyWith(
        backgroundColor: AppColors.black70,
      );
}
