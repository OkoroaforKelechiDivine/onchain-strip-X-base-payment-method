import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

sans({Color? color, double? fontSize, FontWeight? fontWeight}) {
  return GoogleFonts.alegreyaSans(
    color: color ?? Colors.white,
    fontSize: fontSize ?? 18.sp,
    fontWeight: fontWeight ?? FontWeight.w600,
  );
}

inter({Color? color, double? fontSize, FontWeight? fontWeight}) {
  return GoogleFonts.inter(
      fontSize: fontSize ?? 16.sp,
      color: color ?? Colors.black,
      fontWeight: fontWeight ?? FontWeight.w600);
}

cairo({Color? color, double? fontSize, FontWeight? fontWeight}) {
  return GoogleFonts.cairo(
    color: color ?? Colors.white,
    fontSize: fontSize ?? 20.sp,
    fontWeight: fontWeight ?? FontWeight.w700,
  );
}

lato({Color? color, double? fontSize, FontWeight? fontWeight}) {
  return GoogleFonts.lato(
    color: color ?? const Color(0xFF31435F),
    fontSize: fontSize ?? 20.sp,
    fontWeight: fontWeight ?? FontWeight.w700,
  );
}

philosopher({Color? color, double? fontSize, FontWeight? fontWeight}) {
  return GoogleFonts.philosopher(
    color: color ?? const Color(0xFF999999),
    fontSize: fontSize ?? 14.sp,
    fontWeight: fontWeight ?? FontWeight.w400,
  );
}

nunito({Color? color, double? fontSize, FontWeight? fontWeight}) {
  return GoogleFonts.nunito(
    color: color ?? const Color(0xFF999999),
    fontSize: fontSize ?? 14.sp,
    fontWeight: fontWeight ?? FontWeight.w400,
  );
}
