import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pay_me_mobile/app_config/manager/font_manager.dart';

import 'package:pay_me_mobile/core/utilities/app_fonts.dart';
import 'package:pay_me_mobile/core/cores.dart';
import 'package:pay_me_mobile/src/views/screens/pos/components/pos_card_text_with_button.dart';
import 'package:pay_me_mobile/src/views/screens/pos/total_transaction.dart';

class PosDeviceScreen extends StatefulWidget {
  const PosDeviceScreen({Key? key}) : super(key: key);

  @override
  State<PosDeviceScreen> createState() => _PosDeviceScreenState();
}

class _PosDeviceScreenState extends State<PosDeviceScreen> {

  void _navigateToHelloScreen(BuildContext context) {
    navigationService.push(const TotalTransactionScreen());
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
      body: const Column(
        children: [
          SizedBox(height: 30),
          BuildPosCardTextWithButton(text: "POS Isolo"),
          BuildPosCardTextWithButton(text: "POS Ijebu"),
          BuildPosCardTextWithButton(text: "POS Ipaja"),
        ],
      ),
    );
  }
}
