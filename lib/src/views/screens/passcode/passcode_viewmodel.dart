import 'package:flutter/material.dart';
import 'package:pay_me_mobile/core/cores.dart';
import 'package:stacked/stacked.dart';

class PasscodeViewModel extends BaseViewModel {
  TextEditingController pinController = TextEditingController();
  final focusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  List<String> enteredDigits = [];
  bool isProcessing = false;
  bool isError = false;

  Future<bool> onPassCode(String passcode, bool isFirstLogin) async {
    final res = await authRepo.validatePascode(
        code: passcode, isFirstLogin: isFirstLogin);
    if (res.success) {
      return true;
    } else {
      return false;
    }
  }

  void onButtonClick(String number) {
    pinController.text += number;
    pinController.selection = TextSelection.fromPosition(
        TextPosition(offset: pinController.text.length));
    notifyListeners();
  }

  void onBackspace() {
    if (pinController.text.isNotEmpty) {
      pinController.text =
          pinController.text.substring(0, pinController.text.length - 1);
    }
  }

  void createPin(String finalPin) {}
}
