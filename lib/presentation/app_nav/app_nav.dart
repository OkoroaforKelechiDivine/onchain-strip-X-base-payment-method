import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:pay_me_mobile/src/views/screens/bottom_nav.dart';
import 'package:pay_me_mobile/presentation/splash/splash_screen.dart';

import '../../core/cores.dart';

class AppNav extends StatelessWidget {
  const AppNav({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isAuthenticated = appGlobals.token != null;
    log(isAuthenticated.toString());
    if (isAuthenticated) {
      return const BottomNav();
    } else {
      return const SplashScreen();
    }
  }
}
