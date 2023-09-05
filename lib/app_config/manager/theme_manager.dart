import 'package:flutter/material.dart';
import 'package:pay_me_mobile/app_config/manager/font_manager.dart';

import 'font_style_manager.dart';

class AppColors {
  static const Color lightBlack = Color(0xFF000000);
  static const Color deepWhite = Color(0xFFFFFCFC);
  static const Color lightGreen = Color(0xFF2B606E);
  static const Color lightGrey = Color.fromRGBO(0, 0, 0, 0.6);
  static const Color lightBlue = Color(0xFFF0FBFE);
  static const Color pureWhite = Color(0xFFFFFFFF);
  static const Color darkWhite = Color.fromRGBO(139, 134, 134, 0.5);
  static const Color errorRed =  Color(0xFFDF1414);
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
        fixedSize: const Size(500, 60),
        backgroundColor: AppColors.lightGreen,
        textStyle: getBodySmallStyle(color: AppColors.pureWhite, fontSize: 14),
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
