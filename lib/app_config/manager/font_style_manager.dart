import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'font_manager.dart';


TextStyle _getAlegreyaSansTextStyle(double fontSize, FontWeight fontWeight, Color fontColor,){
  return GoogleFonts.alegreyaSans(fontSize: fontSize, fontWeight: fontWeight, color: fontColor);
}

getBodyLargeStyle({double fontSize = AppFontSize.size24, required Color color}) {
  return _getAlegreyaSansTextStyle(fontSize, AppFontWeight.bold, color);
}

getBodyMediumBoldStyle(
    {double fontSize = AppFontSize.size16, required Color color}) {
  return _getAlegreyaSansTextStyle(fontSize, AppFontWeight.semiBold, color);
}

getBodyMediumRegularStyle({double fontSize = AppFontSize.size14, required Color color}) {
  return _getAlegreyaSansTextStyle(fontSize, AppFontWeight.regular, color);
}

getBodySmallStyle({double fontSize = AppFontSize.size12, required Color color}) {
  return _getAlegreyaSansTextStyle(fontSize, AppFontWeight.medium, color);
}

getButtonLabelStyle({double fontSize = AppFontSize.size10, required Color color}) {
  return _getAlegreyaSansTextStyle(fontSize, AppFontWeight.semiBold, color);
}

