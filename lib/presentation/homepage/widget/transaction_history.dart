import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pay_me_mobile/core/cores.dart';
import 'package:pay_me_mobile/presentation/homepage/home_page_view_model.dart';

import '../../../core/constants/font_weights.dart';

class TransactionHistory extends StatelessWidget {
  final HomePageViewModel model;
  const TransactionHistory({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText(
            "Transaction history",
            fontSize: 14.sp,
            fontWeight: AppFontWeight.bold,
            color: AppColors.black,
          ),
          SizedBox(height: 10.h),
          Container(
            decoration: BoxDecoration(
              color: AppColors.deepWhite,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.all(25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      AppText(
                        "Recent Transactions",
                        color: AppColors.black,
                        fontSize: 12.sp,
                        fontWeight: AppFontWeight.bold,
                      ),
                      const Spacer(),
                      Icon(Icons.arrow_forward_ios, size: 12.sp),
                    ],
                  ),
                  SizedBox(height: 20.h),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        backgroundColor: AppColors.initialCircleAvatar,
                        child: AppText(
                          "J",
                          color: AppColors.initialCircleAvatarText,
                        ),
                      ),
                      SizedBox(width: 10.w),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppText(
                              "John Ogaga",
                              fontSize: 14.sp,
                              color: AppColors.black,
                              fontWeight: AppFontWeight.bold,
                            ),
                            SizedBox(height: 5.h),
                            AppText(
                              "Zenith Bank 12:03 AM",
                              fontSize: 12.sp,
                              color: AppColors.grey,
                            ),
                          ],
                        ),
                      ),
                      //SizedBox(width: 90.w),
                      AppText(
                        "+N20,983",
                        color: AppColors.black,
                        fontSize: 14.sp,
                        fontWeight: AppFontWeight.bold,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
