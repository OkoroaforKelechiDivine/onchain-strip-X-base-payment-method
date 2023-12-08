import 'package:pay_me_mobile/data/datasources/remote/base/api_failure.dart';
import 'package:pay_me_mobile/data/datasources/remote/base/api_response.dart';
import 'package:pay_me_mobile/data/datasources/remote/base/api_service.dart';
import 'package:pay_me_mobile/data/model/response/transaction_response/inflow_response.dart';
import 'package:pay_me_mobile/data/model/response/transaction_response/transaction_response.dart';

class TransactionApi {
  final _apiService = ApiService(path: '/transaction');

  Future<ApiResponse<List<TransactionResponse>?>> getTransactionList() async {
    try {
      final res = await _apiService.get(
        "/fetch_all",
      );
      return ApiResponse.fromJson(res)
        ..data = (res['transactions'] as List)
            .map((e) => TransactionResponse.fromJson(e))
            .toList();
    } on ApiFailure catch (e) {
      return ApiResponse(success: false, message: e.message);
    }
  }

  Future<ApiResponse<List<InflowResponse>>> getInflowList() async {
    try {
      final res = await _apiService.get(
        "/inflow",
      );
      return ApiResponse.fromJson(res)
        ..data = (res['inflow'] as List)
            .map((e) => InflowResponse.fromJson(e))
            .toList();
    } on ApiFailure catch (e) {
      return ApiResponse(success: false, message: e.message);
    }
  }
}
