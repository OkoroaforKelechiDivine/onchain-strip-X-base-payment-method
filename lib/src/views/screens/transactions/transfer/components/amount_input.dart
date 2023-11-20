import 'package:flutter/cupertino.dart';

import '../../../../../../core/constants/colors.dart';
import '../../../../../custom/custom_dynamic_label_textfield.dart';

class BuildAmountInput extends StatefulWidget {
  const BuildAmountInput({super.key});

  @override
  State<BuildAmountInput> createState() => _BuildAmountInputState();
}

class _BuildAmountInputState extends State<BuildAmountInput> {
  final TextEditingController amountController = TextEditingController();
  String emptyAmountErrorMessage = 'Amount is empty';
  double balance = 20000;

  @override
  void initState() {
    super.initState();
    amountController.addListener(amountErrorHandling);
  }

  @override
  void dispose() {
    amountController.dispose();
    super.dispose();
  }

  void amountErrorHandling() {
    double enteredAmount = double.tryParse(amountController.text) ?? 0.0;

    if (amountController.text.isEmpty) {
      setState(() {
        emptyAmountErrorMessage = 'Amount is empty';
      });
    } else if (enteredAmount > balance) {
      setState(() {
        emptyAmountErrorMessage = 'Amount exceeds the available balance';
      });
    } else {
      setState(() {
        emptyAmountErrorMessage = '';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            color: AppColors.deepWhite,
            child: TextFieldWithDynamicLabel(
              controller: amountController,
              labelText: '₦ 0.00',
              onChanged: (value) {
                amountErrorHandling();
              },
              onValidation: (value) {},
              hintText: '',
              fillColor: AppColors.deepWhite,
            ),
          ),
        ),
      ],
    );
  }
}
