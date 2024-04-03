import 'package:flutter/material.dart';
import 'package:pay_me_mobile/data/model/response/business/get_all_business.dart';
import 'package:stacked/stacked.dart';

import '../../../../core/cores.dart';

class BusinessOnboardingHomeVM extends BaseViewModel {
  int _currentIndex = 0;
  int get currentIndex => _currentIndex;
  bool isLoadingBusiness = false;
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
    isLoadingBusiness = true;
    notifyListeners();
    final res = await businessRepo.getAllBusiness();
    if (res.success) {
      isLoadingBusiness = false;
      notifyListeners();
      businessList = res.data!.reversed.toList();
      notifyListeners();
    } else {
      isLoadingBusiness = false;
      notifyListeners();
      snackbarService.error(message: res.message!);
    }
  }
}
