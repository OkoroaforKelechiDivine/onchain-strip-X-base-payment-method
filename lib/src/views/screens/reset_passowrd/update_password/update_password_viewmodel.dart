import 'package:flutter/cupertino.dart';
import 'package:pay_me_mobile/core/di/locator.dart';
import 'package:pay_me_mobile/src/views/screens/auth/login_screen.dart';
import 'package:stacked/stacked.dart';

class UpdatePasswordViewModel extends BaseViewModel {
  TextEditingController usernameController = TextEditingController();
  TextEditingController tokenController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isLoading = false;

  Future<void> resetPassword() async {
    isLoading = true;
    notifyListeners();
    if (usernameController.text.isEmpty ||
        tokenController.text.isEmpty ||
        passwordController.text.isEmpty) {
      snackbarService.error(message: "All fields are required");
    } else {
      final res = await authRepo.updatePassword(
          username: usernameController.text,
          password: passwordController.text,
          token: int.parse(tokenController.text));
      if (res.success) {
        snackbarService.success(message: res.data!);
        navigationService.pushAndRemoveUntil(const LoginScreen());
      } else {
        snackbarService.error(message: res.message!);
        isLoading = false;
        notifyListeners();
      }
    }
    isLoading = false;
    notifyListeners();
  }
}
