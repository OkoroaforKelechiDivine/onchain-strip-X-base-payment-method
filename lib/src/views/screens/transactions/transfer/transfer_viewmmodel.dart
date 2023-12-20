import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:pay_me_mobile/core/cores.dart';
import 'package:pay_me_mobile/data/model/response/transaction_response/bank_response.dart';
import 'package:pay_me_mobile/data/model/response/transaction_response/beneficiary_detail_response.dart';
import 'package:pay_me_mobile/src/views/screens/transactions/transfer/components/dummy_bank.dart';
import 'package:stacked/stacked.dart';

class TransferViewModel extends BaseViewModel {
  TextEditingController accountNumberController = TextEditingController();
  TextEditingController searchController = TextEditingController();
  BeneficiaryDetailResponse? beneficiaryDetailResponse;
  bool showBankList = true;
  bool isLoadingBankList = true;
  bool isLoadingbeneficiaryDetail = false;
  final String userName = '';
  final bool showLinearProcessing = false;
  final String selectedBankLogo = '';
  BankResponse? selectedBank;
  final String? selectedBankController = null;
  int currentIndex = 0;
  final List<BankResponse> bankList = [];
  List<BankResponse> filteredBanks = [];
  var currentBeneficiaries = appGlobals.beneficiaries ?? [];

  void init() async {
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

  void onShowBank() {
    showBankList = !showBankList;
    log(showBankList.toString());
    notifyListeners();
  }

  void onHideBank() {
    showBankList = false;
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

  void onSelectBank(BankResponse bank) {
    selectedBank = bank;
    showBankList = false;
    log(selectedBank!.code);
    notifyListeners();
  }

  Future<void> getBeneficiaryDetails() async {
    isLoadingbeneficiaryDetail = true;
    notifyListeners();
    final res = await bankRepo.getBeneficiaryAccountDetails(
        bank: selectedBank!, accountNumber: accountNumberController.text);
    if (res.success) {
      beneficiaryDetailResponse = res.data;
      notifyListeners();
    } else {
      isLoadingbeneficiaryDetail = false;
      snackbarService.error(message: res.message ?? "Something went wrong");
    }
    notifyListeners();
  }

  void onSearchBank(String value) {
    filteredBanks = bankList
        .where((item) => item.name.toLowerCase().contains(value.toLowerCase()))
        .toList();
    notifyListeners();
  }
}
