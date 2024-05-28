import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pay_me_mobile/core/constants/app_assets.dart';
import 'package:pay_me_mobile/core/constants/font_weights.dart';
import 'package:pay_me_mobile/core/widgets/info.dart';
import 'package:pay_me_mobile/core/widgets/share_receipt_modal.dart';
import 'package:pay_me_mobile/presentation/bottom_nav.dart';
import 'package:pay_me_mobile/presentation/transfer/completed_transaction/completed_transaction_vm.dart';
import 'package:stacked/stacked.dart';

import '../../../core/cores.dart';

class SuccessfulTransaction extends StatelessWidget {
  const SuccessfulTransaction({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => CompletedTransactionVM(),
      builder: (context, model, child) {
        return Scaffold(
          backgroundColor: AppColors.scaffoldBg,
          body: SafeArea(
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(),
                const InfoScreen(
                  title: "Successful",
                  imagePath: AppAssets.success,
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: AppColors.skyGreen,
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(5),
                              child: Image.asset(AppAssets.addPeople),
                            ),
                          ),
                          AppText("Add Beneficiary",
                              fontSize: 12.sp, color: AppColors.grey)
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        bottomSheetService.show(ShareReceiptModal(
                          title: "Share Receipt",
                          onShareImage: () {},
                          onSharePDF: () {},
                        ));
                      },
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: AppColors.skyGreen,
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(5),
                              child: Image.asset(AppAssets.shareReceipt),
                            ),
                          ),
                          AppText("Share Receipt",
                              fontSize: 12.sp, color: AppColors.grey)
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 50.h),
                AppButton(
                  title: "Close",
                  onPressed: () {
                    navigationService.pushAndRemoveUntil(const BottomNav());
                  },
                  radius: 100.r,
                  margin: const EdgeInsets.symmetric(horizontal: 20),
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
