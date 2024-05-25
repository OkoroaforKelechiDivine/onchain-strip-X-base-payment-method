import 'package:flutter/material.dart';
import 'package:pay_me_mobile/core/cores.dart';
import 'package:pay_me_mobile/core/utilities/string_util.dart';
import 'package:pay_me_mobile/data/model/params/login_param.dart';
import 'package:pay_me_mobile/presentation/bottom_nav.dart';
import 'package:stacked/stacked.dart';

class SignInViewModel extends BaseViewModel {
  int _currentIndex = 0;
  int get currentIndex => _currentIndex;
  bool isLoading = false;
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  void setIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  //
  bool obscureText = true;

  void toggleObscureText() {
    obscureText = !obscureText;
    notifyListeners();
  }

  Future<void> login() async {
    isLoading = true;
    notifyListeners();
    final param = (_currentIndex == 1)
        ? LoginParam(
            username: usernameController.text.trim(),
            password: passwordController.text.trim(),
          )
        : LoginParam(
            phoneNumber: formatPhoneNumber(phoneController.text.trim()),
            password: passwordController.text.trim(),
          );

    final res = await authRepo.login(param: param);
    if (res.success) {
      navigationService.pushAndRemoveUntil(const BottomNav());
    } else {
      snackbarService.error(message: res.message!);
    }
    isLoading = false;
    notifyListeners();
  }
}
