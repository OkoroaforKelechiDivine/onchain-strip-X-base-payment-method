import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pay_me_mobile/core/di/locator.dart';
import 'package:pay_me_mobile/data/model/params/create_role_param.dart';
import 'package:pay_me_mobile/data/model/params/update_role_param.dart';
import 'package:pay_me_mobile/data/model/response/user_management/get_role_list_res.dart';
import 'package:stacked/stacked.dart';

class CreateRolesViewModel extends BaseViewModel {
  TextEditingController roleNameTEC = TextEditingController();
  bool isLoading = false;

  Map<String, String> actions = {
    "ACTIVATE_AND_DEACTIVATE_USERS": "activate and deactivate users",
    "CAN_APPROVE_PAYMENT": "can approve payment",
    "CAN_INITIATE_PAYMENT": "can initiate payment",
    "CAN_SET_TRANSACTION_PIN": "can set transaction pin",
    "CAN_TRANSFER": "can transfer",
    "CAN_VIEW_OUTLETS": "can view outlet",
    "CREATE_ROLE": "create roles",
    "DEACTIVATE_DEVICE": "deactivate device",
    "VIEW_ALL_TRANSACTIONS": "view all transactions",
    "VIEW_POS_DEVICES": "view pos devices",
    "VIEW_REPORTS": "view reports"
  };

  List<String> selectedActions = [];
  void handleCheckboxChange(bool? value, String key) {
    if (value == true && !selectedActions.contains(key)) {
      selectedActions.add(key);
    } else if (value == false) {
      selectedActions.remove(key);
    }
    notifyListeners();
    print(selectedActions);
  }

  void setRoles(GetRoleListRes role) {
    roleNameTEC.text = role.label;
    selectedActions = List<String>.from(jsonDecode(role.actions));
  }

  Future<void> createRole(Function()? onPop, GetRoleListRes? role) async {
    isLoading = true;
    notifyListeners();
    final res = role != null
        ? await roleRepo.updateROle(
            id: role.id.toString(),
            param: UpdateRoleParam(
                label: roleNameTEC.text.trim(), actions: selectedActions),
          )
        : await roleRepo.createRole(
            param: CreateRoleParam(
                label: roleNameTEC.text.trim(), actions: selectedActions),
          );
    if (res.success) {
      isLoading = false;
      notifyListeners();
      snackbarService.success(
          message: role != null
              ? "Role Updated Successfully"
              : "Role created successfully");
      onPop?.call();
      navigationService.pop();
      notifyListeners();
    } else {
      isLoading = false;
      notifyListeners();
      snackbarService.error(message: res.message!);
    }
  }
}
