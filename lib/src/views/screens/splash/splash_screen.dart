import 'dart:async';
import 'package:flutter/material.dart';
import 'package:pay_me_mobile/core/di/locator.dart';
import 'package:pay_me_mobile/src/views/screens/bottom_nav.dart';
import 'package:pay_me_mobile/src/views/screens/passcode/enter_passcode.dart';
import '../auth/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(const Duration(milliseconds: 900), () {
      final isAuthenticated = appGlobals.token != null;
      if (isAuthenticated) {
        navigationService.pushReplacement(PassCodeScreen(
          page: const BottomNav(),
          isFirstTime: appGlobals.user?.isFirstLogin ?? false,
        ));
      } else {
        navigationService.pushReplacement(const LoginScreen());
      }

      //replaceNavigation(context: context, widget: const LoginScreen(), routeName: PageNamedRoutes.login);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset('assets/png/payme.png', width: 250),
          )
        ],
      ),
    );
  }
}
