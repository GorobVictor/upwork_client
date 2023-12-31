import 'package:flutter/material.dart';

class AppColors {
  static const Color white = Color(0xFFFFFFFF);
  static const Color whiteF1 = Color(0xFFF1F1F1);
  static const Color whiteF7 = Color(0xFFF7F7F7);
  static const Color whiteEE = Color(0xFFEEEEEE);
  static const Color whiteE4 = Color(0xFFE4E4E4);
  static const Color whiteE8 = Color(0xFFE6E7E8);
  static const Color whiteD4 = Color(0xFFD1D3D4);
  static const Color whiteDE = Color(0xFFDEDEDE);
  static const Color greyB9 = Color(0xFFB9B9B9);
  static const Color grey98 = Color(0xFF939598);
  static const Color grey65 = Color(0xFF656565);
  static const Color grey4A = Color(0x1A000000);
  static const Color grey21 = Color(0xFF212121);
  static const Color grey33 = Color(0xFF333333);
  static const Color greyD9 = Color(0xFFD9D9D9);
  static const Color greyE2 = Color(0xFFE2E2E2);
  static const Color black = Color(0xFF000000);
  static const Color black70 = Color(0x70000000);
  static const Color blueF4 = Color(0xFF32C5F4);
  static const Color blueE2 = Color(0xFF42C0E2);
  static const Color blueD4 = Color(0xFF00A0D4);
  static const Color blueCC = Color(0xFF049CCC);
  static const Color blueFA = Color(0xFF3BD1FA);
  static const Color blueA1FF = Color(0xFF1FA1FF);
  static const Color blueB4 = Color(0xFF4284B4);
  static const Color blueFD = Color(0xFF567EFD);
  static const Color blue8C = Color(0xFF00518C);
  static const Color blue6F = Color(0xFF00406F);
  static const Color blue56 = Color(0xFF003256);
  static const Color blue59 = Color(0xFF013459);
  static const Color blue50 = Color(0xFF002E50);
  static const Color blue48 = Color(0xFF002A48);
  static const Color blue39 = Color(0xFF002139);
  static const Color green00 = Color(0xFF108a00);
  static const Color greenF1 = Color(0xFFf2f7f1);
  static const Color greenD5 = Color(0xFFd5e0d5);
  static const Color blueFF = Color(0xFF0E60FF);
  static const Color blue6E = Color(0xFF00406E);
  static const Color red = Color(0xFFEE3023);
  static const Color green = Color(0xFF1BD80B);
  static const Color orange4A = Color(0xFFFF964A);
  static const Color blue3B4 = Color(0xFF6D83B4);
  static const Color blueE0 = Color(0xFFB5C6E0);
  static const Color blue62 = Color(0xFF3B4662);
  static const Color blueEF = Color(0xFF4087EF);
  static const Color blue58 = Color(0xFF333D58);
  static const Color blueE7 = Color(0xFF667DE7);
  static const Color blueDFF = Color(0xFF6FCDFF);
  static const Color blueEE0 = Color(0xFF0FCEE0);
  static const Color grey8e = Color(0xFF757C8E);
  static const Color purpleA2 = Color(0xFF764CA2);
  static const Color turquoiseB8 = Color(0xFF81F8B8);
  static const Color pink9B = Color(0xFFFF9A9B);
  static const Color peachC2 = Color(0xFFF8CEC2);
  static const Color purpleDF = Color(0xFF8546DF);



  static const Color green110 = Colors.lightGreen;
  static const Color greenA64 = Colors.lightGreenAccent;
  static const Color yellow = Colors.yellowAccent;
  static const Color orange = Colors.orangeAccent;
  static const Color red505 = Colors.redAccent;


  static Color getColor(double? score){
    switch(score){
      case 5:
        return green110;
      case 4:
        return greenA64;
      case 3:
        return yellow;
      case 2:
        return orange;
      case 1:
        return red505;
      default:
        return red505;
    }
  }
}
