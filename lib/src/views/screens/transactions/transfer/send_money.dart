import 'package:flutter/material.dart';
import 'package:pay_me_mobile/data/model/response/transaction_response/bank_response.dart';
import 'package:pay_me_mobile/data/model/response/transaction_response/beneficiary_detail_response.dart';
import 'package:pay_me_mobile/src/views/screens/transaction_history/components/submit_button.dart';
import 'package:pay_me_mobile/src/views/screens/transactions/transfer/components/amount_error_message.dart';
import 'package:pay_me_mobile/src/views/screens/transactions/transfer/components/amount_input.dart';
import 'package:pay_me_mobile/src/views/screens/transactions/transfer/components/balance_section.dart';
import 'package:pay_me_mobile/src/views/screens/transactions/transfer/components/bank_card.dart';
import 'package:pay_me_mobile/src/views/screens/transactions/transfer/components/send_money.dart';
import 'package:pay_me_mobile/core/cores.dart';
import 'package:pay_me_mobile/src/views/screens/transactions/transfer/send_money_viewmodel.dart';
import 'package:stacked/stacked.dart';

import '../../../../../app_config/manager/font_manager.dart';
import 'components/dummy_bank.dart';

class SendMoneyScreen extends StatefulWidget {
  final BankResponse selectedBank;
  final BeneficiaryDetailResponse beneficiaryDetailResponse;

  const SendMoneyScreen(
      {Key? key,
      required this.selectedBank,
      required this.beneficiaryDetailResponse})
      : super(key: key);

  @override
  _SendMoneyScreenState createState() => _SendMoneyScreenState();
}

class _SendMoneyScreenState extends State<SendMoneyScreen> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SendMoneyViewModel>.reactive(
      viewModelBuilder: () => SendMoneyViewModel(),
      builder: (context, model, _) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white10,
            elevation: 0,
            title: const Text(''),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  const BuildBankCard(),
                  const SizedBox(height: 20),
                  const BuildSendMoneySection(),
                  const SizedBox(height: 50),
                  BuildAmountInput(model: model),
                  const SizedBox(height: 30),
                  BuildBalanceSection(
                    model: model,
                  ),
                  // const BuildSubmitButton(),
                  const SizedBox(height: 30),
                  AppCustomButton(
                    width: 200,
                    loading: model.isSendingMoney,
                    title: 'Send Money',
                    onPressed: () async {
                      await model.sendMoney(
                        selectedbank: widget.selectedBank,
                        beneficiary: widget.beneficiaryDetailResponse,
                      );
                      //navigationService.push(SendMoneyScreen(bank: bank));
                    },
                  )
                ],
              ),
            ),
          ),
        );
      },
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
