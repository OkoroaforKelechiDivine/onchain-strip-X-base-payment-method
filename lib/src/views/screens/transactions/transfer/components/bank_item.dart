import 'package:flutter/material.dart';
import 'package:pay_me_mobile/src/views/screens/transactions/transfer/transfer_to_bank_screen.dart';

import '../../../../../../core/constants/colors.dart';
import '../../../../../../core/di/locator.dart';
import '../send_money.dart';
import 'dummy_bank.dart';

class BuildBankItem extends StatefulWidget {
  final DummyBank bank;

  const BuildBankItem({super.key, required this.bank});

  @override
  State<BuildBankItem> createState() => _BuildBankItemState();
}

class _BuildBankItemState extends State<BuildBankItem> {
  DummyBank bank = DummyBank as DummyBank;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            navigationService.push(SendMoneyScreen(bank: bank));
          },
          child: ListTile(
            leading: Image.asset(
              bank.logo,
              width: 40,
              height: 40,
            ),
            title: Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    bank.accountName,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    bank.name,
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            subtitle: Text(
              'Account Number: ${bank.accountNumber}',
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(left: 20, right: 20),
          child: Divider(
            height: 3,
            color: AppColors.darkWhite,
            thickness: 2,
          ),
        ),
      ],
    );
  }
}
