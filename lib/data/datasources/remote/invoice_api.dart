import 'package:pay_me_mobile/data/datasources/remote/base/api_failure.dart';
import 'package:pay_me_mobile/data/datasources/remote/base/api_response.dart';
import 'package:pay_me_mobile/data/datasources/remote/base/api_service.dart';
import 'package:pay_me_mobile/data/model/params/create_customer_param.dart';
import 'package:pay_me_mobile/data/model/params/create_invoice_param.dart';
import 'package:pay_me_mobile/data/model/response/invoice/create_invoice_response.dart';
import 'package:pay_me_mobile/data/model/response/invoice/get_all_invoice_list_response.dart';
import 'package:pay_me_mobile/data/model/response/invoice/get_customer_res.dart';
import 'package:pay_me_mobile/data/model/response/invoice/single_customer_response.dart';
import 'package:pay_me_mobile/data/model/response/invoice/single_invoice_response.dart';

class InvoiceApi {
  final _apiService = ApiService(path: '/invoice');

  Future<ApiResponse<CreateCustomerResponse>> createCustomer(
      {required CreateCustomerParam param}) async {
    try {
      final res = await _apiService.post(
        "/customer/create",
        data: param.toJson(),
      );
      return ApiResponse.fromJson(res)
        ..success = true
        ..data = CreateCustomerResponse.fromJson(res);
    } on ApiFailure catch (e) {
      return ApiResponse(success: false, message: e.message);
    }
  }

  Future<ApiResponse<String>> createInvoice(
      {required CreateInvoiceParam param}) async {
    try {
      final res = await _apiService.post(
        "/create",
        data: param.toJson(),
      );
      return ApiResponse.fromJson(res)
        ..success = true
        ..data = res['message'];
    } on ApiFailure catch (e) {
      return ApiResponse(success: false, message: e.message);
    }
  }

  Future<ApiResponse<SingleInvoiceResponse>> getSingleInvoice(
      {required int id}) async {
    try {
      final res = await _apiService.get(
        "/fetch/$id",
      );
      return ApiResponse.fromJson(res)
        ..success = true
        ..data = SingleInvoiceResponse.fromJson(res);
    } on ApiFailure catch (e) {
      return ApiResponse(success: false, message: e.message);
    }
  }

  Future<ApiResponse<SingleCustomerResponse>> getSingleCustomer(
      {required int id}) async {
    try {
      final res = await _apiService.get(
        "/customer/fetch/$id",
      );
      return ApiResponse.fromJson(res)
        ..success = true
        ..data = SingleCustomerResponse.fromJson(res);
    } on ApiFailure catch (e) {
      return ApiResponse(success: false, message: e.message);
    }
  }

  Future<ApiResponse<List<GetInvoiceListRes>>> getAllInvoice() async {
    try {
      final res = await _apiService.get(
        "/fetch_all",
      );
      return ApiResponse.fromJson(res)
        ..success = true
        ..data = (res['invoices'] as List)
            .map((e) => GetInvoiceListRes.fromJson(e))
            .toList();
    } on ApiFailure catch (e) {
      return ApiResponse(success: false, message: e.message);
    }
  }

  Future<ApiResponse<List<GetCustomerRes>>> getAllCustomer() async {
    try {
      final res = await _apiService.get(
        "/customer/fetch",
      );
      return ApiResponse.fromJson(res)
        ..success = true
        ..data = (res['customers'] as List)
            .map((e) => GetCustomerRes.fromJson(e))
            .toList();
    } on ApiFailure catch (e) {
      return ApiResponse(success: false, message: e.message);
    }
  }
}
