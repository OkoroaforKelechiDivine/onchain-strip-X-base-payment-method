import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pay_me_mobile/screens/transfer_to_bank/transfer_to_bank_screen.dart';
import '../../app_config/manager/font_manager.dart';
import '../../app_config/manager/theme_manager.dart';
import '../../views/custom/custom_dynamic_label_textfield.dart';
import '../../views/custom/custom_underline.dart';

class BeneficiaryDetailsScreen extends StatefulWidget {
  final DummyBank bank;

  const BeneficiaryDetailsScreen({Key? key, required this.bank}) : super(key: key);

  @override
  _BeneficiaryDetailsScreenState createState() => _BeneficiaryDetailsScreenState();
}

class _BeneficiaryDetailsScreenState extends State<BeneficiaryDetailsScreen> {
  final TextEditingController amountController = TextEditingController();
  final TextEditingController narrationController = TextEditingController();

  String amountExceedBalanceErrorMessage = 'Amount exceeds the available balance';
  String emptyAmountErrorMessage = 'Amount is empty';
  String emptyNarrativeMessage = 'Narration field cannot be empty';

  double balance = 20000.00;

  @override
  void initState() {
    super.initState();
    amountController.addListener(amountErrorHandling);
    narrationController.addListener(narrationErrorHandling);
  }

  @override
  void dispose() {
    amountController.dispose();
    narrationController.dispose();
    super.dispose();
  }

  void narrationErrorHandling() {
    if (narrationController.text.isEmpty) {
      setState(() {
        emptyNarrativeMessage = 'Narration field cannot be empty';
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

  Widget buildBankCard() {
    return Card(
      color: AppColors.lightBlue,
      elevation: 0.0,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              color: AppColors.lightBlue,
              child: Image.asset(
                widget.bank.logo,
                width: 40,
                height: 60,
              ),
            ),
            const SizedBox(width: 30),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.bank.accountName,
                  style: CustomStyles.bankInfoTextStyle,
                ),
                Text(
                  widget.bank.accountNumber,
                  style: CustomStyles.bankInfoTextStyle,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildSendMoneySection() {
    return const Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: CustomUnderlinedText(
            text: "Send Money",
            textStyle: TextStyle(
              fontSize: AppFontSize.size24,
              fontWeight: AppFontWeight.bold,
              color: AppColors.lightGreen,
            ),
          ),
        ),
      ],
    );
  }

  Widget buildAmountInput() {
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

  Widget buildAmountErrorMessage() {
    if (emptyAmountErrorMessage.isNotEmpty) {
      return Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Text(
          emptyAmountErrorMessage,
          style: const TextStyle(
            color: AppColors.errorRed,
          ),
        ),
      );
    } else {
      return const SizedBox.shrink();
    }
  }

  Widget buildBalanceSection() {
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
            labelText: 'Enter Narration',
            labelStyle: const TextStyle(color: AppColors.lightBlack),
            filled: true,
            fillColor: AppColors.lightBlue,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: const BorderSide(
                  color: AppColors.lightBlue, width: 2.0
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

  Widget buildSubmitButton() {
    return Padding(
      padding: const EdgeInsets.only(top: 50.0, right: 100.0, left: 100.0),
      child: ElevatedButton(
        onPressed: () {},
        child: const Text('Submit', style: TextStyle(color: AppColors.deepWhite)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              buildBankCard(),
              const SizedBox(height: 50),
              buildSendMoneySection(),
              const SizedBox(height: 50),
              buildAmountInput(),
              buildAmountErrorMessage(),
              const SizedBox(height: 50),
              buildBalanceSection(),
              buildSubmitButton(),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomStyles {
  static const TextStyle bankInfoTextStyle = TextStyle(
    fontSize: AppFontSize.size24,
    color: AppColors.lightBlack,
    fontWeight: AppFontWeight.bold,
  );
}
