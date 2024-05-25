import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pay_me_mobile/core/constants/app_assets.dart';
import 'package:pay_me_mobile/core/cores.dart';
import 'package:pay_me_mobile/presentation/auth/sign_up/sign_up_viewmodel.dart';

class FingerPrintView extends StatelessWidget {
  final SignUpViewModel model;
  const FingerPrintView({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 20.w, top: 20.h),
          child: AppText(
            "Set Biometric",
            color: AppColors.deepGreen,
            fontWeight: FontWeight.w700,
            fontSize: 24.sp,
          ),
        ),
        SizedBox(height: 100.h),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(AppAssets.fingerPrint),
              SizedBox(height: 20.h),
              const AppText('Place your finger on the screen fingerprint'),
            ],
          ),
        ),
        SizedBox(height: 20.h),
      ],
    );
  }
}
