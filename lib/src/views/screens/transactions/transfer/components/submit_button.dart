import 'package:flutter/material.dart';

import '../../../../../../app_config/manager/font_manager.dart';
import '../../../../../../core/constants/colors.dart';
import '../../../../../custom/show_pin_dialog.dart';

class BuildSubmitButton extends StatefulWidget {
  const BuildSubmitButton({super.key});

  @override
  State<BuildSubmitButton> createState() => _BuildSubmitButtonState();
}

class _BuildSubmitButtonState extends State<BuildSubmitButton> {
  final TextEditingController amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50.0, right: 100.0, left: 100.0),
      child: ElevatedButton(
        onPressed: () {
          String enteredAmount = amountController.text;

          enteredAmount = enteredAmount.replaceAll("₦", "").replaceAll(",", "");

          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => PinDialog(
                amount: double.parse(enteredAmount),
                accountName: "",
              ),
            ),
          );
        },
        child: const Text(
          'Submit',
          style: TextStyle(
            color: AppColors.deepWhite,
            fontSize: AppFontSize.size14,
          ),
        ),
      ),
    );
  }
}
