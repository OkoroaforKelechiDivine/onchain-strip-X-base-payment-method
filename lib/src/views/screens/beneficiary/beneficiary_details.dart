import 'package:flutter/material.dart';
import 'package:pay_me_mobile/core/utilities/app_fonts.dart';
import 'package:pay_me_mobile/src/views/screens/beneficiary/components/action_button.dart';
import 'package:pay_me_mobile/src/views/screens/beneficiary/components/circle_avatar.dart';

import '../../../../app_config/manager/font_manager.dart';
import 'package:pay_me_mobile/core/cores.dart';

import 'components/account_number_text.dart';
import 'components/accounts_header.dart';

class BeneficiaryDetailPage extends StatelessWidget {
  final Color circleColor;
  final String logo;
  final String accountNumber;
  final String accountName;

  const BeneficiaryDetailPage({
    Key? key,
    required this.circleColor,
    required this.accountName,
    required this.logo,
    required this.accountNumber,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: buildBody(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white10,
      title: Text(
        'Beneficiary',
        style: sans(
          fontSize: AppFontSize.size20,
          color: AppColors.lightGreen,
        ),
      ),
    );
  }

  Widget buildBody() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 30),
        BuildCircleAvatar(circleColor: circleColor, accountName: accountName),
        const SizedBox(height: 10),
        BuildAddAccountNumberText(accountNumber: accountNumber),
        const SizedBox(height: 20),
        const BuildActionButton(),
        const SizedBox(height: 25),
        const BuildNGNAccountsHeader(),
      ],
    );
  }
}
