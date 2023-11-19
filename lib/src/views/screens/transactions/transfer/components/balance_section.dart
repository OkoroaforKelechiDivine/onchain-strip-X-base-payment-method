import 'package:flutter/material.dart';

import '../../../../../../app_config/manager/font_manager.dart';
import '../../../../../../core/constants/colors.dart';

class BuildBalanceSection extends StatefulWidget {
  const BuildBalanceSection({super.key});

  @override
  State<BuildBalanceSection> createState() => _BuildBalanceSectionState();
}

class _BuildBalanceSectionState extends State<BuildBalanceSection> {
  final TextEditingController narrationController = TextEditingController();
  double balance = 20000.00;
  String emptyNarrativeMessage = 'Narration field cannot be empty';

  String _formatBalance(double balance) {
    String formattedBalance = balance.toStringAsFixed(2);
    List<String> parts = formattedBalance.split('.');
    String integerPart = parts[0];
    String decimalPart = parts.length > 1 ? '.${parts[1]}' : '';

    String result = '';
    int count = 0;

    for (int i = integerPart.length - 1; i >= 0; i--) {
      result = integerPart[i] + result;
      count++;
      if (count % 3 == 0 && i != 0) {
        result = ',$result';
      }
    }
    return result + decimalPart;
  }

  void narrationErrorHandling() {
    if (narrationController.text.isEmpty) {
      setState(() {
        emptyNarrativeMessage = 'Narration field is empty';
      });
    } else if (narrationController.text.length < 3) {
      setState(() {
        emptyNarrativeMessage = 'Narration must be at least 3 characters';
      });
    } else {
      setState(() {
        emptyNarrativeMessage = '';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Balance: ₦ ${_formatBalance(balance)}",
          style: const TextStyle(
              fontSize: AppFontSize.size20,
              color: AppColors.lightBlack,
              fontWeight: AppFontWeight.bold
          ),
        ),
        const SizedBox(height: 40),
        TextField(
          controller: narrationController,
          decoration: InputDecoration(
            hintText: 'Enter Narration',
            labelStyle: const TextStyle(color: AppColors.lightGrey, fontSize: AppFontSize.size16),
            filled: true,
            fillColor: AppColors.pureWhite,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: const BorderSide(
                  color: AppColors.pureWhite,
                  width: 2.0
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: const BorderSide(
                  color: AppColors.lightBlue, width: 2.0
              ),
            ),
          ),
          onChanged: (value) {
            narrationErrorHandling();
          },
        ),
        if (emptyNarrativeMessage.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              emptyNarrativeMessage,
              style: const TextStyle(
                color: AppColors.errorRed,
              ),
            ),
          ),
      ],
    );
  }
}
