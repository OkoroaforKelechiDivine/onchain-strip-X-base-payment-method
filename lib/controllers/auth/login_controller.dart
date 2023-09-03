
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginController extends GetxController{

  final userNameController = TextEditingController();
  final passwordController = TextEditingController();
  var userNameError = "".obs;
  var passwordError = "".obs;
  var isLoading = false.obs;

  clearUserNameError(val) => userNameError.value = "";
  clearPasswordError(val) => passwordError.value = "";
}