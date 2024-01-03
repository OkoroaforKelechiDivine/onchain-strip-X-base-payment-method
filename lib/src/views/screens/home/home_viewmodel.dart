import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:pay_me_mobile/data/model/response/transaction_response/transaction_response.dart';
import 'package:stacked/stacked.dart';

import '../../../../core/di/locator.dart';

class HomeViewModel extends BaseViewModel {
  GlobalKey<RefreshIndicatorState> refreshKey =
      GlobalKey<RefreshIndicatorState>();
  bool isVisible = false;
  bool isLoadingWalletBalance = false;
  String walletBalance = "0.00";
  void onToggleVisibility() {
    isVisible = !isVisible;
    notifyListeners();
  }

  Future<void> init() async {
    await getWalletBalance();
  }

  Future<void> getWalletBalance() async {
    isLoadingWalletBalance = true;
    notifyListeners();
    final res = await businessRepo.getWalletBalance();
    if (res.success) {
      log(res.data.toString());
      walletBalance = res.data!.toDouble().toStringAsFixed(2);
      isLoadingWalletBalance = false;
      notifyListeners();
    }
    isLoadingWalletBalance = false;
    notifyListeners();
  }
}
