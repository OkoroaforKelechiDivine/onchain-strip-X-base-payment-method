import 'package:flutter/material.dart';
import 'package:pay_me_mobile/src/views/screens/settings_page/settings_page.dart';
import 'package:pay_me_mobile/src/views/screens/transactions/buy_airtime/buy_airtime_screen.dart';
import 'package:pay_me_mobile/src/views/screens/transactions/buy_power/buy_power_screen.dart';
import 'package:pay_me_mobile/src/views/screens/home/home_page_screen.dart';
import 'package:pay_me_mobile/src/views/screens/transaction_history/transaction_history.dart';

class BottomNavViewModel extends ChangeNotifier {
  int _currentIndex = 0;
  int get currentIndex => _currentIndex;
  set setCurrentIndex(int value) {
    _currentIndex = value;
  }

  final List<Widget> _children = [
    HomePageScreen(),
    TransactionHistoryScreen(),
    BuyAirtimeScreen(),
    SettingsPage(),
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
