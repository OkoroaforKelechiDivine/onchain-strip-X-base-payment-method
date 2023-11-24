import 'package:pay_me_mobile/data/datasources/remote/bank_api.dart';
import 'package:pay_me_mobile/data/datasources/remote/base/api_failure.dart';
import 'package:pay_me_mobile/data/datasources/remote/base/api_response.dart';
import 'package:pay_me_mobile/data/model/response/transaction_response/bank_response.dart';
import 'package:pay_me_mobile/data/model/response/transaction_response/bank_transfer_response.dart';
import 'package:pay_me_mobile/data/model/response/transaction_response/beneficiary_detail_response.dart';
import 'package:pay_me_mobile/data/model/response/transaction_response/sender_detail_response.dart';

import '../model/params/bank_transfer_param.dart';

class BankRepo {
  final _bankApi = BankApi();

  Future<ApiResponse<List<BankResponse>?>> getBankList() async {
    return await _bankApi.getBankList();
  }

  Future<ApiResponse<BeneficiaryDetailResponse>> getBeneficiaryAccountDetails(
      {required BankResponse bank, required String accountNumber}) async {
    return await _bankApi.getBeneficiaryAccountDetails(
        accountNumber: accountNumber, bank: bank);
  }

  //Transfer
  Future<ApiResponse<BankTransferResponse>> bankTransfer(
      {required BankTransferParam param}) async {
    return await _bankApi.bankTransfer(param: param);
  }

  //Get Sender Details
  Future<ApiResponse<SenderDetailsResponse>> getSenderDetails(
      String accountNumber) async {
    return await _bankApi.getSenderBankDetails(accountNumber: accountNumber);
  }
}
