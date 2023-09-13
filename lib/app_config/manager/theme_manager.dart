import 'package:flutter/material.dart';
import 'package:pay_me_mobile/app_config/manager/font_manager.dart';

import 'font_style_manager.dart';

class AppColors {
  static const Color lightBlack = Color(0xFF000000);
  static const Color deepWhite = Color(0xFFFFFCFC);
  static const Color lightGreen = Color.fromRGBO(43, 96, 110, 1);
  static const Color lightGrey = Color.fromRGBO(0, 0, 0, 0.6);
  static const Color lightBlue = Color.fromRGBO(240, 251, 254, 1);
  static const Color pureWhite = Color(0xFFFFFFFF);
  static const Color darkWhite = Color.fromRGBO(139, 134, 134, 0.5);
  static const Color errorRed =  Color(0xFFDF1414);
  static const Color brightGreen =  Color.fromRGBO(19, 232, 79, 1);
  static const Color dullOrange =  Color.fromRGBO(232, 211, 19, 1);
}

ThemeData _appTheme = ThemeData(
  textTheme: TextTheme(
      titleLarge: getBodyLargeStyle(color: AppColors.lightGreen),
      bodyLarge: getBodyMediumBoldStyle(color: AppColors.deepWhite),
      bodyMedium: getBodyMediumRegularStyle(color: AppColors.deepWhite),
      bodySmall: getBodySmallStyle(color: AppColors.deepWhite),
      labelSmall: getButtonLabelStyle(color: AppColors.deepWhite),
  ),
  scaffoldBackgroundColor: AppColors.deepWhite,
  appBarTheme: const AppBarTheme(backgroundColor: AppColors.deepWhite, elevation: 0),
  textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        textStyle: getBodySmallStyle(color: AppColors.lightGreen, fontSize: AppFontSize.size16),
      )
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        fixedSize: const Size(350, 60),
        backgroundColor: AppColors.lightGreen,
      )
  ),
  inputDecorationTheme: InputDecorationTheme(
      hintStyle: getBodySmallStyle(color: AppColors.lightBlack, fontSize: 14),
      filled: true,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)
      )
  ),
  primarySwatch: Colors.grey,
);

getApplicationTheme() {
  return _appTheme;
}
