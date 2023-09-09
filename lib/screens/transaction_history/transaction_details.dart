import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pay_me_mobile/app_config/manager/theme_manager.dart';
import 'package:pay_me_mobile/screens/transaction_history/repeat_transaction.dart';

import '../../app_config/manager/font_manager.dart';
import '../../views/custom/custom_bottom_bar_navigation.dart';

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
        title: Row(
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 50.0),
              child: Center(
                child: Text(
                  'Transaction',
                  style: TextStyle(
                    color: AppColors.lightGreen,
                    fontSize: AppFontSize.size22,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 50),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Container(
                  color: AppColors.lightGreen,
                  constraints: const BoxConstraints(maxWidth: 100, maxHeight: 35),
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text(
                      'Share',
                      style: TextStyle(
                        fontSize: AppFontSize.size12,
                        fontWeight: AppFontWeight.medium,
                        color: AppColors.pureWhite,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Center(
              child: Padding(
                padding: EdgeInsets.only(top: 8.0, right: 30),
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
                padding: const EdgeInsets.only(bottom: 10, right: 30),
                child: Text(
                  widget.amount,
                  style: const TextStyle(
                    fontSize: AppFontSize.size24,
                    fontWeight: AppFontWeight.bold,
                    color: AppColors.lightBlack,
                  ),
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 10, right: 30),
                child: Text(
                  'On $formattedTimestamp',
                  style: const TextStyle(
                    fontSize: AppFontSize.size16,
                    fontWeight: AppFontWeight.medium,
                    color: AppColors.lightBlack,
                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 30, right: 20, left: 20),
              child: Column(
                children: [
                  _buildInfoRow('Account Name', widget.accountName),
                  const SizedBox(height: 20),
                  _buildDivider(),
                  const SizedBox(height: 20),
                  _buildInfoRow('To', widget.bankName),
                  const SizedBox(height: 20),
                  _buildDivider(),
                  const SizedBox(height: 20),
                  _buildInfoRow('Description', 'Garri'),
                  const SizedBox(height: 20),
                  _buildDivider(),
                  const SizedBox(height: 20),
                  _buildInfoRow('Outward Transfer', '₦ 0.00'),
                  const SizedBox(height: 20),
                  _buildDivider(),
                  const SizedBox(height: 20),
                  _buildInfoRow('Payment Method', 'Fees'),
                  const SizedBox(height: 20),
                  _buildDivider(),
                  const SizedBox(height: 20),
                  _buildInfoRow('Status', 'Successful'),
                  const SizedBox(height: 20),
                  _buildDivider(),
                  const SizedBox(height: 20),
                  _buildInfoRow('Transaction Reference', '090267230811083838'),
                  const SizedBox(height: 20),
                  _buildDivider(),
                  const SizedBox(height: 20),
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

  Widget _buildInfoRow(String label, String value) {
    return Row(
      children: [
        Text(
          '$label ',
          style: const TextStyle(
            fontSize: AppFontSize.size20,
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
            fontSize: AppFontSize.size20,
          ),
        )
      ],
    );
  }

  Widget _buildDivider() {
    return Container(
      color: AppColors.lightGreen,
      height: 2,
    );
  }

  Widget _buildMoreActions() {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => RepeatTransactionScreen(
                  amount: widget.amount,
                  transactionTimestamp: widget.transactionTimestamp,
                  accountName: widget.accountName,
                  description: 'Garri', isSent: true,
                ),
              ),
            );
          },
          child: _buildActionRow(
            'assets/jpg/reset.jpg',
            'Repeat Transaction',
            Icons.arrow_forward_ios,
          ),
        ),
        const SizedBox(height: 30),
        _buildActionRow(
          'assets/jpg/report_card.jpg',
          'Report Transaction',
          Icons.arrow_forward_ios,
        ),
      ],
    );
  }


  Widget _buildActionRow(String imagePath, String label, IconData icon) {
    return Row(
      children: [
        Image.asset(
          imagePath,
          width: 30,
          height: 30,
        ),
        const SizedBox(width: 10),
        Text(
          label,
          style: const TextStyle(
            fontSize: AppFontSize.size18,
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
