import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pay_me_mobile/core/constants/app_assets.dart';
import 'package:pay_me_mobile/core/cores.dart';
import 'package:pay_me_mobile/core/di/locator.dart';
import 'package:pay_me_mobile/src/views/screens/bottom_nav.dart';

class RequestSucessPage extends StatelessWidget {
  const RequestSucessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 26),
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              SvgPicture.asset(
                AppAssets.complete,
                height: 200.0,
                width: 200.0,
              ),
              const SizedBox(height: 20.0),
              const Text(
                'Request Successful',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 8.0),
              const Text(
                'Your request has been received and is being processed',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w400,
                ),
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
      ),
    );
  }
}
