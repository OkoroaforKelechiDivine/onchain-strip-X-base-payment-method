import 'package:flutter/material.dart';

import '../../../../../../app_config/manager/font_manager.dart';
import '../../../../../../core/constants/colors.dart';
import '../../../../../../core/di/locator.dart';
import '../send_money.dart';
import '../transfer_to_bank_screen.dart';

class BuildNextTextButton extends StatefulWidget {
  const BuildNextTextButton({super.key});

  @override
  State<BuildNextTextButton> createState() => _BuildNextTextButtonState();
}

class _BuildNextTextButtonState extends State<BuildNextTextButton> {
  final bool _bankSelected = false;
  final bool _isAccountNumberErrorVisible = true;
  final bool _isAccountNumberLengthInvalid = false;
  final TextEditingController _selectedBankController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    bool isButtonDisabled = !_bankSelected ||
        _isAccountNumberErrorVisible ||
        _isAccountNumberLengthInvalid;
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Center(
        child: SizedBox(
          height: 50,
          width: 100,
          child: ElevatedButton(
            onPressed: !isButtonDisabled
                ? null
                : () {
                    // if (!_bankSelected) {
                    //   final selectedBank = dummyBanks.firstWhere(
                    //       (bank) => bank.name == _selectedBankController.text);
                    //   if (selectedBank != null) {
                    //     navigationService.push(SendMoneyScreen(
                    //       bank: selectedBank,
                    //     ));
                    //   } else {}
                    // }
                  },
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 15.0),
              backgroundColor: AppColors.lightGreen,
            ),
            child: const Text(
              'Next',
              style: TextStyle(
                fontWeight: AppFontWeight.bold,
                color: AppColors.pureWhite,
                fontSize: AppFontSize.size14,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
