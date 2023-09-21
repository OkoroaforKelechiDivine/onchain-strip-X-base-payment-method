
import 'dart:async';
import 'package:flutter/material.dart';

import '../../data/screens/login/set_login_screen.dart';


class SplashController {
  void initialize(BuildContext context) {
    Timer(const Duration(milliseconds: 900), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => const LoginScreen()));
    });
  }
}