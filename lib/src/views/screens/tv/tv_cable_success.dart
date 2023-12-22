import 'package:flutter/material.dart';
import 'package:pay_me_mobile/data/model/response/tv_cable/buy_tv_cable_response.dart';
import 'package:pay_me_mobile/src/views/screens/bottom_nav.dart';

import '../../../../core/cores.dart';

class TVCableSuccessPage extends StatelessWidget {
  final TvCableResponse res;
  const TVCableSuccessPage({super.key, required this.res});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            res.responseDescription == "TRANSACTION FAILED"
                ? Icons.error
                : Icons.check_circle,
            color: AppColors.lightGreen,
            size: 200,
          ),
          const SizedBox(height: 20),
          AppText(
            '# ${res.amount}',
            fontSize: 35,
            fontWeight: FontWeight.bold,
          ),
          const SizedBox(height: 20),
          AppText(
            res.responseDescription,
            fontSize: 20,
          ),
          const SizedBox(height: 20),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppCustomButton(
                width: 150,
                onPressed: () {
                  navigationService.pushAndRemoveUntil(const BottomNav());
                },
                title: "Done",
              ),
              // const SizedBox(width: 20),
              // const SizedBox(width: 20),
              // AppCustomButton(
              //   borderWidth: 1,
              //   width: 150,
              //   onPressed: () {
              //     //navigationService.pop();
              //   },
              //   title: "Share Receipt",
              // ),
            ],
          ),
        ],
      ),
    );
  }
}
