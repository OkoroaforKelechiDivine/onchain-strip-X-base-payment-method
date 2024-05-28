import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pay_me_mobile/core/constants/app_assets.dart';
import 'package:pay_me_mobile/core/widgets/info.dart';
import 'package:pay_me_mobile/presentation/transfer/completed_transaction/completed_transaction_vm.dart';
import 'package:pay_me_mobile/presentation/transfer/completed_transaction/successful_transaction_view.dart';
import 'package:stacked/stacked.dart';

import '../../../core/cores.dart';

class FailedTransactionView extends StatelessWidget {
  const FailedTransactionView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => CompletedTransactionVM(),
      builder: (context, model, child) {
        return Scaffold(
          backgroundColor: AppColors.scaffoldBg,
          body: Column(
            children: [
              Spacer(),
              const InfoScreen(
                title: "Network Error",
                imagePath: AppAssets.success,
              ),
              Spacer(),
              AppButton(
                title: "Retry",
                onPressed: () {
                  navigationService.push(const SuccessfulTransaction());
                },
                radius: 100.r,
                margin: const EdgeInsets.symmetric(horizontal: 20),
              ),
              SizedBox(height: 20.h),
            ],
          ),
        );
      },
    );
  }
}
