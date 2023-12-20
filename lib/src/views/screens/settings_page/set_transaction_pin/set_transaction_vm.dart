import 'package:flutter/material.dart';
import 'package:pay_me_mobile/data/datasources/local/base/local_storage_service.dart';
import 'package:pay_me_mobile/src/views/screens/auth/login_screen.dart';
import 'package:pay_me_mobile/src/views/screens/bottom_nav.dart';
import 'package:pay_me_mobile/src/views/screens/passcode/enter_passcode.dart';
import 'package:stacked/stacked.dart';

import '../../../../../core/di/di.dart';

class SetTransactionPinVM extends BaseViewModel {
  TextEditingController pinController = TextEditingController();
  final focusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  bool isProcessing = false;
  bool isError = false;

  Future<void> onSetTransactionPin() async {
    isProcessing = true;
    notifyListeners();

    final res = await authRepo.setTransactionPin(
      code: pinController.text,
    );
    if (res.success) {
      await LocalStorageService.clear();
      navigationService.pushAndRemoveUntil(
        const LoginScreen(),
      );
      isProcessing = false;
      notifyListeners();
    } else {
      isProcessing = false;
      snackbarService.error(message: res.message!);
      notifyListeners();
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
