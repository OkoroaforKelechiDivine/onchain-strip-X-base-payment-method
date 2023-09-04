import 'package:flutter/material.dart';
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
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: const Text("Transfer to Bank", style: TextStyle(color: AppColors.lightGreen)),
      ),
      body: const Text("Transfer to Bank")
    );
  }
}
