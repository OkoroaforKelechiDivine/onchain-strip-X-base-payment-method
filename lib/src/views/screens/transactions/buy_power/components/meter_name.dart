import 'package:flutter/material.dart';
import 'package:pay_me_mobile/core/cores.dart';
import 'package:pay_me_mobile/core/utilities/string_util.dart';
import 'package:pay_me_mobile/src/custom/custom_amount_input_field.dart';
import 'package:pay_me_mobile/src/views/screens/transactions/buy_power/buy_power_view_model.dart';
import 'package:pay_me_mobile/src/views/screens/transactions/buy_power/components/provider_text_field.dart';

import '../../../../../../app_config/manager/font_manager.dart';
import '../../../../../../core/constants/colors.dart';

class BuildMeterName extends StatelessWidget {
  final BuyPowerViewModel viewModel;
  const BuildMeterName({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          width: double.infinity,
          child: Text(
            "Meter Number",
            style: TextStyle(
              color: AppColors.lightBlack,
              fontWeight: AppFontWeight.bold,
              fontSize: AppFontSize.size16,
            ),
          ),
        ),
        const SizedBox(height: 10),
        AppCustomTextField(
          textEditingController: viewModel.meterNumberController,
          hintText: 'Enter Meter Number',
          textInputType: TextInputType.number,
          padding: const EdgeInsets.all(18),
          onChanged: (val) {
            if (val.length == 13) {
              viewModel.verifyMeterDetails();
            }
          },
        ),
        //const SizedBox(height: 20),
        Visibility(
          visible: viewModel.isLoadingMeterDetails,
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 20),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.0),
              color: AppColors.lightGreen.withOpacity(0.1),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                viewModel.verifyMeterResponse == null
                    ? const SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(
                          color: AppColors.lightGreen,
                          strokeWidth: 2,
                        ),
                      )
                    : const Icon(
                        Icons.check_circle_rounded,
                        color: AppColors.lightGreen,
                      ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    viewModel.verifyMeterResponse != null
                        ? viewModel.verifyMeterResponse!.content.customerName
                        : "Checking account number..",
                    style: const TextStyle(
                      color: AppColors.lightGreen,
                      fontWeight: AppFontWeight.bold,
                      fontSize: AppFontSize.size14,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),

        //const BuildElectricityProviderTextField(),
        const SizedBox(height: 24),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Amount',
              style: TextStyle(
                fontSize: AppFontSize.size16,
                color: AppColors.lightBlack,
                fontWeight: AppFontWeight.bold,
              ),
            ),
            Text(
              "Balance: ₦ ${viewModel.isLoadingWalletBalance ? "N/A" : formatBalance(double.parse(viewModel.walletBalance))}",
              //'Balance: NGN7,361.87',
              style: TextStyle(
                fontSize: AppFontSize.size12,
                color: AppColors.lightBlack,
                fontWeight: AppFontWeight.bold,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        AppCustomTextField(
          textEditingController: viewModel.amountController,
          hintText: 'Enter amount here',
          textInputType: TextInputType.number,
          padding: const EdgeInsets.all(18),
          onChanged: (text) {
            String formattedAmount = AmountFormatter.formatAmount(text);
            if (viewModel.amountController.text != formattedAmount) {
              viewModel.amountController.value =
                  viewModel.amountController.value.copyWith(
                text: formattedAmount,
                selection:
                    TextSelection.collapsed(offset: formattedAmount.length),
              );
            }
          },
        ),
        // Padding(
        //   padding: const EdgeInsets.all(8),
        //   child: Padding(
        //     padding: const EdgeInsets.symmetric(
        //       horizontal: 8.0,
        //       vertical: 8.0,
        //     ),
        //     child: Container(
        //       decoration: BoxDecoration(
        //         boxShadow: [
        //           BoxShadow(
        //             color: AppColors.lightGrey.withOpacity(0.1),
        //             spreadRadius: 5,
        //             blurRadius: 7,
        //             offset: const Offset(0, 3),
        //           ),
        //         ],
        //       ),
        //       child: TextField(
        //         controller: viewModel.amountController,
        //         onChanged: (text) {
        //           String formattedAmount = AmountFormatter.formatAmount(text);
        //           if (viewModel.amountController.text != formattedAmount) {
        //             viewModel.amountController.value =
        //                 viewModel.amountController.value.copyWith(
        //               text: formattedAmount,
        //               selection: TextSelection.collapsed(
        //                   offset: formattedAmount.length),
        //             );
        //           }
        //         },
        //         decoration: InputDecoration(
        //           hintText: "Enter amount here",
        //           hintStyle: const TextStyle(
        //               color: AppColors.lightGrey,
        //               fontSize: AppFontSize.size14,
        //               fontWeight: AppFontWeight.light),
        //           filled: true,
        //           fillColor: AppColors.pureWhite,
        //           focusColor: AppColors.pureWhite,
        //           border: OutlineInputBorder(
        //             borderSide: BorderSide.none,
        //             borderRadius: BorderRadius.circular(8.0),
        //           ),
        //         ),
        //         keyboardType: TextInputType.number,
        //       ),
        //     ),
        //   ),
        // ),
        //BuildAmountTextField(),
      ],
    );
  }
}
