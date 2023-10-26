import 'package:flutter/material.dart';
import 'package:upwork_client/utils/styles/colors/app_colors.dart';

abstract class AppBottomSheetTheme {
  static BottomSheetThemeData get lightTheme => _lightTheme();

  static BottomSheetThemeData get darkTheme => _darkTheme();

  static BottomSheetThemeData _lightTheme() => const BottomSheetThemeData(
      backgroundColor: AppColors.blue39,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(35)),
      ));

  static BottomSheetThemeData _darkTheme() => lightTheme.copyWith(
        backgroundColor: AppColors.blue56,
      );
}
