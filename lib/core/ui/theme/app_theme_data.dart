import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:upwork_client/core/core.dart';
import 'package:upwork_client/utils/utils.dart';

abstract class AppThemeData {
  static ThemeData get lightTheme => _lightTheme();

  static ThemeData get darkTheme => _darkTheme();

  static ThemeData _lightTheme() => ThemeData(
        pageTransitionsTheme: const PageTransitionsTheme(
          builders: {
            TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
            TargetPlatform.iOS: FadeUpwardsPageTransitionsBuilder(),
          },
        ),
        brightness: Brightness.light,
        appBarTheme: UpworkAppBarTheme.lightTheme,
        scaffoldBackgroundColor: AppColors.whiteF7,
        elevatedButtonTheme: AppElevatedButtonTheme.lightTheme,
        textTheme: AppTextTheme.lightTheme,
        textButtonTheme: AppTextButtonTheme.lightTheme,
        inputDecorationTheme: AppInputDecorationTheme.lightTheme,
        outlinedButtonTheme: AppOutlinedButtonTheme.lightTheme,
        bottomSheetTheme: AppBottomSheetTheme.lightTheme,
        progressIndicatorTheme: AppProgressIndicatorTheme.lightTheme,
        bottomNavigationBarTheme: AppBottomNavigationBarTheme.lightTheme,
      );

  static ThemeData _darkTheme() => lightTheme.copyWith(
        brightness: Brightness.dark,
        appBarTheme: UpworkAppBarTheme.darkTheme,
        scaffoldBackgroundColor: AppColors.grey33,
        elevatedButtonTheme: AppElevatedButtonTheme.darkTheme,
        textTheme: AppTextTheme.darkTheme,
        textButtonTheme: AppTextButtonTheme.darkTheme,
        inputDecorationTheme: AppInputDecorationTheme.darkTheme,
        outlinedButtonTheme: AppOutlinedButtonTheme.darkTheme,
        bottomSheetTheme: AppBottomSheetTheme.darkTheme,
        progressIndicatorTheme: AppProgressIndicatorTheme.darkTheme,
        bottomNavigationBarTheme: AppBottomNavigationBarTheme.darkTheme,
      );
}

extension ImageTheme on ThemeData {
  SvgPicture imageWithThemeMode(String imageName) {
    const lightThemePath = 'assets/images';
    const darkThemePath = 'assets/images/dark';
    final path = brightness == Brightness.dark ? darkThemePath : lightThemePath;
    return SvgPicture.asset('$path/$imageName');
  }
}
