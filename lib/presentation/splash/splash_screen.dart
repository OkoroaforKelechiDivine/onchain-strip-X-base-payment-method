import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pay_me_mobile/core/constants/app_assets.dart';
import 'package:pay_me_mobile/core/constants/colors.dart';
import 'package:pay_me_mobile/presentation/splash/splash_viewmodel.dart';
import 'package:stacked/stacked.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      onViewModelReady: (viewModel) {
        viewModel.initializeSplashScreen();
      },
      viewModelBuilder: () => SplashScreenViewModel(),
      builder: (context, model, _) {
        return Scaffold(
          backgroundColor: AppColors.white,
          body: Center(
            child: Image.asset(
              AppAssets.newPayme,
              height: 61.h,
              width: 230.w,
              //   colorBlendMode: AppColors.black,
            ),
          ),
        );
      },
    );
  }
}
