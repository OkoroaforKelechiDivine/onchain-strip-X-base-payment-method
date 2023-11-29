import 'package:flutter/material.dart';
import 'package:pay_me_mobile/src/views/screens/transactions/buy_power/components/next_button.dart';
import 'package:pay_me_mobile/src/views/screens/transactions/buy_power/components/package.dart';
import 'package:pay_me_mobile/src/views/screens/transactions/buy_power/components/service_provider.dart';
import 'package:pay_me_mobile/src/views/screens/tv/components/decoder_name.dart';

import '../../../../app_config/manager/font_manager.dart';
import '../../../../core/utilities/app_fonts.dart';
import 'package:pay_me_mobile/core/cores.dart';

class CableTvScreen extends StatefulWidget {
  const CableTvScreen({super.key});

  @override
  State<CableTvScreen> createState() => _CableTvScreenState();
}

class _CableTvScreenState extends State<CableTvScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white10,
        title: Text(
          'Cable TV',
          style: sans(
            fontSize: AppFontSize.size20,
            color: AppColors.lightGreen,
          ),
        ),
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            //BuildServiceProviders(),
            SizedBox(height: 10),
            //BuildPackage(),
            SizedBox(height: 10),
            BuildDecoderName(),
            BuildNextButton(),
          ],
        ),
      ),
    );
  }
}
