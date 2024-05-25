import 'package:pay_me_mobile/core/di/locator.dart';
import 'package:pay_me_mobile/presentation/auth/login_pin/login_pin_view.dart';
import 'package:pay_me_mobile/presentation/intro/intro_screen_view.dart';
import 'package:stacked/stacked.dart';

class SplashScreenViewModel extends BaseViewModel {
  Future<void> initializeSplashScreen() async {
    await Future.delayed(const Duration(seconds: 5));
    final isAuthenticated = appGlobals.token != null;
    if (isAuthenticated) {
      navigationService.pushReplacement(const LoginPinView());
    } else {
      navigationService.pushReplacement(const IntroScreen());
    }
  }
}
