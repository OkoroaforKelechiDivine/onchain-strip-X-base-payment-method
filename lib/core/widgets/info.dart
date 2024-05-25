import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pay_me_mobile/core/constants/font_weights.dart';
import 'package:pay_me_mobile/core/cores.dart';


class InfoScreen extends StatelessWidget {
  final String? title;
  final String? message;
  final String? imagePath;
  // final String? buttonText;
  final VoidCallback? onPressed;

  const InfoScreen({
    Key? key,
    this.title,
    this.message,
    this.imagePath,
    // this.buttonText,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.7,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (imagePath != null) Image.asset(imagePath!),
          if (imagePath != null) SizedBox(height: 20.h),
          if (title != null)
            AppText(
              title!,
              color: AppColors.deepGreen,
              fontSize: 24.sp,
              fontWeight: AppFontWeight.bold,
            ),
          if (message != null)
            AppText(
              message!,
              color: AppColors.grey,
              fontWeight: AppFontWeight.semiBold,
            ),
          // SizedBox(height: 500.h),
          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 20),
          //   child: AppButton(
          //     onPressed: onPressed,
          //     color: AppColors.deepGreen,
          //     title: buttonText ?? "Back to Login",
          //     radius: 100.r,
          //     margin: EdgeInsets.zero,
          //   ),
          // ),
        ],
      ),
    );
  }
}
