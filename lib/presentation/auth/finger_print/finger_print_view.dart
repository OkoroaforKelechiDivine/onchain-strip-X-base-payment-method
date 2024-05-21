import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pay_me_mobile/core/constants/app_assets.dart';
import 'package:pay_me_mobile/core/cores.dart';
import 'package:pay_me_mobile/presentation/auth/finger_print/finger_print_viewmodel.dart';
import 'package:stacked/stacked.dart';

import '../../../core/widgets/indicator.dart';
import '../../homepage/home_page_view.dart';

class FingerPrintView extends StatelessWidget {
  const FingerPrintView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => FingerPrintViewModel(),
      builder: (context, model, child) {
        return Scaffold(
          backgroundColor: AppColors.scaffoldBg,
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 25.h),
                const PaymeAppBar(
                  isBack: true,
                  title: "Fingerprint",
                ),
                SizedBox(height: 15.h),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleIndicator(number: "01", text: "Business Information", circleColor: AppColors.demonicGreen, textColor: AppColors.demonicGreen, boldText: true),
                    Underline(color: AppColors.demonicGreen),
                    CircleIndicator(number: "02", text: "Personal Information", circleColor: AppColors.demonicGreen, textColor: AppColors.demonicGreen, boldText: true),
                    Underline(color: AppColors.demonicGreen),
                    CircleIndicator(number: "03", text: "Create Login Pin", circleColor: AppColors.demonicGreen, textColor: AppColors.demonicGreen, boldText: true),
                    Underline(color: AppColors.demonicGreen),
                    CircleIndicator(number: "04", text: "Set Biometric"),
                  ],
                ),
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
                      Image.asset(
                        AppAssets.fingerPrint
                      ),
                      SizedBox(height: 20.h),
                      const AppText('Place your finger on the screen fingerprint'),
                    ],
                  ),
                ),
                SizedBox(height:150.h),
                Center(
                  child: AppButton(
                    //  Still waiting for the designer to get me the success image. But for now I will navigate to the home page
                    onPressed: () {
                      navigationService.push(const HomepageView());
                      },
                    color: AppColors.deepGreen,
                    title: "Continue",
                    radius: 100.r,
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                  ),
                ),
                SizedBox(height: 20.h),
              ],
            ),
          ),
        );
      },
    );
  }
}
