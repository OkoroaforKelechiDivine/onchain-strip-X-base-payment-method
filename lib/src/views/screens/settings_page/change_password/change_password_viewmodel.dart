import 'package:flutter/material.dart';
import 'package:pay_me_mobile/core/di/locator.dart';
import 'package:pay_me_mobile/src/views/screens/auth/login_screen.dart';
import 'package:stacked/stacked.dart';

class ChangePassowrdViewmodel extends BaseViewModel {
  TextEditingController currentPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  bool obscureCurrentPassword = true;
  bool obscureNewPassword = true;
  bool obscureConfirmPassword = true;

  void toggleCurrentPasswordVisibility() {
    obscureCurrentPassword = !obscureCurrentPassword;
    notifyListeners();
  }

  void toggleNewPasswordVisibility() {
    obscureNewPassword = !obscureNewPassword;
    notifyListeners();
  }

  void toggleConfirmPasswordVisibility() {
    obscureConfirmPassword = !obscureConfirmPassword;
    notifyListeners();
  }

  void onChangePassword() async {
    if (newPasswordController.text != confirmPasswordController.text) {
      snackbarService.error(message: "Passwords do not match");
      return;
    } else {
      final updatePass = appGlobals.user?.isDefaultPassword ?? false;
      final res = await authRepo.resetPassword(
        oldPassword: currentPasswordController.text,
        newPassword: newPasswordController.text,
      );
      if (res.success) {
        if (updatePass) {
          navigationService.pushAndRemoveUntil(const LoginScreen());
        } else {
          navigationService.pop();
        }
      } else {
        snackbarService.error(message: res.message!);
      }
    }
  }
}
