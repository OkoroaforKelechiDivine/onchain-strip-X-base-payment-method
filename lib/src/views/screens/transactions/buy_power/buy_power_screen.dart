import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pay_me_mobile/core/cores.dart';
import 'package:pay_me_mobile/src/views/screens/transactions/buy_power/components/meter_name.dart';
import 'package:pay_me_mobile/src/views/screens/transactions/buy_power/components/package.dart';
import 'package:pay_me_mobile/src/views/screens/transactions/buy_power/components/service_provider.dart';

import '../../../../../core/utilities/app_fonts.dart';
import '../../../widgets/app_button.dart';

class BuyPowerScreen extends StatefulWidget {
  const BuyPowerScreen({super.key});

  @override
  State<BuyPowerScreen> createState() => _BuyPowerScreenState();
}

class _BuyPowerScreenState extends State<BuyPowerScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Text('Buy Power', style: sans(color: AppColors.lightGreen),
          ),
        ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            const BuildServiceProviders(),
            const SizedBox(height: 10),
            const BuildPackage(),
            const SizedBox(height: 10),
            const BuildMeterName(),
            Container(
              margin: EdgeInsets.only(top: 24.h),
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 100,
                  right: 100,
                ),
                child:
                AppButton.filledButton(context,
                    onTap: (){},
                    color: AppColors.lightGreen,
                    child: Text(
                      'Next',
                      style: cairo(),
                    )
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}