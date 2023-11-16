import 'package:flutter/material.dart';
import 'package:pay_me_mobile/core/utilities/app_fonts.dart';

import '../../../../app_config/manager/font_manager.dart';

import '../../../../core/constants/colors.dart';
import 'components/outlet_card_text_button.dart';
class OutletScreen extends StatefulWidget {
  const OutletScreen({super.key});

  @override
  State<OutletScreen> createState() => _OutletScreenState();
}

class _OutletScreenState extends State<OutletScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white10,
        leading: const BackButton(),
        title: Text(
          "Outlet",
          style: sans(
            fontSize: AppFontSize.size20,
            color: AppColors.lightGreen,
          ),
        ),
      ),
      body: const Column(
        children: [
          SizedBox(height: 30),
          BuildCardWithTextButton(text: "Outlet Isolo"),
          BuildCardWithTextButton(text:  "Outlet Ijebu"),
          BuildCardWithTextButton(text:  "Outlet Ipaja"),
        ],
      ),
    );
  }
}