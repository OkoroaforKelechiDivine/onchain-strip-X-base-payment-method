import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../../core/cores.dart';

class TvCableViewModel extends BaseViewModel {
  TextEditingController amountController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController decoderNumberController = TextEditingController();
  String? selectedElectricityProvider;
  String? selectedPackage;

  List<DropdownMenuItem<String>> packageItems = [
    const DropdownMenuItem<String>(
      value: "postpaid",
      child: Text("PostPaid"),
    ),
    const DropdownMenuItem<String>(
      value: "prepaid",
      child: Text("Prepaid"),
    ),
  ];
  List<DropdownMenuItem<String>> electricityProviderItems = [
    const DropdownMenuItem<String>(
      value: "ikeja-electric",
      child: Text("Ikeja Electric"),
    ),
    const DropdownMenuItem<String>(
      value: "eko-electric2",
      child: AppText("Eko Electric"),
    ),
    const DropdownMenuItem<String>(
      value: "kano-electric",
      child: Text("Kano Electric"),
    ),
    const DropdownMenuItem<String>(
      value: "portharcourt-electric",
      child: Text("Portharcourt Electric"),
    ),
    const DropdownMenuItem<String>(
      value: "jos-electric",
      child: Text("Jos Electric"),
    ),
    const DropdownMenuItem<String>(
      value: "ibadan-electric",
      child: AppText("IBEDC"),
    ),
    const DropdownMenuItem<String>(
      value: "kaduna-electric",
      child: Text("Kaduna Electric"),
    ),
    const DropdownMenuItem<String>(
      value: "abuja-electric",
      child: Text("Abuja Electric"),
    ),
    const DropdownMenuItem<String>(
      value: "enugu-electric",
      child: AppText("Enugu Electric"),
    ),
    const DropdownMenuItem<String>(
      value: "benin-electric",
      child: Text("Benin Electric"),
    ),
    const DropdownMenuItem<String>(
      value: "aba-electric",
      child: Text("Aba Electric"),
    ),
  ];

  void onSelectProvider(String? newVal) {
    selectedElectricityProvider = newVal;
    notifyListeners();
  }

  void onSelectPackage(String? newVal) {
    selectedPackage = newVal;
    notifyListeners();
  }
}
