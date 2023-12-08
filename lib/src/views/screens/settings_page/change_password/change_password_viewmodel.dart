import 'package:flutter/material.dart';
import 'package:pay_me_mobile/core/di/locator.dart';
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
      final res = await authRepo.resetPassword(
        oldPassword: currentPasswordController.text,
        newPassword: newPasswordController.text,
      );
      if (res.success) {
        snackbarService.success(message: res.data!);
      } else {
        snackbarService.error(message: res.message!);
      }
    }
  }
}
