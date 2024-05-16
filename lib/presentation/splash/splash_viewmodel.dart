import 'package:pay_me_mobile/core/di/locator.dart';
import 'package:pay_me_mobile/presentation/intro/intro_screen_view.dart';
import 'package:stacked/stacked.dart';

class SplashScreenViewModel extends BaseViewModel {
  Future<void> initializeSplashScreen() async {
    await Future.delayed(const Duration(seconds: 5));
    navigationService.pushAndRemoveUntil(const IntroScreen());
  }
}
