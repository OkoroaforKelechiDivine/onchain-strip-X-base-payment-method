import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../../app_config/manager/font_manager.dart';
import '../../../../../../core/constants/colors.dart';
import '../../../../../../core/di/locator.dart';
import '../../../transaction_history/repeat_transaction.dart';
import '../show_all_recent_transaction.dart';
import '../transfer_to_bank_screen.dart';
import 'dummy_bank.dart';

class BuildRecentCard extends StatefulWidget {
  final BuildContext context;

  const BuildRecentCard({super.key, required this.context});

  @override
  State<BuildRecentCard> createState() => _BuildRecentCardState();
}

class _BuildRecentCardState extends State<BuildRecentCard> {
  @override
  Widget build(BuildContext context) {
    List<DummyBank> firstFourBanks = dummyBanks.take(4).toList();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6.0),
      child: Card(
        color: AppColors.pureWhite,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          children: [
            ListTile(
              title: Row(
                children: [
                  const Expanded(
                    child: Text(
                      'Recents',
                      style: TextStyle(
                        color: AppColors.lightGreen,
                        fontWeight: AppFontWeight.bold,
                        fontSize: AppFontSize.size14,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      navigationService.push(ShowAllRecentTransactionsScreen(banks: dummyBanks));
                    },
                    child:  const Row(
                      children: [
                        Text(
                          'View All',
                          style: TextStyle(
                            color: AppColors.lightGrey,
                            fontWeight: AppFontWeight.bold,
                            fontSize: AppFontSize.size14,
                          ),
                        ),
                        SizedBox(width: 10),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: AppColors.darkWhite,
                          size: AppFontSize.size12,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: firstFourBanks.asMap().entries.map((entry) {
                  final transaction = entry.value;
                  final bankLogo = transaction.logo;
                  final accountName = transaction.accountName;
                  return Card(
                    elevation: 0,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RepeatTransactionScreen(
                              amount: "",
                              transactionTimestamp: DateTime.now(),
                              accountName: "",
                              description: "",
                              isSent: false,
                            ),
                          ),
                        );
                      },
                      child: Container(
                        color: AppColors.pureWhite,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Image.asset(
                                  bankLogo,
                                  width: 40,
                                  height: 40,
                                  fit: BoxFit.cover,
                                ),
                                const SizedBox(width: 10),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      accountName,
                                      style: TextStyle(
                                        fontWeight: AppFontWeight.bold,
                                        fontSize: AppFontSize.size14,
                                        fontFamily: GoogleFonts.alegreyaSans().fontFamily,
                                        color: AppColors.lightBlack,
                                      ),
                                    ),
                                    Text(
                                      transaction.name,
                                      style: TextStyle(
                                        fontWeight: AppFontWeight.light,
                                        fontSize: AppFontSize.size14,
                                        fontFamily: GoogleFonts.alegreyaSans().fontFamily,
                                        color: AppColors.lightBlack,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const Divider(
                              height: 30,
                              thickness: 1,
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
