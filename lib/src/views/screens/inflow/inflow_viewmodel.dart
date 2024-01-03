import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pay_me_mobile/core/di/locator.dart';
import 'package:pay_me_mobile/data/model/response/transaction_response/inflow_response.dart';
import 'package:stacked/stacked.dart';

class InflowViewmodel extends BaseViewModel {
  GlobalKey<RefreshIndicatorState> refreshKey =
      GlobalKey<RefreshIndicatorState>();
  double startVerticalDragDetailsY = 0.0;
  double updateVerticalDragDetailsY = 0.0;
  bool isProcessing = false;
  List<InflowResponse> inflowList = [];

  Future<void> init() async {
    await getInflow();
  }

  Future<void> getInflow() async {
    isProcessing = true;
    notifyListeners();
    final res = await transactionRepo.getInflowList();
    if (res.success) {
      isProcessing = false;
      notifyListeners();
      inflowList = res.data!;
      notifyListeners();
    } else {
      isProcessing = false;
      notifyListeners();
      snackbarService.error(message: res.message!);
    }
  }

  String formatTimestamp(DateTime timestamp) {
    return DateFormat('dd/MM/yyyy HH:mm a').format(timestamp);
  }
}
