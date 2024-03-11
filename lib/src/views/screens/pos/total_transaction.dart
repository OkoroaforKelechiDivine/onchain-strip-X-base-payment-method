import 'package:flutter/material.dart';
import 'package:pay_me_mobile/app_config/manager/font_manager.dart';
import 'package:pay_me_mobile/core/utilities/app_fonts.dart';
import 'package:pay_me_mobile/core/cores.dart';

import 'components/pos_card_text_with_button.dart';

class TotalTransactionScreen extends StatefulWidget {
  const TotalTransactionScreen({Key? key}) : super(key: key);

  @override
  State<TotalTransactionScreen> createState() => _TotalTransactionScreenState();
}

class _TotalTransactionScreenState extends State<TotalTransactionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white10,
        title: Text(
          "Transactions",
          style: sans(
            fontSize: AppFontSize.size20,
            color: AppColors.lightGreen,
          ),
        ),
        // actions: [
        //   Padding(
        //     padding: const EdgeInsets.all(10),
        //     child: SizedBox(
        //       width:  150,
        //       child: TextField(
        //         decoration: const InputDecoration(
        //           hintText: "Search",
        //           hintStyle: TextStyle(
        //             color: AppColors.lightGrey,
        //             fontSize: AppFontSize.size14,
        //           ),
        //           border: UnderlineInputBorder(),
        //           filled: true,
        //           fillColor: AppColors.pureWhite,
        //           prefixIcon: Icon(
        //             Icons.search,
        //             size: AppFontSize.size16,
        //           ),
        //         ),
        //         onSubmitted: (String value) {
        //           print("Search for: $value");
        //         },
        //       ),
        //     ),
        //   ),
        // ],
      ),
      body: const Column(
        children: [
          BuildPosCardTextWithButton(text: "Transaction 1"),
          BuildPosCardTextWithButton(text: "Transaction 2"),
          BuildPosCardTextWithButton(text: "Transaction 3"),
        ],
      ),
    );
  }
}
