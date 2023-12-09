import 'package:flutter/material.dart';
import 'package:pay_me_mobile/core/cores.dart';
import 'package:stacked/stacked.dart';

class UpdatePasscodeVM extends BaseViewModel {
  TextEditingController oldPinController = TextEditingController();
  TextEditingController newPinController = TextEditingController();
  final focusNode = FocusNode();
  final newfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  bool isProcessing = false;
  bool isError = false;

  Future<void> onChangePasscode() async {
    isProcessing = true;
    notifyListeners();
    final res = await authRepo.updatePasscode(
        oldPassword: oldPinController.text, newPassword: newPinController.text);

    if (res.success) {
      isProcessing = false;
      notifyListeners();
      navigationService.pop();
      snackbarService.success(message: "Successfully updated passcode");
    } else {
      isError = true;
      isProcessing = false;
      notifyListeners();
      snackbarService.error(message: res.message!);
    }
  }
}
