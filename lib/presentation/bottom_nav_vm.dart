import 'package:flutter/material.dart';
import 'package:pay_me_mobile/core/cores.dart';
import 'package:stacked/stacked.dart';

class BottomNavViewModel extends BaseViewModel {
  int _currentIndex = 0;
  int get currentIndex => _currentIndex;
  set setCurrentIndex(int value) {
    _currentIndex = value;
  }

  final List<Widget> _children = [
    const Center(
      child: AppText("Home"),
    ),
    const Center(
      child: AppText("Manage User"),
    ),
    const Center(
      child: AppText("Setting"),
    ),
    const Center(
      child: AppText("Switch Accout"),
    ),
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
