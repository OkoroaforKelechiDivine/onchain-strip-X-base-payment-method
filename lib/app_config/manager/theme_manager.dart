import 'package:flutter/material.dart';

import 'font_style_manager.dart';

class AppColors {
  static Color deepGreen = HexColor.fromHex('#02001F');
  static Color lightBlack = HexColor.fromHex("#000000");
  static Color deepWhite = HexColor.fromHex("#FFFCFC");
  static Color lightGreen = HexColor.fromHex("#2B606E");
}

extension HexColor on Color {
  static Color fromHex(String hexColorString) {
    hexColorString = hexColorString.replaceAll('#', '');
    if (hexColorString.length == 6) {
      hexColorString = "FF$hexColorString";
    }
    return Color(int.parse(hexColorString, radix: 16));
  }
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
        // foregroundColor: AppColors.activeButton,
        textStyle: getBodySmallStyle(color: AppColors.lightGreen, fontSize: 14),
      )),
  elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        fixedSize: const Size(275, 40),
        // backgroundColor: AppColors.activeButton,
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
