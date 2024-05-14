import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';

class PersonalInformationViewModel extends BaseViewModel{
  bool isStateOptionSelected = false;
  bool isGenderOptionSelected = false;

  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController emailAddress = TextEditingController();
  TextEditingController bvn = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController password = TextEditingController();

  int? stateIndex;
  int? genderIndex;

  List<String> stateOptions = ['Lagos', 'Imo', 'Ogun', 'Aba', 'Kaduna'];
  List<String> genderOptions = ['Male', 'Female'];

  void onStateChanged(int? index) {
    stateIndex = index;
    isStateOptionSelected = index != null;
    notifyListeners();
  }

  void onGenderChanged(int? index) {
    genderIndex = index;
    isGenderOptionSelected = index != null;
    notifyListeners();
  }

}