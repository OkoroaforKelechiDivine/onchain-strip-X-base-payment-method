import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pay_me_mobile/core/constants/app_assets.dart';
import 'package:pay_me_mobile/core/constants/font_weights.dart';
import 'package:pay_me_mobile/core/cores.dart';
import 'package:pay_me_mobile/presentation/homepage/widget/quick_action_parent_container.dart';

class QuickActions extends StatelessWidget {
  const QuickActions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void onQuickActionTap(String action) {
      print('$action tapped');
    }

    Widget buildQuickActionContainer(
        String text, String asset, Color backgroundColor) {
      return InkWell(
        onTap: () => onQuickActionTap(text),
        child: QuickActionParentContainer(
          text: text,
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Image.asset(
              asset,
              height: 13.h,
              width: 13.w,
            ),
          ),
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText(
            "Quick Action",
            fontWeight: AppFontWeight.bold,
            color: AppColors.black,
            fontSize: 14.sp,
          ),
          SizedBox(height: 15.h),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buildQuickActionContainer('Inflow', AppAssets.inflow, AppColors.skyGreen),
              buildQuickActionContainer('Transfer', AppAssets.transfer, AppColors.skyRed),
              buildQuickActionContainer('Invoice', AppAssets.invoice, AppColors.skyBlue),
              buildQuickActionContainer('Report', AppAssets.report, AppColors.skyGrey),
            ],
          ),
        ],
      ),
    );
  }
}
