import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pay_me_mobile/data/screens/outlet/outlet_detail_screen.dart';

import '../../../app_config/manager/font_manager.dart';
import '../../../app_config/manager/theme_manager.dart';

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
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushNamed(context, "/home");
          },
        ),
        title: const Padding(
          padding: EdgeInsets.only(left: 70.0),
          child: Text(
            "Outlet",
            style: TextStyle(
              fontSize: AppFontSize.size20,
              color: AppColors.lightGreen,
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 30),
          _buildCardWithTextButton(context, "Outlet Isolo"),
          _buildCardWithTextButton(context, "Outlet Ijebu"),
          _buildCardWithTextButton(context, "Outlet Ipaja"),
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
              MaterialPageRoute(
                builder: (context) => OutletDetailsScreen(outletName: text),
              ),
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
