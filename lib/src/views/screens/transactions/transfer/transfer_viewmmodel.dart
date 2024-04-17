import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:pay_me_mobile/core/cores.dart';
import 'package:pay_me_mobile/data/model/response/auth/beneficiary.dart';
import 'package:pay_me_mobile/data/model/response/transaction_response/bank_response.dart';
import 'package:pay_me_mobile/data/model/response/transaction_response/beneficiary_detail_response.dart';
import 'package:stacked/stacked.dart';

class TransferViewModel extends BaseViewModel {
  TextEditingController accountNumberController = TextEditingController();
  TextEditingController searchController = TextEditingController();
  BeneficiaryDetailResponse? beneficiaryDetailResponse;
  bool loadingBeneficiaries = false;
  bool showBankList = true;
  bool isLoadingBankList = true;
  bool isLoadingbeneficiaryDetail = false;
  final String userName = '';
  final bool showLinearProcessing = false;
  bool deletingBeneficiary = false;
  final String selectedBankLogo = '';
  BankResponse? selectedBank;
  final String? selectedBankController = null;
  int currentIndex = 0;
  final List<BankResponse> bankList = [];
  List<BankResponse> filteredBanks = [];
  List<BankBeneficiaryListRes>? currentBeneficiaries;

  void init() async {
    await getBeneficiaries();
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

  Future<void> getBeneficiaries() async {
    loadingBeneficiaries = true;
    notifyListeners();
    final res = await authRepo.getBeneficiaryList();
    if (res.success) {
      currentBeneficiaries = res.data!;
      loadingBeneficiaries = false;
      notifyListeners();
    } else {
      currentBeneficiaries = [];
      loadingBeneficiaries = false;
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

  Future<void> fromBeneficiary(BankBeneficiaryListRes beneficiary) async {
    accountNumberController.text = beneficiary.accountNumber;
    selectedBank = BankResponse(
        id: 11,
        code: beneficiary.bankCode,
        name: beneficiary.bank,
        logo: "",
        created: DateTime.now());
    await getBeneficiaryDetails();
    notifyListeners();
  }

  Future<void> deleteBeneficiary(
      {required String accountNumber, required String bankName}) async {
    deletingBeneficiary = true;
    notifyListeners();
    final res = await authRepo.deleteBeneficiary(
        accountNumber: accountNumber, bankName: bankName);
    if (res.success) {
      await getBeneficiaries();
      snackbarService.success(message: "Beneficiary deleted");
    } else {
      snackbarService.error(message: res.message ?? "Something went wrong");
    }
    deletingBeneficiary = false;
    notifyListeners();
  }
}
