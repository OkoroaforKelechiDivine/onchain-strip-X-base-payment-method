import 'package:flutter/material.dart';
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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // SvgPicture.asset(
                //   AppAssets.,
                //   //   colorBlendMode: AppColors.black,
                // ),
              ],
            ),
          ),
        );
      },
    );
  }
}
