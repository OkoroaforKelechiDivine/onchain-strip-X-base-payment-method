import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pay_me_mobile/core/cores.dart';
import 'package:pay_me_mobile/src/views/screens/transactions/transfer/transfer_viewmmodel.dart';

import '../../../../../../app_config/manager/font_manager.dart';
import '../../../../../../core/constants/colors.dart';
import '../../../../../../core/di/locator.dart';
import '../../../transaction_history/repeat_transaction.dart';
import '../show_all_recent_transaction.dart';
import '../transfer_to_bank_screen.dart';
import 'dummy_bank.dart';

class BuildRecentCard extends StatelessWidget {
  final TransferViewModel model;

  const BuildRecentCard({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6.0),
      child: Card(
        color: AppColors.pureWhite,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          children: [
            const ListTile(
              title: Row(
                children: [
                  Expanded(
                    child: Text(
                      'Recents',
                      style: TextStyle(
                        color: AppColors.lightGreen,
                        fontWeight: AppFontWeight.bold,
                        fontSize: AppFontSize.size14,
                      ),
                    ),
                  ),
                  // GestureDetector(
                  //   onTap: () {
                  //     //navigationService.push(
                  //     //  ShowAllRecentTransactionsScreen(banks: dummyBanks));
                  //   },
                  //   child: const Row(
                  //     children: [
                  //       Text(
                  //         'View All',
                  //         style: TextStyle(
                  //           color: AppColors.lightGrey,
                  //           fontWeight: AppFontWeight.bold,
                  //           fontSize: AppFontSize.size14,
                  //         ),
                  //       ),
                  //       SizedBox(width: 10),
                  //       Icon(
                  //         Icons.arrow_forward_ios,
                  //         color: AppColors.darkWhite,
                  //         size: AppFontSize.size12,
                  //       ),
                  //     ],
                  //   ),
                  // ),
                ],
              ),
            ),
            model.currentBeneficiaries.isEmpty
                ? const Center(
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 16.0),
                      child: AppText("No Recent Transaction"),
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: model.currentBeneficiaries
                          .asMap()
                          .entries
                          .map((entry) {
                        return Card(
                          elevation: 0,
                          child: GestureDetector(
                            onTap: () {
                              model.fromBeneficiary(entry.value);
                            },
                            child: Container(
                              color: AppColors.pureWhite,
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Image.asset(
                                        'assets/png/appIcon.png',
                                        width: 40,
                                        height: 40,
                                        fit: BoxFit.contain,
                                      ),
                                      const SizedBox(width: 10),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            entry.value.name,
                                            style: TextStyle(
                                              fontWeight: AppFontWeight.bold,
                                              fontSize: AppFontSize.size14,
                                              fontFamily:
                                                  GoogleFonts.alegreyaSans()
                                                      .fontFamily,
                                              color: AppColors.lightBlack,
                                            ),
                                          ),
                                          Text(
                                            entry.value.bank,
                                            style: TextStyle(
                                              fontWeight: AppFontWeight.light,
                                              fontSize: AppFontSize.size14,
                                              fontFamily:
                                                  GoogleFonts.alegreyaSans()
                                                      .fontFamily,
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
