import 'dart:async';
import 'package:flutter/material.dart';
import 'package:pay_me_mobile/views/auth_view/pass_code.dart';
import '../../views/auth_view/login_view.dart';

class SplashController {
  void initialize(BuildContext context) {
    Timer(const Duration(milliseconds: 900), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => const PassCodeScreen()));
    });
  }
}
