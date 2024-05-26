import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:pay_me_mobile/core/constants/app_assets.dart';
import 'package:pay_me_mobile/data/model/response/transaction_response/bank_response.dart';
import 'package:pay_me_mobile/data/model/response/transaction_response/beneficiary_detail_response.dart';
import 'package:pay_me_mobile/presentation/transfer/enter_amount.dart';
import 'package:stacked/stacked.dart';

import '../../core/di/locator.dart';

enum TransferOption {
  NEW,
  BENEFICIARY,
}

class TransferViewModel extends BaseViewModel {
  bool isBankOptionSelected = false;
  int _currentIndex = 0;
  int get currentIndex => _currentIndex;
  TextEditingController amount = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController accountNumber = TextEditingController();
  TextEditingController searchController = TextEditingController();

  final List<BankResponse> bankList = [];
  List<BankResponse> filteredBanks = [];
  BankResponse? selectedBank;
  BeneficiaryDetailResponse? beneficiaryDetailResponse;
  bool loadingBeneficiaries = false;
  bool showBankList = false;
  bool isLoadingBankList = true;
  bool isLoadingbeneficiaryDetail = false;

  void init() async {
    //await getBeneficiaries();
    if (appGlobals.banks == null) {
      log("banks is null");
      await getBankList();
    } else {
      log("banks is not null");
      log(appGlobals.banks!.length.toString());
      bankList.addAll(appGlobals.banks!);
      filteredBanks = bankList;
      isLoadingBankList = false;
      notifyListeners();
    }
  }

  void setIndex(int val) {
    _currentIndex = val;
    notifyListeners();
  }

  void onSearchBank(String value) {
    filteredBanks = bankList
        .where((item) => item.name.toLowerCase().contains(value.toLowerCase()))
        .toList();
    notifyListeners();
  }

  void onShowBank() {
    showBankList = !showBankList;
    log(showBankList.toString());
    notifyListeners();
  }

  void onHideBank() {
    showBankList = false;
    notifyListeners();
  }

  void onSelectBank(BankResponse bank) {
    selectedBank = bank;
    showBankList = false;
    log(selectedBank!.code);
    notifyListeners();
  }

  Future<void> getBankList() async {
    final res = await bankRepo.getBankList();
    if (res.success) {
      bankList.addAll(res.data!);
      isLoadingBankList = false;
      filteredBanks = bankList;
      notifyListeners();
    } else {
      isLoadingBankList = false;
      snackbarService.error(message: res.message ?? "Something went wrong");
    }
  }

  Future<void> getBeneficiaryDetails() async {
    isLoadingbeneficiaryDetail = true;
    notifyListeners();
    final res = await bankRepo.getBeneficiaryAccountDetails(
        bank: selectedBank!, accountNumber: accountNumber.text.trim());
    if (res.success) {
      beneficiaryDetailResponse = res.data;
      notifyListeners();
    } else {
      isLoadingbeneficiaryDetail = false;
      snackbarService.error(message: res.message ?? "Something went wrong");
    }
    notifyListeners();
  }
}
