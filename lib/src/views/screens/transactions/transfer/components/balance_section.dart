import 'package:flutter/material.dart';
import 'package:pay_me_mobile/core/utilities/string_util.dart';
import 'package:pay_me_mobile/src/views/screens/transactions/transfer/send_money_viewmodel.dart';

import '../../../../../../app_config/manager/font_manager.dart';
import '../../../../../../core/constants/colors.dart';

class BuildBalanceSection extends StatelessWidget {
  final SendMoneyViewModel model;
  const BuildBalanceSection({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Balance: ₦ ${model.isLoadingWalletBalance ? "N/A" : formatBalance(double.parse(model.walletBalance))}",
          style: const TextStyle(
              fontSize: AppFontSize.size20,
              color: AppColors.lightBlack,
              fontWeight: AppFontWeight.bold),
        ),
        const SizedBox(height: 40),
        TextField(
          controller: model.narrationController,
          decoration: InputDecoration(
            hintText: 'Enter Narration',
            labelStyle: const TextStyle(
                color: AppColors.lightGrey, fontSize: AppFontSize.size16),
            filled: true,
            fillColor: AppColors.pureWhite,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide:
                  const BorderSide(color: AppColors.pureWhite, width: 2.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide:
                  const BorderSide(color: AppColors.lightBlue, width: 2.0),
            ),
          ),
          onChanged: (value) {},
        ),
      ],
    );
  }
}
