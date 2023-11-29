import 'package:flutter/material.dart';
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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          const SizedBox(
            width: double.infinity,
            child: Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: Text(
                "Meter Number",
                style: TextStyle(
                  color: AppColors.lightBlack,
                  fontWeight: AppFontWeight.bold,
                  fontSize: AppFontSize.size16,
                ),
              ),
            ),
          ),
          const BuildElectricityProviderTextField(),
          const SizedBox(height: 10),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 20.0),
                child: Text(
                  'Amount',
                  style: TextStyle(
                    fontSize: AppFontSize.size16,
                    color: AppColors.lightBlack,
                    fontWeight: AppFontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 10.0),
                child: Text(
                  'Balance: NGN7,361.87',
                  style: TextStyle(
                    fontSize: AppFontSize.size16,
                    color: AppColors.lightBlack,
                    fontWeight: AppFontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 8.0,
                vertical: 8.0,
              ),
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.lightGrey.withOpacity(0.1),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: TextField(
                  controller: viewModel.amountController,
                  onChanged: (text) {
                    String formattedAmount = AmountFormatter.formatAmount(text);
                    if (viewModel.amountController.text != formattedAmount) {
                      viewModel.amountController.value =
                          viewModel.amountController.value.copyWith(
                        text: formattedAmount,
                        selection: TextSelection.collapsed(
                            offset: formattedAmount.length),
                      );
                    }
                  },
                  decoration: InputDecoration(
                    hintText: "Enter amount here",
                    hintStyle: const TextStyle(
                        color: AppColors.lightGrey,
                        fontSize: AppFontSize.size14,
                        fontWeight: AppFontWeight.light),
                    filled: true,
                    fillColor: AppColors.pureWhite,
                    focusColor: AppColors.pureWhite,
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
            ),
          ),
          //BuildAmountTextField(),
        ],
      ),
    );
  }
}
