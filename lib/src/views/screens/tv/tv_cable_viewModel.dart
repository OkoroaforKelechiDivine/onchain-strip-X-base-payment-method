import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:pay_me_mobile/data/model/params/tv_param.dart';
import 'package:pay_me_mobile/data/model/response/tv_cable/buy_tv_cable_response.dart';
import 'package:pay_me_mobile/data/model/response/tv_cable/tv_cable_package_response.dart';
import 'package:pay_me_mobile/data/model/response/tv_cable/verify_smart_card_response.dart';
import 'package:pay_me_mobile/src/views/screens/tv/tv_cable_success.dart';
import 'package:stacked/stacked.dart';

import '../../../../core/cores.dart';

class TvCableViewModel extends BaseViewModel {
  TextEditingController amountController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController decoderNumberController = TextEditingController();
  VerifySmartCardResponse? verifySmartCardResponse;
  TvCableResponse? tvCableResponse;
  String? selectedTvCableProvider;
  String? selectedPackage;
  TvCablePackageResponse? selectedPackageResponse;
  bool isLoadingWalletBalance = false;
  String walletBalance = "0.0";
  bool isLoadingPackage = false;
  bool isLoadingSmartCardDetails = false;
  bool isLoadingPayment = false;

  void init() async {
    await getWalletBalance();
  }

  Future<void> getWalletBalance() async {
    isLoadingWalletBalance = true;
    notifyListeners();
    final res = await businessRepo.getWalletBalance();
    if (res.success) {
      log(res.data.toString());
      walletBalance = res.data!.toDouble().toStringAsFixed(2);
      notifyListeners();
      isLoadingWalletBalance = false;
      notifyListeners();
    }
    notifyListeners();
  }

  List<DropdownMenuItem<TvCablePackageResponse>> packageItems = [];
  List<DropdownMenuItem<String>> tvCableService = [
    const DropdownMenuItem<String>(
      value: "dstv",
      child: Text("DSTV Subscription"),
    ),
    const DropdownMenuItem<String>(
      value: "showmax",
      child: Text("ShowMax Subscription"),
    ),
    const DropdownMenuItem<String>(
      value: "startimes",
      child: Text("Startimes Subscription"),
    ),
    const DropdownMenuItem<String>(
      value: "gotv",
      child: Text("GOTV Subscription"),
    ),
  ];

  void onSelectProvider(String? newVal) async {
    selectedTvCableProvider = newVal;
    notifyListeners();
    if (selectedTvCableProvider != null) {
      await onGetPackages(selectedTvCableProvider!);
    }
  }

  void onSelectPackage(TvCablePackageResponse? newVal) {
    selectedPackageResponse = newVal;
    notifyListeners();
  }

  Future<void> onGetPackages(String packageNmae) async {
    isLoadingPackage = true;
    notifyListeners();
    final res = await bankRepo.getTvCablePackages(service: packageNmae);
    if (res.success) {
      packageItems = res.data!
          .map((e) => DropdownMenuItem<TvCablePackageResponse>(
                value: e,
                child: AppText(e.name),
              ))
          .toList();
      notifyListeners();
      isLoadingPackage = false;
      notifyListeners();
    } else {
      isLoadingPackage = false;
      notifyListeners();
      snackbarService.error(message: "Unable to get packages, Select Again");
    }
  }

  void onResolveDecoderNumber() async {
    if (decoderNumberController.text.isNotEmpty &&
        selectedTvCableProvider != null) {
      isLoadingSmartCardDetails = true;
      notifyListeners();
      final res = await bankRepo.verifySmarcardNumber(
          billersCode: int.parse(decoderNumberController.text),
          serviceID: selectedTvCableProvider!);
      if (res.success) {
        isLoadingSmartCardDetails = true;
        notifyListeners();
        verifySmartCardResponse = res.data;
      } else {
        isLoadingSmartCardDetails = false;
        notifyListeners();
        snackbarService.error(message: "Unable to resolve decoder number");
      }
    }
  }

  Future<void> onBuyTvCable() async {
    isLoadingPayment = true;
    notifyListeners();
    final preamount = double.parse(selectedPackageResponse!.variationAmount);
    final amount = preamount.toInt();
    final res = await bankRepo.buyTvCable(
      param: TvCableParam(
        serviceId: selectedTvCableProvider!,
        billersCode: decoderNumberController.text,
        amount: amount,
        phone: int.parse(phoneNumberController.text),
        subscriptionType: 'renew',
        variationCode: selectedPackageResponse!.variationCode,
      ),
    );
    if (res.success) {
      isLoadingPayment = false;
      notifyListeners();
      tvCableResponse = res.data;
      if (tvCableResponse != null) {
        navigationService
            .pushAndRemoveUntil(TVCableSuccessPage(res: tvCableResponse!));
      }
      snackbarService.success(message: "Payment Successful");
    } else {
      isLoadingPayment = false;
      notifyListeners();
      snackbarService.error(message: "Unable to make payment");
    }
  }
}
