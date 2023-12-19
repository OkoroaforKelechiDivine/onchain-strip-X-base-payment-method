import 'package:flutter/cupertino.dart';
import 'package:pay_me_mobile/core/di/locator.dart';
import 'package:pay_me_mobile/src/views/screens/reset_passowrd/update_password/update_password.dart';
import 'package:stacked/stacked.dart';

class ResetEmailPassowrdViewModel extends BaseViewModel {
  TextEditingController usernameController = TextEditingController();
  bool isLoading = false;

  Future<void> resetPassword() async {
    isLoading = true;
    notifyListeners();
    final res =
        await authRepo.sendResetPassordEmail(username: usernameController.text);
    if (res.success) {
      snackbarService.success(message: res.data!);
      navigationService.push(const UpdatePasswordView());
    } else {
      snackbarService.error(message: res.message!);
      isLoading = false;
      notifyListeners();
    }
    isLoading = false;
    notifyListeners();
  }
}
