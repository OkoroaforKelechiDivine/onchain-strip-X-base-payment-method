import 'package:flutter/material.dart';
import 'package:pay_me_mobile/core/di/locator.dart';
import 'package:pay_me_mobile/data/model/params/update_admin_param.dart';
import 'package:pay_me_mobile/data/model/response/user_management/get_admin_list_res.dart';
import 'package:pay_me_mobile/data/model/response/user_management/get_role_list_res.dart';
import 'package:stacked/stacked.dart';

class UpdateAdminViewModel extends BaseViewModel {
  TextEditingController firstNameTEC = TextEditingController();
  TextEditingController lastNameTEC = TextEditingController();
  GetRoleListRes? selectedRole;
  bool isLoading = false;

  void setText(GetAdminListRes admin, List<GetRoleListRes> customers) {
    firstNameTEC.text = admin.firstName;
    lastNameTEC.text = admin.lastName;
    //selectedRole = admin.role;
    selectedRole = customers.firstWhere(
      (customer) => customer.label == admin.role,
      //orElse: () => null,
    );
  }

  Future<void> createAdmin(Function()? onPop, String id) async {
    isLoading = true;
    notifyListeners();
    final res = await adminRepo.updateAdmin(
      param: UpdateAdminParam(
        firstName: firstNameTEC.text,
        lastName: lastNameTEC.text,
        role: selectedRole!.label,
      ),
      id: id,
    );
    if (res.success) {
      isLoading = false;
      notifyListeners();
      snackbarService.success(message: "Admin Updated successfully");
      onPop?.call();
      navigationService.pop();
      notifyListeners();
    } else {
      isLoading = false;
      notifyListeners();
      snackbarService.error(message: res.message!);
    }
  }

  void selectRole(GetRoleListRes? val) {
    selectedRole = val;

    notifyListeners();
  }
}
