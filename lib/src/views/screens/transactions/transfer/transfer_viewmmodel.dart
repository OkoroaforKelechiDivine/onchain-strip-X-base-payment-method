import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:pay_me_mobile/core/cores.dart';
import 'package:pay_me_mobile/data/model/response/transaction_response/bank_response.dart';
import 'package:pay_me_mobile/data/model/response/transaction_response/beneficiary_detail_response.dart';
import 'package:pay_me_mobile/src/views/screens/transactions/transfer/components/dummy_bank.dart';
import 'package:stacked/stacked.dart';

class TransferViewModel extends BaseViewModel {
  TextEditingController accountNumberController = TextEditingController();
  BeneficiaryDetailResponse? beneficiaryDetailResponse;
  bool showBankList = true;
  bool isLoadingBankList = true;
  final String userName = '';
  final bool showLinearProcessing = false;
  final String selectedBankLogo = '';
  BankResponse? selectedBank;
  final String? selectedBankController = null;
  int currentIndex = 0;
  final List<BankResponse> bankList = [];

  void init() async {
    await getBankList();
  }

  List<DummyBank> filteredBanks = [];

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
      notifyListeners();
    } else {
      isLoadingBankList = false;
      snackbarService.error(message: res.message ?? "Something went wrong");
    }
  }

  void onSelectBank(BankResponse bank) {
    selectedBank = bank;
    showBankList = false;
    log(selectedBank!.name);
    notifyListeners();
  }

  Future<void> getBeneficiaryDetails() async {
    final res = await bankRepo.getBeneficiaryAccountDetails(
        bank: selectedBank!, accountNumber: accountNumberController.text);
    if (res.success) {
      beneficiaryDetailResponse = res.data;
      notifyListeners();
    } else {
      snackbarService.error(message: res.message ?? "Something went wrong");
    }
  }
}
