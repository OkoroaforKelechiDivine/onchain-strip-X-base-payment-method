import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pay_me_mobile/core/constants/app_assets.dart';
import 'package:pay_me_mobile/presentation/transfer/widget/sucess_screen.dart';

import '../../../core/constants/colors.dart';
import '../../../core/di/locator.dart';
import '../../../core/widgets/app_button.dart';
import '../../../core/widgets/info.dart';

class NetworkErrorScreen extends StatelessWidget {
  const NetworkErrorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBg,
      body: Center(
        child: Column(
          children: [
            const InfoScreen(
              title: "Network Error",
              imagePath: AppAssets.success,
            ),
            SizedBox(height: 100.h),
            AppButton(
              title: "Retry",
              onPressed: () {
                navigationService.push(const SuccessScreen());
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
