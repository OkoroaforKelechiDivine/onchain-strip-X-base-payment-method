import 'package:flutter/material.dart';
import 'package:pay_me_mobile/app_config/manager/font_manager.dart';
import 'package:pay_me_mobile/app_config/manager/theme_manager.dart';

class TransferToBankScreen extends StatefulWidget {
  const TransferToBankScreen({super.key});

  @override
  _TransferToBankScreenState createState() => _TransferToBankScreenState();
}

class _TransferToBankScreenState extends State<TransferToBankScreen> {
  bool showBankList = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Transfer to Bank", style: TextStyle(color: AppColors.lightGreen)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          color: AppColors.lightBlue,
          padding: const EdgeInsets.all(16.0),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Recipient Account",
                style: TextStyle(
                  color: AppColors.lightBlack,
                  fontSize: 20.0,
                  fontWeight: AppFontWeight.bold
                ),
              ),
             ]
          ),
        ),
      ),
    );
  }
}
