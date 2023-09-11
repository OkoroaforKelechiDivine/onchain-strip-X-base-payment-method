import 'dart:async';
import 'package:flutter/material.dart';
import '../../views/auth_view/login_view.dart';

class SplashController {
  void initialize(BuildContext context) {
    Timer(const Duration(milliseconds: 4000), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => const LoginScreen()));
    });
  }
}
