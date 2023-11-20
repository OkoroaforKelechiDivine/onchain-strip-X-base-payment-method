import 'package:flutter/material.dart';
import 'package:pay_me_mobile/src/views/screens/transaction_history/components/submit_button.dart';
import 'package:pay_me_mobile/src/views/screens/transactions/transfer/components/amount_error_message.dart';
import 'package:pay_me_mobile/src/views/screens/transactions/transfer/components/amount_input.dart';
import 'package:pay_me_mobile/src/views/screens/transactions/transfer/components/balance_section.dart';
import 'package:pay_me_mobile/src/views/screens/transactions/transfer/components/bank_card.dart';
import 'package:pay_me_mobile/src/views/screens/transactions/transfer/components/send_money.dart';
import 'package:pay_me_mobile/core/cores.dart';

import '../../../../../app_config/manager/font_manager.dart';
import 'components/dummy_bank.dart';

class SendMoneyScreen extends StatefulWidget {
  final DummyBank bank;

  const SendMoneyScreen({Key? key, required this.bank}) : super(key: key);

  @override
  _SendMoneyScreenState createState() => _SendMoneyScreenState();
}

class _SendMoneyScreenState extends State<SendMoneyScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white10,
        elevation: 0,
        title: const Text(''),
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              BuildBankCard(),
              SizedBox(height: 20),
              BuildSendMoneySection(),
              SizedBox(height: 50),
              BuildAmountInput(),
              BuildAmountErrorMessage(),
              SizedBox(height: 30),
              BuildBalanceSection(),
              BuildSubmitButton(),
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
