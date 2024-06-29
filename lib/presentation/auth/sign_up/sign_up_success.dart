import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pay_me_mobile/core/constants/app_assets.dart';
import 'package:pay_me_mobile/core/cores.dart';
import 'package:pay_me_mobile/presentation/auth/sign_in/sign_in_view.dart';
import 'package:pay_me_mobile/presentation/homepage/home_page_view.dart';

class SignUpSuccess extends StatelessWidget {
  const SignUpSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBg,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(),
            SvgPicture.asset(AppAssets.successSvg),
            SizedBox(height: 20.h),
            const AppText(
              "Welcome!",
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: AppColors.deepGreen,
            ),
            const SizedBox(height: 4),
            AppText(
              "Your account has been Registered",
              fontWeight: FontWeight.w500,
              fontSize: 14,
              color: AppColors.welcomeGrey,
            ),
            const Spacer(),
            Center(
              child: AppButton(
                onPressed: () {
                  navigationService.pushAndRemoveUntil(const HomepageView());
                },
                color: AppColors.deepGreen,
                title: "Go to Home Page",
                radius: 100.r,
                margin: const EdgeInsets.symmetric(horizontal: 20),
              ),
            ),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }
}
