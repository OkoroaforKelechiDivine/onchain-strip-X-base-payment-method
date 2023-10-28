import 'package:flutter/material.dart';
import 'package:pay_me_mobile/app_config/manager/font_manager.dart';
import 'package:pay_me_mobile/app_config/manager/theme_manager.dart';
import 'package:pay_me_mobile/src/core/utilities/app_fonts.dart';

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
      body: Column(
        children: [
          _buildTotalTransaction(context, "Transaction 1"),
          _buildTotalTransaction(context, "Transaction 2"),
          _buildTotalTransaction(context, "Transaction 3"),
        ],
      ),
    );
  }

  Widget _buildTotalTransaction(BuildContext context, String text) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(10),
      child: Card(
        child: TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const TotalTransactionScreen()),
            );
          },
          child: Text(
            text,
            style: const TextStyle(
              color: AppColors.lightBlack,
            ),
          ),
        ),
      ),
    );
  }
}
