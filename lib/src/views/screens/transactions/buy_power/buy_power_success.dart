import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pay_me_mobile/core/constants/app_assets.dart';
import 'package:pay_me_mobile/core/utilities/string_util.dart';
import 'package:pay_me_mobile/data/model/response/power/buy_power_response.dart';
import 'package:pay_me_mobile/src/views/screens/bottom_nav.dart';

import '../../../../../core/cores.dart';

class BuyPowerSuccess extends StatelessWidget {
  final BuyPowerResponse buyPowerResponse;
  const BuyPowerSuccess({super.key, required this.buyPowerResponse});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 26.0),
        child: Column(
          children: [
            Spacer(),
            SvgPicture.asset(
              buyPowerResponse.responseDescription == "TRANSACTION FAILED"
                  ? AppAssets.cancel
                  : AppAssets.complete,
              height: 200.0,
              width: 200.0,
            ),
            const SizedBox(height: 20),
            AppText(
              "₦${formatBalance(buyPowerResponse.content.transactions.amount.toDouble())}",
              fontSize: 35,
              fontWeight: FontWeight.bold,
            ),
            const SizedBox(height: 20),
            AppText(
              buyPowerResponse.responseDescription,
              fontSize: 20,
            ),
            Spacer(),
            AppCustomButton(
              onPressed: () {
                navigationService.pushAndRemoveUntil(const BottomNav());
              },
              title: "Done",
              color: AppColors.lightGreen,
            ),
            const SizedBox(height: 24.0),
          ],
        ),
      ),
    );
  }
}
