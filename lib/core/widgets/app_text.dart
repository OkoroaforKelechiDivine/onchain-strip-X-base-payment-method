import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppText extends StatelessWidget {
  final String text;
  final double? fontSize, letterSpacing, height;
  final FontWeight? fontWeight;
  final FontStyle? fontStyle;
  final String? fontFamily;
  final Color? color;
  final int? maxLines;
  final TextOverflow? overflow;
  final TextAlign? alignment;
  final TextDecoration? textDecoration;
  final VoidCallback? onPress;
  final bool? isTextButton;
  const AppText(
    this.text, {
    Key? key,
    this.fontSize,
    this.fontStyle,
    this.fontWeight,
    this.color,
    this.maxLines,
    this.overflow,
    this.alignment,
    this.fontFamily,
    this.letterSpacing,
    this.textDecoration,
    this.height,
    this.onPress,
    this.isTextButton,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (isTextButton == true) {
      return GestureDetector(
        onTap: onPress,
        child: Text(
          text,
          maxLines: maxLines,
          style: TextStyle(
            color: color,
            fontWeight: fontWeight,
            fontStyle: fontStyle,
            fontSize: fontSize,
            overflow: overflow,
            letterSpacing: letterSpacing,
            decoration: textDecoration,
            height: height,
            fontFamily: GoogleFonts.inter().fontFamily,
          ),
          textAlign: alignment,
        ),
      );
    } else {
      return Text(
        text,
        maxLines: maxLines,
        style: TextStyle(
          color: color,
          fontWeight: fontWeight,
          fontStyle: fontStyle,
          fontSize: fontSize,
          overflow: overflow,
          letterSpacing: letterSpacing,
          decoration: textDecoration,
          height: height,
          fontFamily: GoogleFonts.inter().fontFamily,
        ),
        textAlign: alignment,
      );
    }
  }
}
