import 'dart:developer';

import 'package:pay_me_mobile/core/di/locator.dart';
import 'package:pay_me_mobile/data/datasources/remote/bank_api.dart';
import 'package:pay_me_mobile/data/datasources/remote/base/api_response.dart';
import 'package:pay_me_mobile/data/model/params/buy_power_param.dart';
import 'package:pay_me_mobile/data/model/params/tv_param.dart';
import 'package:pay_me_mobile/data/model/params/verify_meter_paam.dart';
import 'package:pay_me_mobile/data/model/response/power/buy_power_response.dart';
import 'package:pay_me_mobile/data/model/response/power/verify_meter_response.dart';
import 'package:pay_me_mobile/data/model/response/transaction_response/bank_response.dart';
import 'package:pay_me_mobile/data/model/response/transaction_response/bank_transfer_response.dart';
import 'package:pay_me_mobile/data/model/response/transaction_response/beneficiary_detail_response.dart';
import 'package:pay_me_mobile/data/model/response/transaction_response/buy_airtime_response.dart';
import 'package:pay_me_mobile/data/model/response/transaction_response/sender_detail_response.dart';
import 'package:pay_me_mobile/data/model/response/tv_cable/buy_tv_cable_response.dart';
import 'package:pay_me_mobile/data/model/response/tv_cable/tv_cable_package_response.dart';
import 'package:pay_me_mobile/data/model/response/tv_cable/verify_smart_card_response.dart';

import '../model/params/bank_transfer_param.dart';

class BankRepo {
  final _bankApi = BankApi();

  Future<ApiResponse<List<BankResponse>?>> getBankList() async {
    final res = await _bankApi.getBankList();
    if (res.success) {
      appLocalStorage.saveBanks(res.data!);
      appGlobals.banks = res.data;
      log(appGlobals.banks.toString());
    }
    return res;
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

  Future<ApiResponse<BuyAirtimeResponse>> buyAirtime(
      {required int amount,
      required String network,
      required String number}) async {
    return await _bankApi.buyAirtime(
        amount: amount, network: network, number: number);
  }

  ///Buy Power
  Future<ApiResponse<BuyPowerResponse>> buyPower(
      {required BuyPowerParam param}) async {
    return await _bankApi.buyPower(param: param);
  }

  ///Verify Meter Number
  Future<ApiResponse<VerifyMeterResponse>> verifyMeterNumber(
      {required VerifyMeterParam param}) async {
    return await _bankApi.verifyMeterNumber(param: param);
  }

  Future<ApiResponse<List<TvCablePackageResponse>?>> getTvCablePackages(
      {required String service}) async {
    return await _bankApi.getTvCablePackages(service: service);
  }

  Future<ApiResponse<VerifySmartCardResponse>> verifySmarcardNumber({
    required int billersCode,
    required String serviceID,
  }) async {
    return await _bankApi.verifySmarcardNumber(
        billersCode: billersCode, serviceID: serviceID);
  }

  Future<ApiResponse<TvCableResponse>> buyTvCable(
      {required TvCableParam param}) async {
    return await _bankApi.buyTvCable(param: param);
  }
}
