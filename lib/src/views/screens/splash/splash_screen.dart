import 'dart:async';
import 'package:flutter/material.dart';
import 'package:pay_me_mobile/core/di/locator.dart';
import 'package:pay_me_mobile/data/utilities/navigator.dart';
import 'package:pay_me_mobile/core/utilities/page_named_routes.dart';
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
      navigationService.pushReplacement(const LoginScreen());
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
