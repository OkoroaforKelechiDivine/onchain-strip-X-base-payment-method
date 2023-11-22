import 'package:flutter/material.dart';
import 'package:pay_me_mobile/core/di/locator.dart';
import 'package:pay_me_mobile/data/model/response/auth/login_response.dart';
import 'package:stacked/stacked.dart';

import '../../app_nav/app_nav.dart';

class LoginViewModel extends BaseViewModel{
  bool isLoading = false;
  bool obscurePassword = true;
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String message = "";

  void toggleVisibility() {
      obscurePassword = !obscurePassword;
      notifyListeners();
  }

  void onLogin() async{
    isLoading = true;
    notifyListeners();
    final res = await authRepo.login(username: userNameController.text, password: passwordController.text);
    if(res.success){
      LoginResponse(
        token: res.data?.token,
        user: res.data?.user,
      );
      navigationService.push(const AppNav());
      snackbarService.success(message: "Welcome ${appGlobals.user?.firstName}");
      isLoading = false;
    }else{
      snackbarService.error(message: res.message ?? "Someting went wrong");
      isLoading = false;
    }
    notifyListeners();
  }
}