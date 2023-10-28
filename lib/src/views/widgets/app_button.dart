
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/constants/app_constants.dart';

class AppButton {
  static filledButton(BuildContext context,
      {String buttonText = "Continue",
        Widget? child,
        void Function()? onTap,
        TextStyle? style,
        Color? color,
        Color? textColor}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: width(context),
        height: 58.5,
        decoration: ShapeDecoration(
          color: color ?? Colors.white,
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
        ),
        child: Center(
          child: child,
        ),
      ),
    );
  }
}