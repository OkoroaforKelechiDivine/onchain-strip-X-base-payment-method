import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:pay_me_mobile/core/di/locator.dart';
import 'package:pay_me_mobile/core/utilities/string_util.dart';
import 'package:pay_me_mobile/data/model/params/bank_transfer_param.dart';
import 'package:pay_me_mobile/data/model/response/transaction_response/bank_response.dart';
import 'package:pay_me_mobile/data/model/response/transaction_response/beneficiary_detail_response.dart';
import 'package:pay_me_mobile/data/model/response/transaction_response/sender_detail_response.dart';
import 'package:pay_me_mobile/src/views/screens/bottom_nav.dart';
import 'package:pay_me_mobile/src/views/screens/transaction_pin/transaction_pin_view.dart';
import 'package:pay_me_mobile/src/views/screens/transactions/transfer/transfer_success_screen.dart';
import 'package:stacked/stacked.dart';

class SendMoneyViewModel extends BaseViewModel {
  final TextEditingController amountController = TextEditingController();
  final TextEditingController narrationController = TextEditingController();

  bool isSendingMoney = false;
  bool isLoadingWalletBalance = false;
  String walletBalance = "0.0";

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

  Future<void> sendMoney(
      {required BankResponse selectedbank,
      required BeneficiaryDetailResponse beneficiary}) async {
    isSendingMoney = true;
    notifyListeners();
    if (amountController.text.isEmpty || narrationController.text.isEmpty) {
      snackbarService.error(message: "Inputs cannot be empty");
      isSendingMoney = false;
      notifyListeners();
      return;
    } else {
      isSendingMoney = true;
      notifyListeners();
      log(amountController.text);
      final senderDetails = SenderDetailsResponse();
      final res = await bankRepo.bankTransfer(
          param: BankTransferParam(
        amount: decomposeAmount(
            amountController.text), //amountController.text.trim(),
        remark: narrationController.text.trim(),
        fromAccount: senderDetails.accountNo,
        // fromBvn: "",
        fromClient: senderDetails.client,
        fromClientId: senderDetails.clientId,
        fromSavingsId: senderDetails.accountId,
        toAccount: beneficiary.account.number,
        toBank: selectedbank.code,
        //toBvn: "",
        toClient: beneficiary.name,
        toClientId: beneficiary.clientId,
        toKyc: beneficiary.status,
        toSavingsId: beneficiary.account.id,
        toSession: beneficiary.account.id,
        transferType: selectedbank.code == "999999" ? "Intra" : "inter",
      ));
      if (res.success) {
        snackbarService.success(message: "Success Transfer");
        isSendingMoney = false;
        notifyListeners();
        updateBeneficiaries(beneficiary);
        navigationService.pushAndRemoveUntil(TransferSuccessPage(
          message: amountController.text,
        ));
      } else {
        snackbarService.error(message: res.message ?? "Something went wrong");
        isSendingMoney = false;
        notifyListeners();
      }
    }
    notifyListeners();
  }

  Future<bool> confirmPin(String pin) async {
    final res = await authRepo.validatePin(pin);
    if (res.success) {
      if (res.data!) {
        return true;
      } else {
        snackbarService.error(message: "Invalid pin");
        return false;
      }
    } else {
      snackbarService.error(message: res.message!);
      return false;
    }
  }

  // Update beneficiaries
  void updateBeneficiaries(BeneficiaryDetailResponse newBeneficiary) {
    var currentBeneficiaries = appGlobals.beneficiaries ?? [];
    currentBeneficiaries.add(newBeneficiary);
    appGlobals.beneficiaries = currentBeneficiaries;
    appLocalStorage.saveBeneficiaries(currentBeneficiaries);
    notifyListeners();
  }

  Future<void> processTransfer(
      {required BankResponse selectedbank,
      required BeneficiaryDetailResponse beneficiary}) async {
    if (amountController.text.isEmpty || narrationController.text.isEmpty) {
      snackbarService.error(message: "Inputs cannot be empty");
    } else {
      bottomSheetService.show(
        TransactionPinView(
          onPinComplete: (val) async {
            navigationService.pop();
            isSendingMoney = true;
            notifyListeners();
            final res = await confirmPin(val!);
            if (res) {
              await sendMoney(
                  beneficiary: beneficiary, selectedbank: selectedbank);
            }
            isSendingMoney = false;
            notifyListeners();
          },
        ),
      );
    }
  }
}
