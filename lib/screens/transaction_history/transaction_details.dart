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
              padding: EdgeInsets.only(left: 60.0),
              child: Center(
                child: Text(
                  'Transaction',
                  style: TextStyle(
                    color: AppColors.lightGreen,
                    fontSize: AppFontSize.size20,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 40),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Container(
                  color: AppColors.lightGreen,
                  constraints: const BoxConstraints(maxWidth: 70, maxHeight: 25),
                  child: ElevatedButton(
                    onPressed: () {_showHelloDialog(context);},
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
                  _buildInfoRow('Status', 'Successful'),
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

  void _showHelloDialog(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return SingleChildScrollView(
          child: Container(
            color: AppColors.deepWhite,
            padding: const EdgeInsets.all(16),
            child:  Center(
              child: Column(
                children: const [
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
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.only(right: 240, bottom: 20),
          child: Text("More Actions",
            style: TextStyle(
                color: AppColors.lightBlack,
                fontWeight: AppFontWeight.bold,
              fontSize: AppFontSize.size18
            )
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
        const SizedBox(height: 20),
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
