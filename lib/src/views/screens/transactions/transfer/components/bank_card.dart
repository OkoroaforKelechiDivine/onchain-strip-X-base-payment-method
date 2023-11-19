import 'package:flutter/material.dart';

import '../../../../../../core/constants/colors.dart';

class BuildBankCard extends StatefulWidget {
  const BuildBankCard({super.key});

  @override
  State<BuildBankCard> createState() => _BuildBankCardState();
}

class _BuildBankCardState extends State<BuildBankCard> {
  @override
  Widget build(BuildContext context) {
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
              // child: Image.asset(
                // widget.bank.logo,
                // width: 40,
                // height: 60,
              // ),
            ),
            const SizedBox(width: 30),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Text(
                //   widget.bank.accountName,
                //   style: CustomStyles.bankInfoTextStyle,
                // ),
                // Text(
                //   widget.bank.accountNumber,
                //   style: CustomStyles.bankInfoTextStyle,
                // ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
