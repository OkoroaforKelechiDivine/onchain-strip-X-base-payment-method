import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../../core/di/locator.dart';

class HomeViewModel extends BaseViewModel {
  GlobalKey<RefreshIndicatorState> refreshKey =
      GlobalKey<RefreshIndicatorState>();
  bool isVisible = false;
  bool isLoadingWalletBalance = false;
  String walletBalance = "0.00";
  double startVerticalDragDetailsY = 0.0;
  double updateVerticalDragDetailsY = 0.0;
  void onToggleVisibility() {
    isVisible = !isVisible;
    notifyListeners();
  }

  Future<void> init() async {
    await getWalletBalance();
    notificationListener();
  }

  void notificationListener() async {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      if (message.notification != null) {
        await getWalletBalance();
      }
    });
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
