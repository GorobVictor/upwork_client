import 'package:flutter/material.dart';
import 'package:upwork_client/utils/styles/colors/app_colors.dart';

abstract class AppInputDecorationTheme {
  static InputDecorationTheme get lightTheme => _lightTheme();

  static InputDecorationTheme get darkTheme => _darkTheme();

  static InputDecorationTheme _lightTheme() => InputDecorationTheme(
        contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 28),
        errorBorder: _buildBorder(),
        focusedErrorBorder: _buildBorder(),
        focusedBorder: _buildBorder(),
        enabledBorder: _buildBorder(),
        hintStyle: _buildTextStyle(AppColors.grey98),
        prefixStyle: _buildTextStyle(AppColors.grey98),
        errorStyle: _buildTextStyle(AppColors.red),
        counterStyle: _buildTextStyle(AppColors.grey98),
        suffixIconColor: AppColors.grey98,
        prefixIconColor: AppColors.grey98,
        filled: true,
        fillColor: AppColors.white,
      );

  static InputDecorationTheme _darkTheme() => InputDecorationTheme(
        contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 28),
        errorBorder: _buildBorder(),
        focusedErrorBorder: _buildBorder(),
        focusedBorder: _buildBorder(),
        enabledBorder: _buildBorder(),
        hintStyle: _buildTextStyle(AppColors.white),
        prefixStyle: _buildTextStyle(AppColors.white),
        errorStyle: _buildTextStyle(AppColors.red),
        counterStyle: _buildTextStyle(AppColors.white),
        suffixIconColor: AppColors.grey98,
        prefixIconColor: AppColors.grey98,
        filled: true,
        fillColor: AppColors.blue56,
      );

  static OutlineInputBorder _buildBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: const BorderSide(
        color: Colors.transparent,
      ),
    );
  }

  static TextStyle _buildTextStyle(Color textColor) {
    return TextStyle(color: textColor, fontSize: 14);
  }
}
