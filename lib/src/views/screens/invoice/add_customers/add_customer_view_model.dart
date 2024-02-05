import 'package:flutter/material.dart';
import 'package:pay_me_mobile/data/model/params/create_customer_param.dart';
import 'package:stacked/stacked.dart';

import '../../../../../core/cores.dart';

class AddCustomerViewModel extends BaseViewModel {
  TextEditingController customerNameTEC = TextEditingController();
  TextEditingController customerEmailAddressTEC = TextEditingController();
  TextEditingController customerPhoneNumberTEC = TextEditingController();
  TextEditingController customerAddressTEC = TextEditingController();
  TextEditingController customerStateTEC = TextEditingController();
  bool isLoading = false;

  Future<void> addCustomer() async {
    isLoading = true;
    notifyListeners();
    final res = await invoiceRepo.createCustomer(
      param: CreateCustomerParam(
        name: customerNameTEC.text,
        email: customerEmailAddressTEC.text,
        phone: customerPhoneNumberTEC.text,
        address: customerAddressTEC.text,
        state: customerStateTEC.text,
      ),
    );
    if (res.success) {
      isLoading = false;
      notifyListeners();
      snackbarService.success(message: res.data!.message);
      navigationService.pop();
      notifyListeners();
    } else {
      isLoading = false;
      notifyListeners();
      snackbarService.error(message: res.message!);
    }
  }
}
