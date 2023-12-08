import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:intl/intl.dart';
import 'package:pay_me_mobile/core/di/locator.dart';
import 'package:pay_me_mobile/core/utilities/string_util.dart';
import 'package:pay_me_mobile/src/views/screens/transaction_history/transaction_history_viewmodel.dart';

import '../../../../../app_config/manager/font_manager.dart';
import '../../../../../core/constants/colors.dart';
import '../../transactions/transfer/components/dummy_bank.dart';
import '../../transactions/transfer/transfer_to_bank_screen.dart';
import '../transaction_details.dart';

class BuildTransactionList extends StatelessWidget {
  final TransactionHistoryViewModel model;
  const BuildTransactionList({super.key, required this.model});

  String formatTimestamp(DateTime timestamp) {
    return DateFormat('HH:mm a').format(timestamp);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0, right: 10.0),
      child: ListView.separated(
        itemBuilder: (context, index) {
          final bank = model.transactionList[index];
          final isDebit = bank.transactionType! == "Outflow" ||
              bank.transactionType! == "Airtime";
          return GestureDetector(
            onTap: () {
              navigationService
                  .push(TransactionDetailsScreen(transactionResponse: bank));
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(0),
                child: Container(
                  color: AppColors.lightBlue,
                  child: ListTile(
                    leading: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: isDebit
                              ? const Color.fromARGB(255, 82, 10, 10)
                              : AppColors.lightGreen,
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Icon(
                          Icons.money,
                          color: Colors.white,
                        )),
                    title: Text(
                      bank.transactionType! == "Outflow" ||
                              bank.transactionType! == "Airtime"
                          ? "Sent"
                          : "Received",
                      style: TextStyle(
                        fontFamily: GoogleFonts.alegreyaSans().fontFamily,
                        fontWeight: AppFontWeight.bold,
                        fontSize: AppFontSize.size14,
                      ),
                    ),
                    subtitle: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          formatTimestamp(DateTime.now()),
                          style: const TextStyle(
                            color: AppColors.lightBlack,
                            fontWeight: AppFontWeight.light,
                            fontSize: AppFontSize.size14,
                          ),
                        ),
                        Text(
                          bank.transactionType! == "Outflow" ||
                                  bank.transactionType! == "Airtime"
                              ? "- #${formatBalance(bank.amount!.toDouble())}"
                              : "+ #${formatBalance(bank.amount!.toDouble())}",
                          style: TextStyle(
                            color: bank.transactionType! == "Outflow" ||
                                    bank.transactionType! == "Airtime"
                                ? AppColors.transRed
                                : AppColors.lightGreen,
                            fontWeight: AppFontWeight.bold,
                            fontSize: AppFontSize.size14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
        separatorBuilder: (context, index) {
          return const SizedBox(height: 10);
        },
        itemCount: model.transactionList.length,
      ),
    );
  }
}


/*GroupedListView<DummyBank, String>(
          elements: dummyBanks,
          groupBy: (element) {
            return DateFormat('yyyy-MM-dd').format(element.timestamp);
          },
          groupSeparatorBuilder: (String value) {
            return Padding(
              padding: const EdgeInsets.only(left: 5.0, right: 5.0),
              child: Container(
                color: AppColors.deepWhite,
                height: 20,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(
                    DateFormat('dd MMMM, yyyy').format(DateTime.parse(value)),
                    style: const TextStyle(
                      fontWeight: AppFontWeight.bold,
                      fontSize: AppFontSize.size12,
                      color: AppColors.lightBlack,
                    ),
                  ),
                ),
              ),
            );
          },
          itemComparator: (item1, item2) =>
              item2.timestamp.compareTo(item1.timestamp),
          indexedItemBuilder: (context, element, index) {
            DummyBank bank = element;
            return GestureDetector(
              onTap: () {
                final transactionDetails = TransactionDetailsScreen(
                  amount: "₦ 20,000",
                  transactionTimestamp: bank.timestamp,
                  accountName: bank.accountName,
                  bankName: bank.name,
                );
                Navigator.pushNamed(context, "/home",
                    arguments: transactionDetails);
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(0),
                  child: Container(
                    color: AppColors.lightBlue,
                    child: ListTile(
                      leading: Image.asset(
                        bank.logo,
                        width: 30,
                        height: 30,
                      ),
                      title: Text(
                        bank.accountName,
                        style: TextStyle(
                          fontFamily: GoogleFonts.alegreyaSans().fontFamily,
                          fontWeight: AppFontWeight.bold,
                          fontSize: AppFontSize.size14,
                        ),
                      ),
                      subtitle: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            formatTimestamp(bank.timestamp),
                            style: const TextStyle(
                              color: AppColors.lightBlack,
                              fontWeight: AppFontWeight.light,
                              fontSize: AppFontSize.size14,
                            ),
                          ),
                          const Text(
                            "₦20,000.00",
                            style: TextStyle(
                              color: AppColors.lightGreen,
                              fontWeight: AppFontWeight.bold,
                              fontSize: AppFontSize.size14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),*/