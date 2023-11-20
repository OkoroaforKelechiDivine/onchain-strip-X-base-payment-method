import 'package:flutter/material.dart';
import 'package:pay_me_mobile/app_config/manager/font_manager.dart';
import 'package:pay_me_mobile/src/views/screens/transaction_history/components/message.dart';
import 'package:pay_me_mobile/src/views/screens/transaction_history/components/submit_button.dart';
import 'package:pay_me_mobile/src/views/screens/transaction_history/components/text.dart';
import 'package:pay_me_mobile/src/views/screens/transaction_history/components/transaction_card.dart';


class RepeatTransactionScreen extends StatefulWidget {
  final String amount;
  final DateTime transactionTimestamp;
  final String accountName;
  final String description;
  final bool isSent;

  const RepeatTransactionScreen({
    Key? key,
    required this.amount,
    required this.transactionTimestamp,
    required this.accountName,
    required this.description,
    required this.isSent,
  }) : super(key: key);

  @override
  State<RepeatTransactionScreen> createState() => _RepeatTransactionScreenState();
}

class _RepeatTransactionScreenState extends State<RepeatTransactionScreen> {
  final TextEditingController amountController = TextEditingController();
  final TextEditingController narrationController = TextEditingController();

  final GlobalKey<FormState> amountKey = GlobalKey<FormState>();
  final GlobalKey<FormState> narrationKey = GlobalKey<FormState>();

  bool amountError = false;
  bool narrationError = false;

  @override
  void dispose() {
    amountController.dispose();
    narrationController.dispose();
    super.dispose();
  }

  PreferredSizeWidget buildAppBar() {
    return AppBar(
      title: Padding(
        padding: const EdgeInsets.only(left: 60.0),
        child: Text(
          widget.accountName,
          style: const TextStyle(
            fontSize: AppFontSize.size20,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white10,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const BuildTodayText(),
            BuildTransactionCard(
                isSent: widget.isSent,
                amount: widget.amount,
                transactionTimestamp: widget.transactionTimestamp,
                accountName: widget.accountName,
                description: widget.description
            ),
            const SizedBox(height: 40),
            const BuildMessageText(),
            const SizedBox(height: 300),
            const BuildSubmitButton(),
          ],
        ),
      ),
    );
  }
}
