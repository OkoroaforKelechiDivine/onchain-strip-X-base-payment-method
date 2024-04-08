import 'package:flutter/material.dart';
import 'package:pay_me_mobile/core/di/locator.dart';
import 'package:pay_me_mobile/data/model/params/request_pos_account_param.dart';
import 'package:pay_me_mobile/src/views/screens/request_pos_account/request_success_page.dart';
import 'package:stacked/stacked.dart';

class RequestForAccountPOSVM extends BaseViewModel {
  TextEditingController firstnameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController emailnameController = TextEditingController();

  TextEditingController phoneController = TextEditingController();
  TextEditingController businessAddressController = TextEditingController();
  TextEditingController bvnController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController businessNameController = TextEditingController();
  TextEditingController rcNumberController = TextEditingController();
  //String requestType = 'account';
  DateTime selectedDate = DateTime.now();

  Future<void> selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1971),
      lastDate: DateTime(DateTime.now().year + 1),
    );
    notifyListeners();
    if (picked != null && picked != selectedDate) {
      selectedDate = picked;
      notifyListeners();
    }
  }

  bool isLoading = false;

  bool validate() {
    if (firstnameController.text.isEmpty ||
        lastnameController.text.isEmpty ||
        emailnameController.text.isEmpty ||
        phoneController.text.isEmpty ||
        businessAddressController.text.isEmpty ||
        bvnController.text.isEmpty ||
        stateController.text.isEmpty ||
        businessNameController.text.isEmpty ||
        rcNumberController.text.isEmpty ||
        selectedDate.toString().isEmpty) {
      return true;
    }
    return false;
  }

  Future<void> requestPos() async {
    isLoading = true;
    notifyListeners();
    if (validate()) {
      snackbarService.error(message: "All fields are required");
    } else {
      final res = await posRepo.requestPOSAccount(
        param: RequestPosAccountParam(
          firstName: firstnameController.text.trim(),
          lastName: lastnameController.text.trim(),
          email: emailnameController.text.trim(),
          phone: phoneController.text.trim(),
          businessAddress: businessAddressController.text.trim(),
          state: stateController.text.trim(),
          bvn: bvnController.text.trim(),
          businessName: businessNameController.text.trim(),
          rcNumber: rcNumberController.text.trim(),
          incorporationDate: "${selectedDate.toLocal()}".split(' ')[0],
        ),
      );
      if (res.success) {
        snackbarService.success(message: res.data!);
        navigationService.pushAndRemoveUntil(const RequestSucessPage());
      } else {
        snackbarService.error(message: res.message!);
        isLoading = false;
        notifyListeners();
      }
    }
    isLoading = false;
    notifyListeners();
  }

  // void setRequestType(String value) {
  //   requestType = value;
  //   notifyListeners();
  // }
}
