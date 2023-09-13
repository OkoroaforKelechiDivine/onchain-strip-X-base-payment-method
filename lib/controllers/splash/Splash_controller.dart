import 'dart:async';
import 'package:flutter/material.dart';
import 'package:pay_me_mobile/views/auth_view/pincode.dart';
import '../../views/auth_view/login_view.dart';

class SplashController {
  void initialize(BuildContext context) {
    Timer(const Duration(milliseconds: 4000), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => PinCodeScreen()));
    });
  }
}
