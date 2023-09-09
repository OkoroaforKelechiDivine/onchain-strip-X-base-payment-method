import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:pay_me_mobile/app_config/manager/font_manager.dart';
import 'package:pay_me_mobile/app_config/manager/theme_manager.dart';
import 'package:pay_me_mobile/screens/transaction_history/transaction_details.dart';

import '../../views/custom/custom_bottom_bar_navigation.dart';
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

  int _currentIndex = 0;


  PreferredSizeWidget buildAppBar() {
    return AppBar(
      title: const Center(
        child: Text(
          'Transaction History',
          style: TextStyle(
            color: AppColors.lightGreen,
            fontSize: AppFontSize.size24,
          ),
        ),
      ),
    );
  }


  Widget buildTransactionCard(String text) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
            side: const BorderSide(
              color: AppColors.lightGreen,
              width: 2.0,
            ),
          ),
          child: Center(
            child: Text(
              text,
              style: CustomStyles.transactionHistoryTextStyle,
            ),
          ),
        ),
      ),
    );
  }

  Widget buildTransactionCards() {
    return Padding(
      padding: const EdgeInsets.only(left: 5.0, top: 10),
      child: SizedBox(
        height: 80.0,
        child: Row(
          children: [
            buildTransactionCard("Transfer"),
            buildTransactionCard("Airtime"),
            buildTransactionCard("Buy Power"),
          ],
        ),
      ),
    );
  }

  Widget buildTransactionList() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(top: 10, left: 15.0, right: 10.0),
        child: ListView.builder(
          itemCount: dummyBanks.length,
          itemBuilder: (BuildContext context, int index) {
            DummyBank bank = dummyBanks[index];
            return GestureDetector(
              onTap: () {
                final transactionDetails = TransactionDetailsScreen(
                  amount: "₦ 20,000",
                  transactionTimestamp: bank.timestamp,
                );
                Navigator.pushNamed(context, "/transaction_details", arguments: transactionDetails);
              },

              child: Card(
                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 3.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Container(
                      color: AppColors.lightBlue,
                      child: ListTile(
                        leading: Image.asset(
                          bank.logo,
                          width: 40.0,
                          height: 40.0,
                        ),
                        title: Text(
                          bank.accountName,
                          style: TextStyle(
                            fontFamily: GoogleFonts.alegreyaSans().fontFamily,
                            fontWeight: AppFontWeight.bold,
                            fontSize: AppFontSize.size16,
                          ),
                        ),
                        subtitle: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              formatTimestamp(bank.timestamp),
                              style: const TextStyle(
                                color: AppColors.lightBlack,
                                fontWeight: AppFontWeight.bold,
                                fontSize: AppFontSize.size16,
                              ),
                            ),
                            const Text(
                              "₦20,000.00",
                              style: TextStyle(
                                color: AppColors.lightGreen,
                                fontWeight: AppFontWeight.bold,
                                fontSize: AppFontSize.size16,
                              ),
                            ),
                          ],
                        ),
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
    fontSize: AppFontSize.size18,
    color: AppColors.lightGreen,
    fontWeight: AppFontWeight.light,
  );
}
