import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class SignUpViewModel extends BaseViewModel {
  bool isOptionSelected = false;
  TextEditingController businessName = TextEditingController();
  TextEditingController businessAddress = TextEditingController();
  TextEditingController incorporateDate = TextEditingController();
  TextEditingController incorporateDateController = TextEditingController();
  TextEditingController rcNumber = TextEditingController();
  int? registrationStatusIndex;

  List<String> registrationOptions = ['Registered', 'Non-registered'];

  void onRegistrationStatusChanged(int? index) {
    registrationStatusIndex = index;
    isOptionSelected = index != null;
    notifyListeners();
  }

  void setIncorporateDate(String date) {
    incorporateDateController.text = date;
  }
}