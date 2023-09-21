import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:intl/intl.dart';
import 'package:pay_me_mobile/app_config/manager/font_manager.dart';
import 'package:pay_me_mobile/app_config/manager/theme_manager.dart';
import 'package:pay_me_mobile/data/screens/transaction_history/transaction_details.dart';

import '../../../views/custom/custom_bottom_bar_navigation.dart';
import '../transfer_to_bank/transfer_to_bank_screen.dart';

class TransactionHistoryScreen extends StatefulWidget {
  const TransactionHistoryScreen({Key? key}) : super(key: key);

  @override
  _TransactionHistoryScreenState createState() => _TransactionHistoryScreenState();
}

class _TransactionHistoryScreenState extends State<TransactionHistoryScreen> {

  String formatTimestamp(DateTime timestamp) {
    return DateFormat('HH:mm a').format(timestamp);
  }

  int _currentIndex = 1;

  PreferredSizeWidget buildAppBar() {
    return AppBar(
      title: const Padding(
        padding: EdgeInsets.only(left: 20),
        child: Text(
          'Transaction History',
          style: TextStyle(
            color: AppColors.lightGreen,
            fontSize: AppFontSize.size20,
          ),
        ),
      ),
    );
  }

  Widget buildTransactionCard(String text, String routeName) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
            side: const BorderSide(
              color: AppColors.lightGreen,
            ),
          ),
          child: GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, routeName);
            },
            child: Center(
              child: Text(
                text,
                style: CustomStyles.transactionHistoryTextStyle,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildTransactionCards() {
    return Padding(
      padding: const EdgeInsets.only(left: 5.0),
      child: SizedBox(
        height: 80.0,
        child: Row(
          children: [
            buildTransactionCard("Transfer", "/transfer"),
            buildTransactionCard("Airtime", "/buy_airtime"),
            buildTransactionCard("Buy Power", "/buy_power"),
          ],
        ),
      ),
    );
  }

  Widget buildTransactionList() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(left: 15.0, right: 10.0),
        child: GroupedListView<DummyBank, String>(
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
          itemComparator: (DummyBank item1, DummyBank item2) => item2.timestamp.compareTo(item1.timestamp),
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
                Navigator.pushNamed(context,
                    "/transaction_details",
                    arguments: transactionDetails
                );
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
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Column(
        children: [
          buildTransactionCards(),
          buildTransactionList(),
        ],
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}

class CustomStyles {
  static const TextStyle transactionHistoryTextStyle = TextStyle(
    fontSize: AppFontSize.size14,
    color: AppColors.lightGreen,
    fontWeight: AppFontWeight.light,
  );
}