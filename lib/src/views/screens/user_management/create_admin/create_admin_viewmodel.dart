import 'package:flutter/material.dart';
import 'package:pay_me_mobile/core/di/locator.dart';
import 'package:pay_me_mobile/data/model/params/create_admin_param.dart';
import 'package:pay_me_mobile/data/model/response/user_management/get_role_list_res.dart';
import 'package:stacked/stacked.dart';

class CreateAdminViewModel extends BaseViewModel {
  TextEditingController firstNameTEC = TextEditingController();
  TextEditingController emailAddressTEC = TextEditingController();
  TextEditingController lastNameTEC = TextEditingController();
  TextEditingController usernameTEC = TextEditingController();
  GetRoleListRes? selectedRole;
  bool isLoading = false;
  bool checkingUsername = false;
  bool? isUsernameAvailable;

  Future<void> createAdmin(Function()? onPop) async {
    isLoading = true;
    notifyListeners();
    final res = await adminRepo.createAdmin(
      param: CreateAdminParam(
        firstName: firstNameTEC.text,
        email: emailAddressTEC.text,
        username: usernameTEC.text,
        lastName: lastNameTEC.text,
        role: selectedRole!.label,
      ),
    );
    if (res.success) {
      isLoading = false;
      notifyListeners();
      snackbarService.success(message: "Admin created successfully");
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

  void checkUsername() async {
    checkingUsername = true;
    notifyListeners();
    final res = await authRepo.checkUsername(username: usernameTEC.text);
    if (res.success == true) {
      isUsernameAvailable = res.data;
      checkingUsername = false;
      notifyListeners();
    } else {
      snackbarService.error(message: "Unable to check Username");
      checkingUsername = false;
      notifyListeners();
    }
  }
}
