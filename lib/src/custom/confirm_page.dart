import 'package:flutter/material.dart';

import '../../app_config/manager/font_manager.dart';
import '../../core/cores.dart';

class ConfirmPaymentScreen extends StatefulWidget {
  final String? amount;
  const ConfirmPaymentScreen({super.key, this.amount});

  @override
  State<ConfirmPaymentScreen> createState() => _ConfirmPaymentScreenState();
}

class _ConfirmPaymentScreenState extends State<ConfirmPaymentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.only(left: 60.0),
          child: Text(
            'Confirm Page',
            style: TextStyle(
              fontSize: AppFontSize.size20,
              color: AppColors.lightGreen,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 160, top: 30),
        child: Column(
          children: [
            const Text(
              'To:',
              style: TextStyle(
                  color: AppColors.lightBlack,
                  fontSize: AppFontSize.size18
              ),
            ),
            const SizedBox(height: 30),
            Text(
              'Amount: ${widget.amount}',
              style: const TextStyle(
                  color: AppColors.lightBlack,
                  fontSize: AppFontSize.size18
              ),
            )
          ],
        ),
      ),
    );
  }
}
