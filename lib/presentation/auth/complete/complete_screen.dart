import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pay_me_mobile/core/constants/app_assets.dart';
import 'package:pay_me_mobile/core/cores.dart';
import 'package:pay_me_mobile/presentation/homepage/home_page_view.dart';

import '../../../core/widgets/info.dart';

class CompleteScreen extends StatelessWidget {
  const CompleteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBg,
      body: Center(
        child: Column(
          children: [
            const InfoScreen(
              title: "Welcome!",
              message: "Your account has been Registered",
              imagePath: AppAssets.success,
            ),
            SizedBox(height: 100.h),
            AppButton(
              title: "Back to Login",
              onPressed: () {
                navigationService.push(const HomepageView());
                },
              radius: 100.r,
              margin: const EdgeInsets.symmetric(horizontal: 20),
            )
          ],
        ),
      ),
    );
  }
}