import 'package:flutter/cupertino.dart';

class LoginController {
  final userNameController = TextEditingController();
  final passwordController = TextEditingController();
  var userNameError = "";
  var passwordError = "";
  var isLoading = false;

  void clearUserNameError(val) {
    userNameError = "";
  }

  void clearPasswordError(val) {
    passwordError = "";
  }
}
