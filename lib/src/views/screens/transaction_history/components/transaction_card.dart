import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pay_me_mobile/core/constants/colors.dart';

import '../../../../../app_config/manager/font_manager.dart';

class BuildTransactionCard extends StatelessWidget {
  final bool isSent;
  final String amount;
  final DateTime transactionTimestamp;
  final String accountName;
  final String description;

  const BuildTransactionCard(
      {super.key,
      required this.isSent,
      required this.amount,
      required this.transactionTimestamp,
      required this.accountName,
      required this.description});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: isSent ? 200 : 0,
        right: isSent ? 0 : 200,
        top: 50,
      ),
      child: GestureDetector(
        onTap: () {
          // navigationService.push(
          //     //TransactionDetailsScreen(transactionResponse: Transa())
          //     );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 100,
              width: 120,
              child: Card(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20.0),
                    topLeft: Radius.circular(20.0),
                    bottomLeft: Radius.circular(20.0),
                  ),
                ),
                color: isSent
                    ? AppColors.lightGreen
                    : AppColors.lightBlue.withOpacity(0.5),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        amount,
                        style: const TextStyle(fontSize: AppFontSize.size18),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        description,
                        style: const TextStyle(fontSize: AppFontSize.size18),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.only(left: 50),
              child: Text(
                ""
                "${transactionTimestamp.hour.toString().padLeft(2, '0')}:"
                "${transactionTimestamp.minute.toString().padLeft(2, '0')} "
                "${transactionTimestamp.hour >= 12 ? 'PM' : 'AM'}",
                style: TextStyle(
                  fontSize: AppFontSize.size10,
                  color: AppColors.lightBlack,
                  fontWeight: AppFontWeight.bold,
                  fontFamily: GoogleFonts.inter().fontFamily,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
