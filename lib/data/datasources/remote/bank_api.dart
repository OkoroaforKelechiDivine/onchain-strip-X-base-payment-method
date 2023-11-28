import 'package:pay_me_mobile/data/datasources/remote/base/api_failure.dart';
import 'package:pay_me_mobile/data/datasources/remote/base/api_response.dart';
import 'package:pay_me_mobile/data/datasources/remote/base/api_service.dart';
import 'package:pay_me_mobile/data/model/params/bank_transfer_param.dart';
import 'package:pay_me_mobile/data/model/params/buy_power_param.dart';
import 'package:pay_me_mobile/data/model/params/verify_meter_paam.dart';
import 'package:pay_me_mobile/data/model/response/power/buy_power_response.dart';
import 'package:pay_me_mobile/data/model/response/power/verify_meter_response.dart';
import 'package:pay_me_mobile/data/model/response/transaction_response/bank_response.dart';
import 'package:pay_me_mobile/data/model/response/transaction_response/bank_transfer_response.dart';
import 'package:pay_me_mobile/data/model/response/transaction_response/beneficiary_detail_response.dart';
import 'package:pay_me_mobile/data/model/response/transaction_response/buy_airtime_response.dart';
import 'package:pay_me_mobile/data/model/response/transaction_response/sender_detail_response.dart';

class BankApi {
  final _apiService = ApiService(path: '/api');

  Future<ApiResponse<List<BankResponse>?>> getBankList() async {
    try {
      final res = await _apiService.get(
        "/get_all_banks",
      );
      return ApiResponse.fromJson(res)
        ..data = (res['data']["bank"] as List)
            .map((e) => BankResponse.fromJson(e))
            .toList();
    } on ApiFailure catch (e) {
      return ApiResponse(success: false, message: e.message);
    }
  }

  Future<ApiResponse<BeneficiaryDetailResponse>> getBeneficiaryAccountDetails(
      {required BankResponse bank, required String accountNumber}) async {
    try {
      final res = await _apiService.get(
        "/get_beneficiary_account",
        queryParams: {
          "bank": bank.code,
          "accountNo": accountNumber,
          "transfer_type": bank.code == "999999" ? "intra" : "inter"
        },
      );
      return ApiResponse.fromJson(res)
        ..data = BeneficiaryDetailResponse.fromJson(res['data']);
    } on ApiFailure catch (e) {
      return ApiResponse(success: false, message: e.message);
    }
  }

  //Bank Transfer
  Future<ApiResponse<BankTransferResponse>> bankTransfer(
      {required BankTransferParam param}) async {
    try {
      final res = await _apiService.post(
        "/transfer",
        data: param.toJson(),
      );
      return ApiResponse.fromJson(res)
        ..success = true
        ..message = "Success"
        ..data = BankTransferResponse.fromJson(res['data']);
    } on ApiFailure catch (e) {
      return ApiResponse(success: false, message: e.message);
    }
  }

  //Get Sender Bank Details
  Future<ApiResponse<SenderDetailsResponse>> getSenderBankDetails(
      {required String accountNumber}) async {
    try {
      final res = await _apiService.get(
        "/get_sender_account",
        queryParams: {
          "accountNumber": accountNumber,
        },
      );
      return ApiResponse.fromJson(res)
        ..success = true
        ..message = "Success"
        ..data = SenderDetailsResponse.fromJson(res['data']);
    } on ApiFailure catch (e) {
      return ApiResponse(success: false, message: e.message);
    }
  }

  //Buy Airtime
  Future<ApiResponse<BuyAirtimeResponse>> buyAirtime(
      {required int amount,
      required String network,
      required int number}) async {
    try {
      final res = await _apiService.post(
        "/buy_airtime",
        data: {"amount": amount, "serviceID": network, "phone": number},
      );
      return ApiResponse.fromJson(res)
        ..success = true
        ..message = "Success"
        ..data = BuyAirtimeResponse.fromJson(res);
    } on ApiFailure catch (e) {
      return ApiResponse(success: false, message: e.message);
    }
  }

  ///Buy Power

  Future<ApiResponse<BuyPowerResponse>> buyPower(
      {required BuyPowerParam param}) async {
    try {
      final res = await _apiService.post(
        "/buy_power",
        data: param.toJson(),
      );
      return ApiResponse.fromJson(res)
        ..success = true
        ..message = "Success"
        ..data = BuyPowerResponse.fromJson(res);
    } on ApiFailure catch (e) {
      return ApiResponse(success: false, message: e.message);
    }
  }

  ///Buy Power
  Future<ApiResponse<VerifyMeterResponse>> verifyMeterNumber(
      {required VerifyMeterParam param}) async {
    try {
      final res = await _apiService.post(
        "/verify_meter_number",
        data: param.toJson(),
      );
      return ApiResponse.fromJson(res)
        ..success = true
        ..message = "Success"
        ..data = VerifyMeterResponse.fromJson(res);
    } on ApiFailure catch (e) {
      return ApiResponse(success: false, message: e.message);
    }
  }
}
