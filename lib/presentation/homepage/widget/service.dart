import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pay_me_mobile/core/constants/app_assets.dart';
import 'package:pay_me_mobile/core/constants/font_weights.dart';
import 'package:pay_me_mobile/core/cores.dart';

class ServiceSection extends StatelessWidget {
  const ServiceSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void onServiceTap(String action) {
      print('$action tapped');
    }

    Widget buildServiceContainer(Color backgroundColor, String asset, String text) {
      return InkWell(
        onTap: () => onServiceTap('Service tapped'),
        child: Column(
          children: [
            Container(
              height: 48.h,
              width: 50.w,
              decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Image.asset(asset)
            ),
            AppText(
              text,
              fontSize: 10.sp,
            ),
          ],
        ),
      );
    }
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText(
            "Services",
            fontWeight: AppFontWeight.bold,
            fontSize: 14.sp,
          ),
          SizedBox(height: 15.h),
          Row(
            children: [
              buildServiceContainer(AppColors.skyBlue, AppAssets.accounting, 'Accounting'),
              const Spacer(),
              buildServiceContainer(AppColors.transparentDeep, AppAssets.inventory, 'Inventory'),
              const Spacer(),
              buildServiceContainer(AppColors.brightGreen, AppAssets.loan, 'Loan'),
              const Spacer(),
              buildServiceContainer(AppColors.skyOrange, AppAssets.utility, 'Utility'),
              const Spacer(),
              buildServiceContainer(AppColors.skyGreen, AppAssets.more, 'More'),
            ],
          ),
        ],
      ),
    );
  }
}