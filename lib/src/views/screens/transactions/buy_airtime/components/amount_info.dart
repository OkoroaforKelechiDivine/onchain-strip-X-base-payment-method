import 'package:flutter/cupertino.dart';
import 'package:pay_me_mobile/core/utilities/string_util.dart';
import 'package:pay_me_mobile/src/views/screens/transactions/buy_airtime/buy_airtime_viewmodel.dart';

import '../../../../../../app_config/manager/font_manager.dart';
import '../../../../../../core/constants/colors.dart';

class BuildAmountInfo extends StatelessWidget {
  final BuyAirtimeViewModel viewModel;
  const BuildAmountInfo({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Amount',
          style: TextStyle(
            fontSize: AppFontSize.size16,
            color: AppColors.lightBlack,
            fontWeight: AppFontWeight.bold,
          ),
        ),
        Text(
          "Balance: ₦${viewModel.isLoadingWalletBalance ? "N/A" : formatBalance(double.parse(viewModel.walletBalance))}",
          style: const TextStyle(
            fontSize: AppFontSize.size16,
            color: AppColors.lightBlack,
            fontWeight: AppFontWeight.bold,
          ),
        ),
      ],
    );
  }
}
