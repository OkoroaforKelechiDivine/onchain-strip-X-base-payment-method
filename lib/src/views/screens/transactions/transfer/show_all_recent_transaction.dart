import 'package:flutter/material.dart';
import 'package:pay_me_mobile/core/utilities/app_fonts.dart';
import 'package:pay_me_mobile/src/views/screens/transactions/transfer/components/body.dart';
import 'package:pay_me_mobile/core/cores.dart';

import 'components/dummy_bank.dart';


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
              padding: const EdgeInsets.only(left: 16, bottom: 8),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: BuildBody(context: context),
    );
  }
}
