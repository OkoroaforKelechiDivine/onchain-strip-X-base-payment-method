import 'package:flutter/cupertino.dart';
import 'package:pay_me_mobile/core/di/locator.dart';
import 'package:pay_me_mobile/data/model/params/request_pos_account_param.dart';
import 'package:pay_me_mobile/src/views/screens/auth/login_screen.dart';
import 'package:stacked/stacked.dart';

class RequestForAccountPOSVM extends BaseViewModel {
  TextEditingController firstnameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController emailnameController = TextEditingController();

  TextEditingController phoneController = TextEditingController();
  TextEditingController businessAddressController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  String requestType = 'account';
  bool isLoading = false;

  bool validate() {
    if (firstnameController.text.isEmpty ||
        lastnameController.text.isEmpty ||
        emailnameController.text.isEmpty ||
        phoneController.text.isEmpty ||
        businessAddressController.text.isEmpty ||
        stateController.text.isEmpty ||
        requestType == null) {
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
          firstName: firstnameController.text,
          lastName: lastnameController.text,
          email: emailnameController.text,
          phone: phoneController.text,
          businessAddress: businessAddressController.text,
          state: stateController.text,
          requestType: requestType,
        ),
      );
      if (res.success) {
        snackbarService.success(message: res.data!);
        navigationService.pushAndRemoveUntil(const LoginScreen());
      } else {
        snackbarService.error(message: res.message!);
        isLoading = false;
        notifyListeners();
      }
    }
    isLoading = false;
    notifyListeners();
  }

  void setRequestType(String value) {
    requestType = value;
    notifyListeners();
  }
}
