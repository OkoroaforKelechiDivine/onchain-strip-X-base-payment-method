import 'package:pay_me_mobile/data/datasources/remote/base/api_response.dart';
import 'package:pay_me_mobile/data/datasources/remote/transaction_api.dart';
import 'package:pay_me_mobile/data/model/response/transaction_response/inflow_response.dart';
import 'package:pay_me_mobile/data/model/response/transaction_response/transaction_count_res.dart';
import 'package:pay_me_mobile/data/model/response/transaction_response/transaction_response.dart';

class TransactionRepo {
  final _transactionApi = TransactionApi();

  Future<ApiResponse<List<TransactionResponse>?>> getTransactionList() async {
    return await _transactionApi.getTransactionList();
  }

  Future<ApiResponse<List<InflowResponse>>> getInflowList() async {
    return await _transactionApi.getInflowList();
  }

  Future<ApiResponse<TransactionCountResponse>> getTransactionCount(
      String businessID) async {
    return await _transactionApi.getTransactionCount(businessID);
  }
}
