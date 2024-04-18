import 'dart:async';
import 'dart:developer';

import 'package:pay_me_mobile/core/di/locator.dart';
import 'package:pay_me_mobile/src/views/screens/splash/splash_screen.dart';

class UserActivityTimer {
  static final UserActivityTimer _instance = UserActivityTimer._internal();
  factory UserActivityTimer() => _instance;
  UserActivityTimer._internal();

  Timer? _timer;
  int timeoutSeconds = 60; // Set timeout to 60 seconds

  void startTimer(void Function() onTimeout) {
    _timer?.cancel(); // Cancel any existing timer
    _timer = Timer(Duration(seconds: timeoutSeconds), onTimeout);
  }

  void resetTimer() {
    timeoutSeconds = 60;
    startTimer(() {
      navigationService.pushAndRemoveUntil(const SplashScreen());
    });

    log("Restarted");
  }

  void stopTimer() {
    _timer?.cancel();
  }
}
