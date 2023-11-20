import 'package:flutter/material.dart';

import '../../../../../core/constants/colors.dart';

class BuildSubmitButton extends StatefulWidget {
  const BuildSubmitButton({super.key});

  @override
  State<BuildSubmitButton> createState() => _BuildSubmitButtonState();
}

class _BuildSubmitButtonState extends State<BuildSubmitButton> {

  final TextEditingController amountController = TextEditingController();
  final TextEditingController narrationController = TextEditingController();

  final GlobalKey<FormState> amountKey = GlobalKey<FormState>();
  final GlobalKey<FormState> narrationKey = GlobalKey<FormState>();

  bool amountError = false;
  bool narrationError = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 100.0, right: 100.0),
      child: ElevatedButton(
        onPressed: () {
          if (amountController.text.isNotEmpty && narrationController.text.isNotEmpty) {
            setState(() {
              amountError = false;
              narrationError = false;
            });
          } else {
            setState(() {
              amountError = amountController.text.isEmpty;
              narrationError = narrationController.text.isEmpty;
            });
          }
        },
        child: const Text(
          "Submit",
          style: TextStyle(color: AppColors.pureWhite),
        ),
      ),
    );
  }
}