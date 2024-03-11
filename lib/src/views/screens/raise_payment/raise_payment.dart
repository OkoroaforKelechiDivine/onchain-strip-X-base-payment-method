import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pay_me_mobile/app_config/manager/font_manager.dart';

import 'package:pay_me_mobile/core/utilities/app_fonts.dart';
import 'package:pay_me_mobile/core/cores.dart';
import 'package:pay_me_mobile/src/views/screens/transactions/transfer/transfer_to_bank_screen.dart';

import 'components/transaction_list.dart';


class RaisePaymentScreen extends StatefulWidget {
  const RaisePaymentScreen({Key? key}) : super(key: key);

  @override
  _RaisePaymentScreenState createState() => _RaisePaymentScreenState();
}

class _RaisePaymentScreenState extends State<RaisePaymentScreen> {

  String formatTimestamp(DateTime timestamp) {
    return DateFormat('HH:mm a').format(timestamp);
  }

  final int _currentIndex = 0;

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Column(
        children: [
          BuildTransactionList(dummyBanks: dummyBanks),
        ],
      ),
      // bottomNavigationBar: CustomBottomNavigationBar(
      //   currentIndex: _currentIndex,
      //   onTap: (int index) {
      //     setState(() {
      //       _currentIndex = index;
      //     });
      //   },
      // ),
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