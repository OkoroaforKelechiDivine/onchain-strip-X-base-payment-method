import 'package:flutter/material.dart';
import 'package:pay_me_mobile/core/cores.dart';

import '../../../../../app_config/manager/font_manager.dart';

class BuildAddAccountNumberText extends StatelessWidget {
  final String accountNumber;

  const BuildAddAccountNumberText({
    Key? key,
    required this.accountNumber,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        accountNumber,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: AppFontSize.size20,
          color: AppColors.lightBlack,
        ),
      ),
    );
  }
}
