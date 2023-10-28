import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pay_me_mobile/app_config/manager/theme_manager.dart';
import 'package:pay_me_mobile/data/screens/pos/total_transaction.dart';
import 'package:pay_me_mobile/src/core/utilities/app_fonts.dart';

import '../../../app_config/manager/font_manager.dart';

class PosDeviceScreen extends StatefulWidget {
  const PosDeviceScreen({Key? key}) : super(key: key);

  @override
  State<PosDeviceScreen> createState() => _PosDeviceScreenState();
}

class _PosDeviceScreenState extends State<PosDeviceScreen> {


  void _navigateToHelloScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const TotalTransactionScreen()),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white10,
        title: Text(
          "POS Device",
          style: sans(
            fontSize: AppFontSize.size20.sp,
            color: AppColors.lightGreen,
          ),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 30),
          _buildCardWithTextButton(context, "POS Isolo"),
          _buildCardWithTextButton(context, "POS Ijebu"),
          _buildCardWithTextButton(context, "POS Ipaja"),
        ],
      ),
    );
  }

  Widget _buildCardWithTextButton(BuildContext context, String text) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(10),
      child: Card(
        child: TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const TotalTransactionScreen()),
            );
          },
          child: Text(
            text,
            style: const TextStyle(
              color: AppColors.lightBlack,
            ),
          ),
        ),
      ),
    );
  }
}
