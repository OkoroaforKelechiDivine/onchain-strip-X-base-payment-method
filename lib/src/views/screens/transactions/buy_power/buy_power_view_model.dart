import 'package:flutter/material.dart';
import 'package:pay_me_mobile/core/di/locator.dart';
import 'package:pay_me_mobile/core/utilities/string_util.dart';
import 'package:pay_me_mobile/data/model/params/buy_power_param.dart';
import 'package:pay_me_mobile/data/model/params/verify_meter_paam.dart';
import 'package:pay_me_mobile/data/model/response/power/buy_power_response.dart';
import 'package:pay_me_mobile/data/model/response/power/verify_meter_response.dart';
import 'package:pay_me_mobile/src/views/screens/transactions/buy_power/buy_power_success.dart';
import 'package:stacked/stacked.dart';

import '../../../../../core/widgets/app_text.dart';

class BuyPowerViewModel extends BaseViewModel {
  TextEditingController amountController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController meterNumberController = TextEditingController();
  String? selectedElectricityProvider;
  String? selectedPackage;
  VerifyMeterResponse? verifyMeterResponse;
  BuyPowerResponse? buyPowerResponse;
  bool isLoadingMeterDetails = false;
  bool buyingPower = false;

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

  Future<void> verifyMeterDetails() async {
    isLoadingMeterDetails = true;
    notifyListeners();
    final res = await bankRepo.verifyMeterNumber(
        param: VerifyMeterParam(
      billersCode: int.parse(meterNumberController.text),
      serviceId: selectedElectricityProvider!,
      type: selectedPackage!,
    ));
    if (res.success) {
      verifyMeterResponse = res.data;
      notifyListeners();
    } else {
      isLoadingMeterDetails = false;
      snackbarService.error(message: res.message ?? "Something went wrong");
    }
    notifyListeners();
  }

  Future<void> onBuyPower() async {
    buyingPower = true;
    notifyListeners();
    if (selectedElectricityProvider == null) {
      snackbarService.error(message: "Please select electricity provider");
      return;
    } else if (selectedPackage == null) {
      snackbarService.error(message: "Please select package");
      return;
    } else {
      final res = await bankRepo.buyPower(
        param: BuyPowerParam(
          serviceId: selectedElectricityProvider!,
          billersCode: meterNumberController.text,
          variationCode: selectedPackage!,
          amount: int.parse(decomposeAmount(amountController.text)),
          phone: int.parse(phoneNumberController.text),
        ),
      );
      if (res.success) {
        buyPowerResponse = res.data;
        buyingPower = false;
        notifyListeners();
        navigationService.pushAndRemoveUntil(
            BuyPowerSuccess(buyPowerResponse: buyPowerResponse!));
      } else {
        buyingPower = false;
        snackbarService.error(message: res.message ?? "Something went wrong");
      }
    }
  }
}
