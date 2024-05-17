import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pay_me_mobile/core/cores.dart';

import '../../../core/constants/font_weights.dart';

class TransactionHistory extends StatelessWidget {
  const TransactionHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText("Transaction history", fontSize: 14.sp, fontWeight: AppFontWeight.bold),
          SizedBox(height: 10.h),
          Container(
            height: MediaQuery.of(context).size.height / 5,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: AppColors.deepWhite,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      AppText("Recent Transactions", fontSize: 12.sp, fontWeight: AppFontWeight.bold),
                      const Spacer(),
                      Icon(Icons.arrow_forward_ios, size: 12.sp),
                    ],
                  ),
                  SizedBox(height: 20.h),
                  Row(
                    children: [
                      const CircleAvatar(
                        child: AppText("J", color: AppColors.skyOrange),
                      ),
                      SizedBox(width: 10.w),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppText("John Ogaga", fontSize: 14.sp, fontWeight: AppFontWeight.bold),
                          Row (
                            children: [
                              AppText("Zenith Bank 12:03 AM", fontSize: 12.sp, color: AppColors.grey),
                              SizedBox(width: 90.w),
                              AppText("+N20,983", fontSize: 14.sp, fontWeight: AppFontWeight.bold),
                            ],
                          ),
                        ],
                      )
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