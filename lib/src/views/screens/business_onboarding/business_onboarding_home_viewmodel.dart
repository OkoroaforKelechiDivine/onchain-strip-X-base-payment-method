import 'package:flutter/material.dart';
import 'package:pay_me_mobile/data/model/response/business/get_all_business.dart';
import 'package:stacked/stacked.dart';

import '../../../../core/cores.dart';

class BusinessOnboardingHomeVM extends BaseViewModel {
  int _currentIndex = 0;
  int get currentIndex => _currentIndex;
  bool isLoadingRoles = false;
  bool isLoadingAdmin = false;
  List<GetBusinessLisRes> businessList = [];

  GlobalKey<RefreshIndicatorState> refreshKey =
      GlobalKey<RefreshIndicatorState>();
  double startVerticalDragDetailsY = 0.0;
  double updateVerticalDragDetailsY = 0.0;

  Future<void> init() async {
    await getAllBusiness();
  }

  void setIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  Future<void> getAllBusiness() async {
    isLoadingAdmin = true;
    notifyListeners();
    final res = await businessRepo.getAllBusiness();
    if (res.success) {
      isLoadingAdmin = false;
      notifyListeners();
      businessList = res.data!.reversed.toList();
      notifyListeners();
    } else {
      isLoadingAdmin = false;
      notifyListeners();
      snackbarService.error(message: res.message!);
    }
  }
}
