import 'package:flutter/material.dart';
import 'package:pay_me_mobile/app_config/manager/theme_manager.dart';
import 'package:pay_me_mobile/screens/transfer_to_bank/transfer_to_bank_screen.dart';

import '../../views/custom/custom_bottom_bar_navigation.dart';

class ShowAllRecentTransactionsScreen extends StatelessWidget {
  final List<DummyBank> banks;

  const ShowAllRecentTransactionsScreen({Key? key, required this.banks}) : super(key: key);

  PreferredSizeWidget _buildAppBar() {
    return PreferredSize(
      preferredSize: const Size.fromHeight(80),
      child: AppBar(
        title: null,
        leading: const BackButton(),
        flexibleSpace: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 16.0, bottom: 8.0),
              child: Text(
                'All Beneficiaries',
                style: TextStyle(
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
            Navigator.pushNamed(
              context,
              "/beneficiary_details",
              arguments: bank,
            );
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

  Widget _buildBottomNavigationBar() {
    return CustomBottomNavigationBar(
      currentIndex: 0,
      onTap: (index) {
        if (index == 0) {
          // Handle index 0
        } else if (index == 1) {
          // Handle index 1
        } else if (index == 2) {
          // Handle index 2
        } else if (index == 3) {
          // Handle index 3
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(context),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }
}
