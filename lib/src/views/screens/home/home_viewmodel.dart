import 'dart:developer';

import 'package:stacked/stacked.dart';

import '../../../../core/di/locator.dart';

class HomeViewModel extends BaseViewModel {
  bool isVisible = false;
  bool isLoadingWalletBalance = false;
  String walletBalance = "";
  void onToggleVisibility() {
    isVisible = !isVisible;
    notifyListeners();
  }

  void init() async {
    await getWalletBalance();
  }

  Future<void> getWalletBalance() async {
    final res = await businessRepo.getWalletBalance();
    if (res.success) {
      log(res.data.toString());
      walletBalance = res.data!.toDouble().toStringAsFixed(2);
    }
    notifyListeners();
  }
}
