import 'package:flutter/material.dart';
import 'package:pay_me_mobile/data/model/response/transaction_response/bank_response.dart';

import '../../data/model/model.dart';
import '../cores.dart';

class AppGlobals extends ChangeNotifier {
  static AppGlobals instance = AppGlobals._();
  AppGlobals._();

  String? _token;
  User? _user;
  List<BankResponse>? _banks;

  Future<void> init() async {
    _token = authLocalStorage.getToken();
    _user = appLocalStorage.getUser();
    _banks = appLocalStorage.getBanks();
  }

  set token(String? value) {
    _token = value;
    notifyListeners();
  }

  set user(User? value) {
    _user = value;
    notifyListeners();
  }

  set banks(List<BankResponse>? value) {
    _banks = value;
    notifyListeners();
  }

  String? get token => _token;
  User? get user => _user;
  List<BankResponse>? get banks => _banks;
}
