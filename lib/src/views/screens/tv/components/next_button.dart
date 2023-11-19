import 'package:flutter/material.dart';

import '../../../../../core/constants/colors.dart';

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
      padding: const EdgeInsets.only(left: 120, right: 120, top: 50),
      child: ElevatedButton(
        onPressed: () {
          String enteredAmount = amountController.text;
          Navigator.of(context).pushNamed('/confirm_page', arguments: enteredAmount);
        },
        child: const Text(
          "Next",
          style: TextStyle(
            color: AppColors.pureWhite,
          ),
        ),
      ),
    );
  }
}