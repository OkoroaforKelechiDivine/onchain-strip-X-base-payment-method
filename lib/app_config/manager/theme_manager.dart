import 'package:flutter/material.dart';
import 'package:pay_me_mobile/app_config/manager/font_manager.dart';
import 'package:pay_me_mobile/core/constants/colors.dart';

import 'font_style_manager.dart';



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
