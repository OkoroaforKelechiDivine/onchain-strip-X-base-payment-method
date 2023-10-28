import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:intl/intl.dart';
import 'package:pay_me_mobile/app_config/manager/font_manager.dart';
import 'package:pay_me_mobile/app_config/manager/theme_manager.dart';
import 'package:pay_me_mobile/data/screens/raise_payment/raise_payment_detail.dart';
import 'package:pay_me_mobile/src/core/utilities/app_fonts.dart';

import '../../custom/custom_bottom_bar_navigation.dart';
import '../../../src/views/screens/transactions/transfer/transfer_to_bank_screen.dart';

class RaisePaymentScreen extends StatefulWidget {
  const RaisePaymentScreen({Key? key}) : super(key: key);

  @override
  _RaisePaymentScreenState createState() => _RaisePaymentScreenState();
}

class _RaisePaymentScreenState extends State<RaisePaymentScreen> {

  String formatTimestamp(DateTime timestamp) {
    return DateFormat('HH:mm a').format(timestamp);
  }

  int _currentIndex = 0;

  PreferredSizeWidget buildAppBar() {
    return AppBar(
     elevation: 0,
      backgroundColor: Colors.white10,
      title: Text(
        'Raise Payment',
        style: sans(
          color: AppColors.lightGreen,
          fontSize: AppFontSize.size20,
        ),
      )
      // Row(
      //   children: [
      //     const Text(
      //       'Raise Payment',
      //       style: TextStyle(
      //         color: AppColors.lightGreen,
      //         fontSize: AppFontSize.size20,
      //       ),
      //     ),
      //     Padding(
      //       padding: const EdgeInsets.only(left: 45.0),
      //       child: ClipRRect(
      //         borderRadius: BorderRadius.circular(8.0),
      //         child: Container(
      //           color: AppColors.lightGreen,
      //           constraints: const BoxConstraints(maxWidth: 80, maxHeight: 25),
      //           child: ElevatedButton(
      //             onPressed: () {
      //               Navigator.pushNamed(context, "/transfer");
      //             },
      //             style: ElevatedButton.styleFrom(
      //               padding: const EdgeInsets.all(0),
      //             ),
      //             child: Row(
      //               children: const [
      //                 Padding(
      //                   padding: EdgeInsets.only(left: 15.0),
      //                   child: Text(
      //                     'Add New',
      //                     style: TextStyle(
      //                       fontSize: AppFontSize.size12,
      //                       fontWeight: AppFontWeight.medium,
      //                       color: AppColors.pureWhite,
      //                     ),
      //                   ),
      //                 ),
      //               ],
      //             ),
      //           ),
      //         ),
      //       ),
      //     ),
      //   ],
      // ),
    );
  }

  Widget buildTransactionList() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(left: 15.0, right: 10.0, top: 20),
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
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => RaisePaymentDetailsScreen(
                    amount: "₦ 20,000",
                    transactionTimestamp: bank.timestamp,
                    accountName: bank.accountName,
                    bankName: bank.name,
                    status: bank.status
                  )
                ));
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
                          Text(
                            bank.status,
                            style: TextStyle(
                              color: bank.status == 'Approved' ? AppColors.brightGreen : bank.status == 'Declined' ? AppColors.errorRed : AppColors.dullOrange,
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