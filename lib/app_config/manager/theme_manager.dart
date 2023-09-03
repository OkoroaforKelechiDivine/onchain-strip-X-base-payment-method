import 'package:flutter/material.dart';

import 'font_style_manager.dart';


class AppColors {
  static const Color lightBlack = Color(0xFF000000);
  static const Color deepWhite = Color(0xFFFFFCFC);
  static const Color lightGreen = Color(0xFF2B606E);
  static const Color lightGrey = Color.fromRGBO(0, 0, 0, 0.6);

}

ThemeData _appTheme = ThemeData(
  textTheme: TextTheme(
      titleLarge: getBodyLargeStyle(color: AppColors.deepWhite),
      bodyLarge: getBodyMediumBoldStyle(color: AppColors.deepWhite),
      bodyMedium: getBodyMediumRegularStyle(color: AppColors.deepWhite),
      bodySmall: getBodySmallStyle(color: AppColors.deepWhite),
      labelSmall: getButtonLabelStyle(color: AppColors.deepWhite)),
  scaffoldBackgroundColor: AppColors.deepWhite,
  appBarTheme:
  const AppBarTheme(backgroundColor: Colors.transparent, elevation: 0),
  textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        textStyle: getBodySmallStyle(color: AppColors.lightGreen, fontSize: 14),
      )),
  elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        fixedSize: const Size(500, 60),
        backgroundColor: AppColors.lightGreen,
        foregroundColor: Colors.black,
        textStyle: getBodySmallStyle(color: Colors.black, fontSize: 14),
      )),
  inputDecorationTheme: InputDecorationTheme(
      hintStyle: getBodySmallStyle(color: Colors.black, fontSize: 14),
      // fillColor: AppColors.placeholderColor.withOpacity(0.3),
      filled: true,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
  primarySwatch: Colors.grey,
);

getApplicationTheme() {
  return _appTheme;
}
