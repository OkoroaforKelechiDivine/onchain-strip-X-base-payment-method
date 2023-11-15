import 'package:flutter/material.dart';
import 'package:pay_me_mobile/app_config/manager/theme_manager.dart';
import 'package:pay_me_mobile/core/utilities/app_fonts.dart';
import '../../../../core/constants/colors.dart';


class OutletDetailsScreen extends StatefulWidget {
  final String outletName;

  const OutletDetailsScreen({Key? key, required this.outletName}) : super(key: key);

  @override
  State<OutletDetailsScreen> createState() => _OutletDetailsScreenState();
}

class _OutletDetailsScreenState extends State<OutletDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white10,
        title: Text(widget.outletName, style: sans(color: AppColors.lightGreen),),
      ),
      body: Center(
        child: Text("Outlet Details for ${widget.outletName}"),
      ),
    );
  }
}