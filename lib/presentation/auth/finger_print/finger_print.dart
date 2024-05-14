import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pay_me_mobile/core/constants/app_assets.dart';
import 'package:pay_me_mobile/core/cores.dart';
import 'package:pay_me_mobile/presentation/auth/finger_print/finger_print_viewmodel.dart';
import 'package:stacked/stacked.dart';

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
                      const AppText('Place your finger on the screen fingerprint', color: AppColors.grey,),
                    ],
                  ),
                ),
                SizedBox(height:250.h),
                Center(
                  child: AppButton(
                    onPressed: () {},
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
