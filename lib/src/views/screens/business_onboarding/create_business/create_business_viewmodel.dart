import 'package:flutter/material.dart';
import 'package:pay_me_mobile/core/di/locator.dart';
import 'package:pay_me_mobile/data/model/params/business_tyoe_model.dart';
import 'package:pay_me_mobile/data/model/params/create_business_param.dart';
import 'package:stacked/stacked.dart';

class CreateBusinessVm extends BaseViewModel {
  TextEditingController businessNameController = TextEditingController();
  TextEditingController businessEmailController = TextEditingController();
  TextEditingController businessPhoneController = TextEditingController();
  TextEditingController businessAddressController = TextEditingController();
  TextEditingController rcNumberController = TextEditingController();
  TextEditingController bvnController = TextEditingController();
  TextEditingController firstnameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController middleNameController = TextEditingController();
  TextEditingController usernameController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool isLoading = false;
  bool checkingUsername = false;
  bool? isUsernameAvailable;
  BusinessType? selectedBusinessType;
  List<BusinessType> bussinessTypes = [
    BusinessType(name: "Merchant", value: "merchant"),
    BusinessType(name: "POS Agent", value: "agent"),
  ];
  String registrationStatus = "Not Registered";
  List<String> registrationStatusType = [
    "Not Registered",
    "Registered",
  ];
  String gender = "Male";
  List<String> genderType = ["Male", "Female"];
  DateTime selectedIncoporationDate = DateTime.now();
  DateTime selectedDOB = DateTime.now();

  Future<void> selectDOB(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDOB,
      firstDate: DateTime(1971),
      lastDate: DateTime(DateTime.now().year + 1),
    );
    notifyListeners();
    if (picked != null && picked != selectedDOB) {
      selectedDOB = picked;
      notifyListeners();
    }
  }

  Future<void> selectIncoporationDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedIncoporationDate,
      firstDate: DateTime(1971),
      lastDate: DateTime(DateTime.now().year + 1),
    );
    notifyListeners();
    if (picked != null && picked != selectedIncoporationDate) {
      selectedIncoporationDate = picked;
      notifyListeners();
    }
  }

  void selectBusinessType(BusinessType? val) {
    selectedBusinessType = val;
    notifyListeners();
  }

  void selectGender(String val) {
    gender = val;
    notifyListeners();
  }

  void selectRegistrationStatusType(String val) {
    registrationStatus = val;
    notifyListeners();
  }

  //Write a code that will validate that the fields are not empty
  void validateForm(Function()? onPop) {
    if (formKey.currentState!.validate()) {
      createBusiness(onPop);
    } else {
      snackbarService.error(message: "All fields are required");
    }
  }

  void checkUsername() async {
    if (usernameController.text.isEmpty) {
      isUsernameAvailable = null;
      checkingUsername = false;
      notifyListeners();
    } else {
      checkingUsername = true;
      notifyListeners();
      final res =
          await authRepo.checkUsername(username: usernameController.text);
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

  void createBusiness(Function()? onPop) async {
    isLoading = true;
    notifyListeners();
    final business = CreateBusinessParam(
      businessName: businessNameController.text.trim(),
      businessEmail: businessEmailController.text.trim(),
      businessPhone: businessPhoneController.text.trim(),
      businessAddress: businessAddressController.text.trim(),
      registrationNumber: registrationStatus == "Registered"
          ? rcNumberController.text.trim()
          : "",
      bvn: bvnController.text.trim(),
      firstname: firstnameController.text.trim(),
      lastname: lastnameController.text.trim(),
      middlename: middleNameController.text.trim(),
      username: usernameController.text.trim(),
      businessType: selectedBusinessType!.value,
      registered: registrationStatus == "Registered" ? true : false,
      dob: "${selectedDOB.toLocal()}".split(' ')[0],
      gender: gender,
      registrationDate: registrationStatus == "Registered"
          ? "${selectedIncoporationDate.toLocal()}".split(' ')[0]
          : '',
    );
    final res = await businessRepo.createBusiness(
      param: business,
    );
    if (res.success == true) {
      snackbarService.success(message: "Business Created Successfully");
      isLoading = false;
      notifyListeners();
      onPop?.call();
      navigationService.pop();
    } else {
      snackbarService.error(message: res.message ?? "Something went wrong");
      isLoading = false;
      notifyListeners();
    }
  }
}
