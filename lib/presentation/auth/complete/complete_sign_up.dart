import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pay_me_mobile/core/constants/app_assets.dart';
import 'package:pay_me_mobile/core/constants/font_weights.dart';
import 'package:pay_me_mobile/core/cores.dart';
import 'package:pay_me_mobile/presentation/homepage/home_page_view.dart';

class CompleteSignUp extends StatelessWidget {
  const CompleteSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBg,
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(AppAssets.success),
                  SizedBox(height: 20.h),
                  AppText(
                    "Welcome!",
                    color: AppColors.deepGreen,
                    fontSize: 24.sp,
                    fontWeight: AppFontWeight.bold,
                  ),
                  const AppText(
                    "Your account has been registered",
                    color: AppColors.grey,
                    fontWeight: AppFontWeight.semiBold,
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: AppButton(
              onPressed: () {
                navigationService.push(const HomepageView());
              },
              color: AppColors.deepGreen,
              title: "Back to Login",
              radius: 100.r,
              margin: EdgeInsets.zero,
            ),
          ),
          SizedBox(height: 20.h),
        ],
      ),
    );
  }
}
