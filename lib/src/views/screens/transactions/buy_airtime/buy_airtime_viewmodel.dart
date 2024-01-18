import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:pay_me_mobile/core/utilities/general_util.dart';
import 'package:pay_me_mobile/core/utilities/string_util.dart';
import 'package:pay_me_mobile/src/custom/custom_amount_input_field.dart';
import 'package:pay_me_mobile/src/views/screens/transaction_pin/transaction_pin_view.dart';
import 'package:pay_me_mobile/src/views/screens/transactions/buy_airtime/airtime_success_page.dart';
import 'package:stacked/stacked.dart';

import '../../../../../core/di/locator.dart';

class BuyAirtimeViewModel extends BaseViewModel {
  String selectedAmount = "";
  TextEditingController amountController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  String selectedValue = 'Airtel';
  int selectedAmountIndex = 7;
  bool buyingAirtime = false;
  bool isLoadingWalletBalance = false;
  String walletBalance = "0.0";

  void init() async {
    await getWalletBalance();
  }

  Future<void> getWalletBalance() async {
    isLoadingWalletBalance = true;
    notifyListeners();
    final res = await businessRepo.getWalletBalance();
    if (res.success) {
      log(res.data.toString());
      walletBalance = res.data!.toDouble().toStringAsFixed(2);
      notifyListeners();
      isLoadingWalletBalance = false;
      notifyListeners();
    }
    notifyListeners();
  }

  List<String> dropdownItems = ['Airtel', 'MTN', 'Glo', 'Etisalat'];

  void onSelelectNetwork(String val) {
    selectedValue = val;
    notifyListeners();
  }

  void onSelectAmount(String val, int index) {
    amountController.text = AmountFormatter.formatAmount(val);
    selectedAmountIndex = index;
    notifyListeners();
  }

  Future<bool> confirmPin(String pin) async {
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

  void buyAirtime() {
    final sufficuentBalance = compareAmounts(
      accountBalance: double.parse(walletBalance),
      inputAmount: amountController.text,
    );
    log(amountController.text);
    log(walletBalance);
    if (sufficuentBalance) {
      snackbarService.error(message: "Insufficient balance");
    } else {
      bottomSheetService.show(
        TransactionPinView(
          onPinComplete: (val) async {
            navigationService.pop();
            buyingAirtime = true;
            notifyListeners();
            final res = await confirmPin(val!);
            if (res) {
              await onBuyAirtime();
            }
            buyingAirtime = false;
            notifyListeners();
          },
        ),
      );
    }
  }

  Future<void> onBuyAirtime() async {
    final res = await bankRepo.buyAirtime(
      amount: int.parse(decomposeAmount(amountController.text)),
      number: phoneNumberController.text,
      network: selectedValue.toLowerCase(),
    );
    if (res.success) {
      navigationService.pushAndRemoveUntil(
        AirtimeSuccessPage(res: res.data!),
      );
      snackbarService.success(message: res.message!);
    } else {
      snackbarService.error(message: res.message!);
    }
  }
}
