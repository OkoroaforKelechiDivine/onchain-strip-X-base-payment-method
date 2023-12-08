import 'package:flutter/material.dart';
import 'package:pay_me_mobile/core/cores.dart';
import 'package:pay_me_mobile/src/views/screens/auth/login_screen.dart';
import 'package:pay_me_mobile/src/views/screens/bottom_nav.dart';
import 'package:stacked/stacked.dart';

class TransactionPinViewModel extends BaseViewModel {
  TextEditingController pinController = TextEditingController();
  final focusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  bool isProcessing = false;
  bool isError = false;

  Future<void> onPassCode() async {
    final firstLogin = appGlobals.user?.isFirstLogin ?? false;
    isProcessing = true;
    notifyListeners();
    if (firstLogin) {
      final res = await authRepo.setPascode(
        code: pinController.text,
      );
      if (res.success) {
        if (res.data == "Successful") {
          navigationService.pushAndRemoveUntil(const LoginScreen());
          isProcessing = false;
          notifyListeners();
        }
      } else {
        isProcessing = false;
        snackbarService.error(message: res.message!);
        notifyListeners();
      }
    } else {
      final res = await authRepo.validatePascode(
        code: pinController.text,
      );
      if (res.success) {
        if (res.data!.message) {
          navigationService.pushAndRemoveUntil(const BottomNav());
          isProcessing = false;
          notifyListeners();
        }
      } else {
        isProcessing = false;
        snackbarService.error(message: res.message!);
        notifyListeners();
      }
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
