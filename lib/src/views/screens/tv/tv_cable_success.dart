import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pay_me_mobile/core/constants/app_assets.dart';
import 'package:pay_me_mobile/data/model/response/tv_cable/buy_tv_cable_response.dart';
import 'package:pay_me_mobile/src/views/screens/bottom_nav.dart';

import '../../../../core/cores.dart';

class TVCableSuccessPage extends StatelessWidget {
  final TvCableResponse res;
  const TVCableSuccessPage({super.key, required this.res});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 26),
        child: Column(
          children: [
            const Spacer(),
            SvgPicture.asset(
              res.responseDescription == "TRANSACTION FAILED"
                  ? AppAssets.cancel
                  : AppAssets.complete,
              height: 200.0,
              width: 200.0,
            ),
            const SizedBox(height: 20),
            AppText(
              '₦ ${res.amount}',
              fontSize: 35,
              fontWeight: FontWeight.bold,
            ),
            const SizedBox(height: 20),
            AppText(
              res.responseDescription,
              fontSize: 20,
            ),
            const Spacer(),
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
