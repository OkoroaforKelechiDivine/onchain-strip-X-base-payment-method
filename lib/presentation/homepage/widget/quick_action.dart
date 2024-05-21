import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pay_me_mobile/core/constants/app_assets.dart';
import 'package:pay_me_mobile/core/constants/font_weights.dart';
import 'package:pay_me_mobile/core/cores.dart';
import 'package:pay_me_mobile/presentation/homepage/widget/quick_action_parent_container.dart';
import 'package:pay_me_mobile/presentation/invoice/invoice_home.dart';
import 'package:pay_me_mobile/presentation/transfer/transfer.dart';

class QuickActions extends StatelessWidget {
  const QuickActions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              QuickActionParentContainer(
                text: 'Inflow',
                asset: AppAssets.inflow,
                backgroundColor: AppColors.skyGreen,
                onQuickActionTap: () {},
              ),
              QuickActionParentContainer(
                text: 'Transfer',
                asset: AppAssets.transfer,
                backgroundColor: AppColors.skyRed,
                onQuickActionTap: () {
                  navigationService.push(const TransferView());
                },
              ),
              QuickActionParentContainer(
                text: 'Invoice',
                asset: AppAssets.invoice,
                backgroundColor: AppColors.skyBlue,
                onQuickActionTap: () {
                  navigationService.push(const InvoiceHomeScreen());
                },
              ),
              QuickActionParentContainer(
                text: 'Report',
                asset: AppAssets.report,
                backgroundColor: AppColors.skyGrey,
                onQuickActionTap: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
