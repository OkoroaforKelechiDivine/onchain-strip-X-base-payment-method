import 'package:flutter/material.dart';
import 'package:pay_me_mobile/src/views/screens/transaction_history/components/card.dart';
import 'package:pay_me_mobile/src/views/screens/transaction_history/components/transaction_list.dart';
import 'package:pay_me_mobile/core/utilities/app_fonts.dart';
import 'package:pay_me_mobile/core/cores.dart';

class TransactionHistoryScreen extends StatefulWidget {
  const TransactionHistoryScreen({Key? key}) : super(key: key);

  @override
  _TransactionHistoryScreenState createState() => _TransactionHistoryScreenState();
}

class _TransactionHistoryScreenState extends State<TransactionHistoryScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text('Transaction History', style: sans(color: AppColors.lightGreen),),),
      body: const Column(
        children: [
          BuildCardWidget(),
          BuildTransactionList(),
        ],
      ),
    );
  }
}
