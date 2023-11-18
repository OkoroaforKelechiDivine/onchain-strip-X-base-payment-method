import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pay_me_mobile/app_config/manager/theme_manager.dart';
import 'package:pay_me_mobile/src/views/screens/raise_payment/components/info_row.dart';
import 'package:pay_me_mobile/src/views/screens/transaction_history/repeat_transaction.dart';
import 'package:pay_me_mobile/core/utilities/app_fonts.dart';
import 'package:pay_me_mobile/core/cores.dart';

import '../../../../app_config/manager/font_manager.dart';
import '../../../custom/custom_bottom_bar_navigation.dart';

class TransactionDetailsScreen extends StatefulWidget {
  final String amount;
  final DateTime transactionTimestamp;
  final String accountName;
  final String bankName;

  const TransactionDetailsScreen({
    Key? key,
    required this.amount,
    required this.transactionTimestamp,
    required this.accountName,
    required this.bankName,
  }) : super(key: key);

  @override
  _TransactionDetailsScreenState createState() => _TransactionDetailsScreenState();
}

class _TransactionDetailsScreenState extends State<TransactionDetailsScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    String formattedTimestamp = DateFormat('MMMM dd, yyyy \'at\' hh:mm a').format(widget.transactionTimestamp);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white10,
        title: Text(
          'Transaction',
          style: sans(
            color: AppColors.lightGreen,
            fontSize: AppFontSize.size20,
          ),
        )
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Center(
              child: Padding(
                padding: EdgeInsets.only(top: 20),
                child: Text(
                  'Amount',
                  style: TextStyle(
                    fontSize: AppFontSize.size20,
                    color: AppColors.lightGreen,
                    fontWeight: AppFontWeight.bold,
                  ),
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 5),
                child: Text(
                  widget.amount,
                  style: const TextStyle(
                    fontSize: AppFontSize.size20,
                    fontWeight: AppFontWeight.bold,
                    color: AppColors.lightBlack,
                  ),
                ),
              ),
            ),
            Center(
              child: Text(
                'On $formattedTimestamp',
                style: const TextStyle(
                  fontSize: AppFontSize.size16,
                  fontWeight: AppFontWeight.medium,
                  color: AppColors.lightBlack,
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 30, right: 10, left: 10),
              child: Column(
                children: [
                  BuildInfoRow(label: 'Account Name', value: widget.accountName),
                  const SizedBox(height: 10),
                  _buildDivider(),
                  const SizedBox(height: 10),
                  BuildInfoRow(label: 'To', value: widget.bankName),
                  const SizedBox(height: 15),
                  _buildDivider(),
                  const SizedBox(height: 15),
                  const BuildInfoRow(label: 'Description', value:'Garri'),
                  const SizedBox(height: 15),
                  _buildDivider(),
                  const SizedBox(height: 15),
                  const BuildInfoRow(label: 'Outward Transfer', value: '₦ 0.00'),
                  const SizedBox(height: 15),
                  _buildDivider(),
                  const SizedBox(height: 15),
                  const BuildInfoRow(label: 'Payment Method', value: 'Fees'),
                  const SizedBox(height: 15),
                  _buildDivider(),
                  const SizedBox(height: 15),
                  const BuildInfoRow(label: 'Status', value: 'Successful'),
                  const SizedBox(height: 15),
                  _buildDivider(),
                  const SizedBox(height: 15),
                  const BuildInfoRow(label: 'Transaction Reference', value: '090267230811083838'),
                  const SizedBox(height: 15),
                  _buildDivider(),
                  const SizedBox(height: 15),
                ],
              ),
            ),
          ],
        ),
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

  void _showHelloDialog(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return SingleChildScrollView(
          child: Container(
            color: AppColors.deepWhite,
            padding: const EdgeInsets.all(16),
            child:  const Center(
              child: Column(
                children: [
                  Text('Share Receipt',
                      style: TextStyle(
                          fontSize: AppFontSize.size20,
                          fontWeight: AppFontWeight.bold,
                          color: AppColors.lightBlack
                      ),
                  ),
                  SizedBox(height: 40),
                  Text("PDF",
                      style: TextStyle(
                          fontSize: AppFontSize.size16,
                          fontWeight: AppFontWeight.bold,
                          color: AppColors.lightBlack
                      )
                  ),
                  SizedBox(height: 40),
                  Text("Image",
                      style: TextStyle(
                          fontSize: AppFontSize.size16,
                          fontWeight: AppFontWeight.bold,
                          color: AppColors.lightBlack
                      )
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildDivider() {
    return Container(
      color: AppColors.lightGreen,
      height: 0.5,
    );
  }
}
