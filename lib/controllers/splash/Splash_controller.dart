import 'dart:async';
import 'package:flutter/material.dart';
import 'package:pay_me_mobile/views/auth_view/pass_code.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../views/auth_view/login_view.dart';

class SplashController {
  Future<void> initialize(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    final bool hasLoggedIn = prefs.getBool('hasLoggedIn') ?? false;

    Timer(const Duration(milliseconds: 900), () {
      if (hasLoggedIn) {
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => const PassCodeScreen()));
      } else {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (_) => const LoginScreen()));
      }
    });
  }
}