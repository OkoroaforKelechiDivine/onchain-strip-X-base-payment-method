import 'package:flutter/material.dart';
import 'package:pay_me_mobile/core/di/locator.dart';
import 'package:pay_me_mobile/data/model/response/invoice/get_all_invoice_list_response.dart';
import 'package:pay_me_mobile/data/model/response/invoice/get_customer_res.dart';
import 'package:pay_me_mobile/data/model/response/user_management/get_admin_list_res.dart';
import 'package:pay_me_mobile/data/model/response/user_management/get_role_list_res.dart';
import 'package:stacked/stacked.dart';

class UserManagementHomeVM extends BaseViewModel {
  int _currentIndex = 0;
  int get currentIndex => _currentIndex;
  bool isLoadingRoles = false;
  bool isLoadingAdmin = false;
  List<GetAdminListRes> adminList = [];
  List<GetRoleListRes> roleList = [];
  GlobalKey<RefreshIndicatorState> refreshKey =
      GlobalKey<RefreshIndicatorState>();
  double startVerticalDragDetailsY = 0.0;
  double updateVerticalDragDetailsY = 0.0;

  Future<void> init() async {
    await getAllAdmin();
    await getAllRoles();
  }

  void setIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  Future<void> getAllAdmin() async {
    isLoadingAdmin = true;
    notifyListeners();
    final res = await adminRepo.getAllAdmin();
    if (res.success) {
      isLoadingAdmin = false;
      notifyListeners();
      adminList = res.data!.reversed.toList();
      notifyListeners();
    } else {
      isLoadingAdmin = false;
      notifyListeners();
      snackbarService.error(message: res.message!);
    }
  }

  Future<void> deleteAdmin(String id) async {
    isLoadingRoles = true;
    notifyListeners();
    final res = await adminRepo.deleteAdmin(name: id);
    if (res.success) {
      isLoadingRoles = false;
      notifyListeners();
      snackbarService.success(message: "User Deleted Successfully");
      getAllAdmin();
      notifyListeners();
    } else {
      isLoadingRoles = false;
      notifyListeners();
      snackbarService.error(message: res.message!);
    }
  }

  Future<void> getAllRoles() async {
    isLoadingRoles = true;
    notifyListeners();
    final res = await roleRepo.getAllRoles();
    if (res.success) {
      isLoadingRoles = false;
      notifyListeners();
      roleList = res.data!.reversed.toList();
      ;
      notifyListeners();
    } else {
      isLoadingRoles = false;
      notifyListeners();
      snackbarService.error(message: res.message!);
    }
  }
}
