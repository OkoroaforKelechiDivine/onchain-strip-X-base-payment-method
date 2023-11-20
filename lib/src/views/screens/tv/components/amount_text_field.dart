import 'package:flutter/material.dart';

import '../../../../../app_config/manager/font_manager.dart';
import '../../../../../core/constants/colors.dart';
import '../../../../custom/custom_amount_input_field.dart';

class BuildAmountTextField extends StatefulWidget {
  const BuildAmountTextField({super.key});

  @override
  State<BuildAmountTextField> createState() => _BuildAmountTextFieldState();
}

class _BuildAmountTextFieldState extends State<BuildAmountTextField> {
  TextEditingController amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
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
          controller: amountController,
          onChanged: (text) {
            String formattedAmount = AmountFormatter.formatAmount(text);
            if (amountController.text != formattedAmount) {
              amountController.value = amountController.value.copyWith(
                text: formattedAmount,
                selection: TextSelection.collapsed(offset: formattedAmount.length),
              );
            }
          },
          decoration: InputDecoration(
            hintText: "Enter amount here",
            hintStyle: const TextStyle(
              color: AppColors.lightGrey,
              fontWeight: AppFontWeight.light,
            ),
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
    );
  }
}