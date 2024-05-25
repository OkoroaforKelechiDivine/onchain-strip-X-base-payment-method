import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pay_me_mobile/core/constants/app_assets.dart';
import 'package:pay_me_mobile/core/constants/font_weights.dart';
import 'package:pay_me_mobile/core/cores.dart';

import '../../../core/widgets/info.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBg,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const InfoScreen(
            title: "Successful",
            imagePath: AppAssets.success,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {},
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: AppColors.skyGreen,
                        borderRadius: BorderRadius.circular(3),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(5),
                        child: Image.asset(AppAssets.addPeople),
                      ),
                    ),
                    AppText("Add Beneficiary", fontSize: 12.sp, color: AppColors.grey)
                  ],
                ),
              ),
              SizedBox(width: 50.w),
              GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return Container(
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        height: 200.h,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 40),
                          child: Column(
                            children: [
                              Center(
                                  child: AppText("Share Receipt",
                                    color: AppColors.deepGreen,
                                    fontWeight: AppFontWeight.extraBold,
                                    fontSize: 14.sp,
                                  )
                              ),
                              ListTile(
                                contentPadding: const EdgeInsets.only(top: 20),
                                title: Center(
                                    child: AppText("Share as Image",
                                      fontSize: 14.sp,
                                      color: AppColors.grey,
                                    )
                                ),
                                onTap: () {
                                  Navigator.pop(context);
                                },
                              ),
                              ListTile(
                                title: Center(
                                    child: AppText("Share as PDF",
                                      fontSize: 14.sp,
                                      color: AppColors.grey,
                                    )
                                ),
                                onTap: () {
                                  Navigator.pop(context);
                                },
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: AppColors.skyGreen,
                        borderRadius: BorderRadius.circular(3),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(5),
                        child: Image.asset(AppAssets.shareReceipt),
                      ),
                    ),
                    AppText("Share Receipt",
                        fontSize: 12.sp,
                        color: AppColors.grey
                    )
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 50.h),
          AppButton(
            title: "Close",
            onPressed: () {},
            radius: 100.r,
            margin: const EdgeInsets.symmetric(horizontal: 20),
          )
        ],
      ),
    );
  }
}
