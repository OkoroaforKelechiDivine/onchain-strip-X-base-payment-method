import 'package:flutter/material.dart';

import '../../../../../../core/constants/colors.dart';
import '../../../../../custom/show_pin_dialog.dart';

class BuildNextButton extends StatefulWidget {
  const BuildNextButton({super.key});

  @override
  State<BuildNextButton> createState() => _BuildNextButtonState();
}

class _BuildNextButtonState extends State<BuildNextButton> {
  TextEditingController amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 120.0, right: 120.0, top: 50),
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
        child: const Text("Next", style: TextStyle(color: AppColors.pureWhite)),
      ),
    );
  }
}
