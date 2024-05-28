import 'package:flutter/material.dart';
import 'package:pay_me_mobile/core/di/locator.dart';

import 'package:stacked/stacked.dart';

class TransactionPinViewModel extends BaseViewModel {
  TextEditingController pinController = TextEditingController();
  final focusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  bool isProcessing = false;
  bool isError = false;

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

  String _pin = '';
  String get pin => _pin;

  void addDigit(
    String digit,
  ) async {
    if (_pin.length < 4) {
      _pin += digit;
      notifyListeners();
    }
  }

  void removeDigit() {
    if (_pin.isNotEmpty) {
      _pin = _pin.substring(0, _pin.length - 1);
      notifyListeners();
    }
  }

  void clearPin() {
    _pin = '';
    notifyListeners();
  }

  bool get isPinComplete => _pin.length == 4;

  Future<bool> confirmPin() async {
    final res = await authRepo.validatePin(pin);
    if (res.success) {
      if (res.data!) {
        return true;
      } else {
        snackbarService.error(message: "Invalid pin");
        return false;
      }
    } else {
      snackbarService.error(message: res.message!);
      return false;
    }
  }
}
