import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pay_me_mobile/src/views/screens/bottom_nav.dart';

import '../../../../../core/cores.dart';

class TransferSuccessPage extends StatelessWidget {
  final String message;
  const TransferSuccessPage({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.check_circle,
            color: AppColors.lightGreen,
            size: 200,
          ),
          const SizedBox(height: 20),
          AppText(
            message,
            fontSize: 35,
            fontWeight: FontWeight.bold,
          ),
          const SizedBox(height: 20),
          const AppText(
            'Your transfer was successful',
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
              const SizedBox(width: 20),
              AppCustomButton(
                borderWidth: 1,
                width: 150,
                onPressed: () {
                  //navigationService.pop();
                },
                title: "Share Receipt",
              ),
            ],
          ),
        ],
      ),
    );
  }
}
