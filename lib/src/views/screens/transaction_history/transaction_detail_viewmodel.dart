import 'package:flutter/material.dart';
import 'package:pay_me_mobile/core/di/locator.dart';
import 'package:pay_me_mobile/data/model/params/create_ticket_param.dart';
import 'package:stacked/stacked.dart';

class TransactionDetailViewModel extends BaseViewModel {
  void onReport(Widget child) {
    bottomSheetService.show(child);
    notifyListeners();
  }
}
