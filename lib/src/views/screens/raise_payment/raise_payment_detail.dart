import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pay_me_mobile/app_config/manager/font_manager.dart';
import 'package:pay_me_mobile/core/utilities/app_fonts.dart';
import 'package:pay_me_mobile/core/cores.dart';
import 'package:pay_me_mobile/src/custom/custom_bottom_bar_navigation.dart';
import 'package:pay_me_mobile/src/views/screens/raise_payment/components/info_row.dart';
import 'package:pay_me_mobile/src/views/screens/raise_payment/components/more_actions.dart';
import 'package:pay_me_mobile/src/views/screens/raise_payment/components/status_circle.dart';
import 'package:pay_me_mobile/src/views/screens/transaction_history/repeat_transaction.dart';

class RaisePaymentDetailsScreen extends StatefulWidget {
  final String amount;
  final DateTime transactionTimestamp;
  final String accountName;
  final String bankName;
  final String status;

  const RaisePaymentDetailsScreen({
    Key? key,
    required this.amount,
    required this.transactionTimestamp,
    required this.accountName,
    required this.bankName,
    required this.status,
  }) : super(key: key);

  @override
  _RaisePaymentDetailsScreenState createState() => _RaisePaymentDetailsScreenState();
}

class _RaisePaymentDetailsScreenState extends State<RaisePaymentDetailsScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    String formattedTimestamp = DateFormat('MMMM dd, yyyy \'at\' hh:mm a').format(widget.transactionTimestamp);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white10,
        elevation: 0,
        title:  Text(
          'Raise Payment',
          style: sans(
            color: AppColors.lightGreen,
            fontSize: AppFontSize.size20,
          ),
        ),
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 20, left: 150),
                child: Row(
                  children: [
                    const Text(
                      'Amount',
                      style: TextStyle(
                        fontSize: AppFontSize.size20,
                        color: AppColors.lightGreen,
                        fontWeight: AppFontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 65),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: BuildStatusCircle(status: widget.status)
                    ),
                  ],
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
                  const BuildInfoRow(label: 'Description', value: 'Garri'),
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
                  const BuildInfoRow(label: 'Transaction Reference', value: '090267230811083838'),
                  const SizedBox(height: 15),
                  _buildDivider(),
                  const SizedBox(height: 15),
                  BuildMoreActions(status: widget.status, onTap: () {
                    navigationService.push(
                      RepeatTransactionScreen(
                        amount: widget.amount,
                        transactionTimestamp: widget.transactionTimestamp,
                        accountName: widget.accountName,
                        description: 'Garri',
                        isSent: true,
                      ),
                    );
                  }
                  ),
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

  Widget _buildDivider() {
    return Container(
      color: AppColors.lightGreen,
      height: 0.5,
    );
  }
}