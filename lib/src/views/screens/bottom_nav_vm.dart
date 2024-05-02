import 'package:flutter/material.dart';
import 'package:pay_me_mobile/core/utilities/permission.dart';
import 'package:pay_me_mobile/src/views/screens/settings_page/settings_page.dart';
import 'package:pay_me_mobile/src/views/screens/home/home_page_screen.dart';
import 'package:pay_me_mobile/src/views/screens/transaction_history/transaction_history.dart';
import 'package:stacked/stacked.dart';

class BottomNavViewModel extends BaseViewModel {
  int _currentIndex = 0;
  int get currentIndex => _currentIndex;
  set setCurrentIndex(int value) {
    _currentIndex = value;
  }

  final List<Widget> _children = [
    const HomePageScreen(),
    if (Permissions().canUserViewAllTransactions())
      const TransactionHistoryScreen(),
    //BuyAirtimeScreen(),
    const SettingsPage(),
  ];
  List<Widget> get children => _children;

  updateIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  resetValues() {
    _currentIndex = 0;
  }
}
