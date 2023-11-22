import 'package:pay_me_mobile/data/datasources/remote/bank_api.dart';
import 'package:pay_me_mobile/data/datasources/remote/base/api_failure.dart';
import 'package:pay_me_mobile/data/datasources/remote/base/api_response.dart';
import 'package:pay_me_mobile/data/model/response/transaction_response/bank_response.dart';
import 'package:pay_me_mobile/data/model/response/transaction_response/beneficiary_detail_response.dart';

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
}
