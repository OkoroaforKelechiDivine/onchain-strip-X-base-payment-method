import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pay_me_mobile/app_config/manager/theme_manager.dart';
import 'package:pay_me_mobile/screens/transaction_history/repeat_transaction.dart';

import '../../app_config/manager/font_manager.dart';
import '../../views/custom/custom_bottom_bar_navigation.dart';

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
        title: const Center(
          child: Padding(
            padding: EdgeInsets.only(right: 50.0),
            child: Text(
              'Raise Payment',
              style: TextStyle(
                color: AppColors.lightGreen,
                fontSize: AppFontSize.size20,
              ),
            ),
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
                      child: _buildStatusCircle(widget.status),
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
                  _buildInfoRow('Account Name', widget.accountName),
                  const SizedBox(height: 10),
                  _buildDivider(),
                  const SizedBox(height: 10),
                  _buildInfoRow('To', widget.bankName),
                  const SizedBox(height: 15),
                  _buildDivider(),
                  const SizedBox(height: 15),
                  _buildInfoRow('Description', 'Garri'),
                  const SizedBox(height: 15),
                  _buildDivider(),
                  const SizedBox(height: 15),
                  _buildInfoRow('Outward Transfer', '₦ 0.00'),
                  const SizedBox(height: 15),
                  _buildDivider(),
                  const SizedBox(height: 15),
                  _buildInfoRow('Payment Method', 'Fees'),
                  const SizedBox(height: 15),
                  _buildDivider(),
                  const SizedBox(height: 15),
                  _buildInfoRow('Transaction Reference', '090267230811083838'),
                  const SizedBox(height: 15),
                  _buildDivider(),
                  const SizedBox(height: 15),
                  _buildMoreActions(),
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

  Widget _buildStatusCircle(String status) {
    Color circleColor = AppColors.brightGreen;

    if (status == 'Declined') {
      circleColor = AppColors.errorRed;
    } else if (status == 'Pending') {
      circleColor = AppColors.dullOrange;
    }

    return Row(
      children: [
        Container(
          width: 15,
          height: 15,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: circleColor,
          ),
        ),
        const SizedBox(width: 5),
        Text(
          status,
          style: TextStyle(
            fontSize: AppFontSize.size12,
            color: circleColor,
            fontWeight: AppFontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Row(
      children: [
        Text(
          '$label ',
          style: const TextStyle(
            fontSize: AppFontSize.size16,
            fontWeight: AppFontWeight.bold,
            color: AppColors.lightBlack,
          ),
        ),
        const Spacer(),
        Text(
          value,
          style: const TextStyle(
            color: AppColors.lightBlack,
            fontWeight: AppFontWeight.light,
            fontSize: AppFontSize.size16,
          ),
        )
      ],
    );
  }

  Widget _buildDivider() {
    return Container(
      color: AppColors.lightGreen,
      height: 0.5,
    );
  }

  Widget _buildMoreActions() {
    if (widget.status == 'Approved') {
      return Container();
    } else if (widget.status == 'Declined') {
      return const Row(
        children: [
          Padding(
            padding: EdgeInsets.only(right: 200, bottom: 20),
            child: Text(
              "Reason:",
              style: TextStyle(
                color: AppColors.lightBlack,
                fontWeight: AppFontWeight.bold,
                fontSize: AppFontSize.size18,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 20, bottom: 20),
            child: Text(
              "blah blah",
              style: TextStyle(
                color: AppColors.lightBlack,
                fontWeight: AppFontWeight.light,
                fontSize: AppFontSize.size16,
              ),
            ),
          ),
        ],
      );

    } else {
      return Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(right: 240, bottom: 20),
            child: Text(
              "More Actions",
              style: TextStyle(
                color: AppColors.lightBlack,
                fontWeight: AppFontWeight.bold,
                fontSize: AppFontSize.size18,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => RepeatTransactionScreen(
                    amount: widget.amount,
                    transactionTimestamp: widget.transactionTimestamp,
                    accountName: widget.accountName,
                    description: 'Garri',
                    isSent: true,
                  ),
                ),
              );
            },
            child: _buildActionRow(
              'assets/jpg/reset.jpg',
              'Terminate Transaction',
              Icons.arrow_forward_ios,
            ),
          ),
        ],
      );
    }
  }

  Widget _buildActionRow(String imagePath, String label, IconData icon) {
    return Row(
      children: [
        Image.asset(
          imagePath,
          width: 20,
          height: 20,
        ),
        const SizedBox(width: 10),
        Text(
          label,
          style: const TextStyle(
            fontSize: AppFontSize.size16,
            fontWeight: AppFontWeight.bold,
            color: AppColors.lightBlack,
          ),
        ),
        const Spacer(),
        Icon(icon),
      ],
    );
  }
}