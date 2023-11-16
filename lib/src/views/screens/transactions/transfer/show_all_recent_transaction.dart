import 'package:flutter/material.dart';
import 'package:pay_me_mobile/core/utilities/app_fonts.dart';
import 'package:pay_me_mobile/src/views/screens/transactions/transfer/send_money.dart';
import 'package:pay_me_mobile/src/views/screens/transactions/transfer/transfer_to_bank_screen.dart';
import 'package:pay_me_mobile/core/cores.dart';


class ShowAllRecentTransactionsScreen extends StatelessWidget {
  final List<DummyBank> banks;

  const ShowAllRecentTransactionsScreen({Key? key, required this.banks}) : super(key: key);

  PreferredSizeWidget _buildAppBar() {
    return PreferredSize(
      preferredSize: const Size.fromHeight(80),
      child: AppBar(
        elevation: 0,
        backgroundColor: Colors.white10,
        title: null,
        // leading: const BackButton(),
        flexibleSpace:  Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children:  [
            Padding(
              padding: EdgeInsets.only(left: 16.0, bottom: 8.0),
              child: Text(
                'All Beneficiaries',
                style: sans(
                  color: AppColors.lightGreen,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Scrollbar(
      thumbVisibility: true,
      trackVisibility: true,
      child: SingleChildScrollView(
        child: Column(
          children: banks.map((bank) => _buildBankItem(context, bank)).toList(),
        ),
      ),
    );
  }

  Widget _buildBankItem(BuildContext context, DummyBank bank) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            //pushNavigation(context: context, widget: SendMoneyScreen(bank: bank));
            navigationService.push(SendMoneyScreen(bank: bank));
            // Navigator.pushNamed(
            //   context,
            //   "/beneficiary_details",
            //   arguments: bank,
            // );
          },
          child: ListTile(
            leading: Image.asset(
              bank.logo,
              width: 40,
              height: 40,
            ),
            title: Padding(
              padding: const EdgeInsets.only(top: 16.0),
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
          padding: EdgeInsets.only(left: 20.0, right: 20.0),
          child: Divider(
            height: 3,
            color: AppColors.darkWhite,
            thickness: 2,
          ),
        ),
      ],
    );
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(context),
    );
  }
}
