import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pay_me_mobile/screens/transfer_to_bank/transfer_to_bank_screen.dart';
import 'package:pay_me_mobile/views/custom/show_pin_dialog.dart';
import '../../app_config/manager/font_manager.dart';
import '../../app_config/manager/theme_manager.dart';
import '../../views/custom/custom_dynamic_label_textfield.dart';
import '../../views/custom/custom_underline.dart';

class RaisePaymentDetailScreen extends StatefulWidget {
  final DummyBank bank;
  final String selectedBankLogo;

  const RaisePaymentDetailScreen({Key? key, required this.bank, required this.selectedBankLogo}) : super(key: key);

  @override
  _RaisePaymentDetailScreenState createState() => _RaisePaymentDetailScreenState();
}

class _RaisePaymentDetailScreenState extends State<RaisePaymentDetailScreen> {
  final TextEditingController amountController = TextEditingController();
  final TextEditingController narrationController = TextEditingController();

  String emptyAmountErrorMessage = 'Amount is empty';
  String emptyNarrativeMessage = 'Narration field cannot be empty';


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
    } else {
      setState(() {
        emptyAmountErrorMessage = '';
      });
    }
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
        TextField(
          controller: narrationController,
          decoration: InputDecoration(
            labelText: 'Enter Narration',
            labelStyle: const TextStyle(color: AppColors.lightBlack, fontSize: AppFontSize.size7),
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
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 50.0, left: 5.0),
          child: SizedBox(
            width: 150,
            child: ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return PinDialog(
                      amount: double.parse(amountController.text),
                      accountName: widget.bank.accountName,
                    );
                  },
                );
              },
              child: const Text(
                'Submit',
                style: TextStyle(
                  color: AppColors.deepWhite,
                  fontSize: AppFontSize.size20,
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 50.0, left: 55),
          child: SizedBox(
            width: 150,
            child: ElevatedButton(
              onPressed: () {},
              child: const Text(
                'Cancel',
                style: TextStyle(
                  color: AppColors.deepWhite,
                  fontSize: AppFontSize.size20,
                ),
              ),
            ),
          ),
        ),
      ],
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
