import 'package:flutter/material.dart';
import 'package:pay_me_mobile/data/model/params/bank_transfer_param.dart';
import 'package:pay_me_mobile/data/model/response/transaction_response/bank_response.dart';
import 'package:pay_me_mobile/data/model/response/transaction_response/beneficiary_detail_response.dart';
import 'package:pay_me_mobile/data/model/response/transaction_response/sender_detail_response.dart';
import 'package:pay_me_mobile/presentation/auth/transaction_pin/transaction_pin_view.dart';
import 'package:pay_me_mobile/presentation/transfer/completed_transaction/failed_transaction.dart';
import 'package:pay_me_mobile/presentation/transfer/completed_transaction/successful_transaction_view.dart';
import 'package:stacked/stacked.dart';

import '../../../core/cores.dart';

class ProceedWithTransferVM extends BaseViewModel {
  TextEditingController amount = TextEditingController();
  TextEditingController description = TextEditingController();
  bool toggleSendMoney = false;
  bool isSendingMoney = false;
  bool isLoadingWalletBalance = false;
  String walletBalance = "0.0";
  void setSendMoney() {
    toggleSendMoney = !toggleSendMoney;
    notifyListeners();
  }

  Future<void> processTransfer(
      {required BankResponse selectedbank,
      required BeneficiaryDetailResponse beneficiary}) async {
    isSendingMoney = true;
    notifyListeners();
    if (amount.text.isEmpty || description.text.isEmpty) {
      snackbarService.error(message: "Inputs cannot be empty");
      isSendingMoney = false;
      notifyListeners();
      return;
    } else {
      isSendingMoney = true;
      notifyListeners();

      final senderDetails = SenderDetailsResponse();
      final res = await bankRepo.bankTransfer(
          param: BankTransferParam(
        amount:
            (double.tryParse(amount.text.replaceAll(',', '')) ?? 0).toString(),
        remark: description.text.trim(),
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
        //snackbarService.success(message: "Success Transfer");
        isSendingMoney = false;
        notifyListeners();
        navigationService.push(const SuccessfulTransaction());
        // updateBeneficiaries(beneficiary);
        // navigationService.pushAndRemoveUntil(TransferSuccessPage(
        //   message: amountController.text,
        //   beneficiary: SaveBeneficiaryParam(
        //     fullname: beneficiary.name,
        //     bank: selectedbank.name,
        //     bankCode: selectedbank.code,
        //     accountNumber: beneficiary.account.number,
        //     userId: appGlobals.user!.sub!,
        //   ),
        // ));
      } else {
        // snackbarService.error(message: res.message ?? "Something went wrong");
        isSendingMoney = false;
        notifyListeners();
        navigationService.push(const FailedTransactionView());
      }
    }
    notifyListeners();
  }

  void transferMoney(
      {required BankResponse selectedbank,
      required BeneficiaryDetailResponse beneficiary}) async {
    bottomSheetService.show(
      TransactionPinView(
        title: "Send ${amount.text} to ${beneficiary.name}",
        onPinComplete: (val) async {
          navigationService.pop();
          isSendingMoney = true;
          notifyListeners();
          if (val) {
            await processTransfer(
                beneficiary: beneficiary, selectedbank: selectedbank);
          }
          isSendingMoney = false;
          notifyListeners();
        },
      ),
    );
  }
}
