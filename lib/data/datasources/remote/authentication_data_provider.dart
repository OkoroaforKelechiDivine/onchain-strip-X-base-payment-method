import 'dart:async';
import 'dart:developer';

import 'package:pay_me_mobile/core/di/locator.dart';
import 'package:pay_me_mobile/data/datasources/remote/base/api_failure.dart';
import 'package:pay_me_mobile/data/datasources/remote/base/api_response.dart';
import 'package:pay_me_mobile/data/datasources/remote/base/api_service.dart';
import 'package:pay_me_mobile/data/model/params/login_param.dart';
import 'package:pay_me_mobile/data/model/params/save_beneficiary_param.dart';
import 'package:pay_me_mobile/data/model/params/signup_param.dart';
import 'package:pay_me_mobile/data/model/response/auth/beneficiary.dart';
import 'package:pay_me_mobile/data/model/response/auth/passcode_response.dart';

import '../../model/response/auth/login_response.dart';

class AuthenticationDataProvider {
  final _apiService = ApiService(path: '/user/v2');

  Future<ApiResponse<LoginResponse?>> loginAPI(
      {required LoginParam param}) async {
    try {
      final res = await _apiService.post('/login', data: param.toJson());
      return ApiResponse.fromJson(res)
        ..success = true
        ..message = "Success"
        ..data = LoginResponse.fromJson(res);
    } on ApiFailure catch (e) {
      return ApiResponse(success: false, message: e.message);
    }
  }

  Future<ApiResponse> register({required SignUpParam param}) async {
    try {
      final res = await _apiService.post('/register', data: param.toJson());
      return ApiResponse.fromJson(res);
    } on ApiFailure catch (e) {
      return ApiResponse(success: false, message: e.message);
    }
  }

  Future<ApiResponse<List<BankBeneficiaryListRes>?>>
      getBeneficiaryList() async {
    try {
      final res =
          await _apiService.get('/get_beneficiaries/${appGlobals.user?.sub}');
      return ApiResponse.fromJson(res)
        ..data = (res['message'] as List)
            .map((e) => BankBeneficiaryListRes.fromJson(e))
            .toList();
    } on ApiFailure catch (e) {
      return ApiResponse(success: false, message: e.message);
    }
  }

  Future<ApiResponse<bool>> validatePascode({
    required String code,
  }) async {
    try {
      final firstLogin = appGlobals.user?.isFirstLogin ?? false;
      log(firstLogin.toString());
      final res = await _apiService
          .post("/validate_login_pin", data: {"login_pin": code});
      return ApiResponse.fromJson(res)
        ..success = true
        ..message = "Success"
        ..data = res["meta"]["message"] == "true" ? true : false;
    } on ApiFailure catch (e) {
      return ApiResponse(success: false, message: e.message);
    }
  }

  Future<ApiResponse<String>> saveBeneficiary({
    required SaveBeneficiaryParam beneficiary,
  }) async {
    try {
      final res = await _apiService.post(
        "/save_beneficiary",
        data: beneficiary.toJson(),
      );
      return ApiResponse.fromJson(res)
        ..success = true
        ..message = "Success"
        ..data = res["message"];
    } on ApiFailure catch (e) {
      return ApiResponse(success: false, message: e.message);
    }
  }

  Future<ApiResponse<String>> setPascode({
    required String code,
  }) async {
    try {
      final res =
          await _apiService.post("/set_passcode", data: {"passcode": code});
      return ApiResponse.fromJson(res)
        ..success = true
        ..message = "Success"
        ..data = res["message"];
    } on ApiFailure catch (e) {
      return ApiResponse(success: false, message: e.message);
    }
  }

  Future<ApiResponse<String>> deleteBeneficiary(
      {required String accountNumber, required String bankName}) async {
    try {
      final res = await _apiService.delete("/delete_beneficiary", queryParams: {
        "accountNumber": accountNumber,
        "bank": bankName,
      });
      return ApiResponse.fromJson(res)
        ..success = true
        ..message = "Success"
        ..data = res["message"];
    } on ApiFailure catch (e) {
      return ApiResponse(success: false, message: e.message);
    }
  }

  Future<ApiResponse<String>> setNotificationToken({
    required String code,
  }) async {
    try {
      final res =
          await _apiService.post("/add_device_id", data: {"deviceID": code});
      return ApiResponse.fromJson(res)
        ..success = true
        ..message = "Success"
        ..data = res["message"];
    } on ApiFailure catch (e) {
      return ApiResponse(success: false, message: e.message);
    }
  }

  Future<ApiResponse<String>> sendResetPassordEmail({
    required String username,
  }) async {
    try {
      final res = await _apiService
          .post("/forgot_password", data: {"username": username});
      return ApiResponse.fromJson(res)
        ..success = true
        ..message = "Success"
        ..data = res["message"];
    } on ApiFailure catch (e) {
      return ApiResponse(success: false, message: e.message);
    }
  }

  Future<ApiResponse<String>> updatePassword({
    required String username,
    required int token,
    required String password,
  }) async {
    try {
      final res = await _apiService.put("/update_password",
          data: {"username": username, "token": token, "password": password});
      return ApiResponse.fromJson(res)
        ..success = true
        ..message = "Success"
        ..data = res["message"];
    } on ApiFailure catch (e) {
      return ApiResponse(success: false, message: e.message);
    }
  }

  Future<ApiResponse<bool>> validatePin({
    required String code,
  }) async {
    try {
      final res = await _apiService
          .post("/validate_transaction_pin", data: {"pin": code});
      return ApiResponse.fromJson(res)
        ..success = true
        ..message = "Success"
        ..data = res["meta"]["message"] == "true" ? true : false;
    } on ApiFailure catch (e) {
      return ApiResponse(success: false, message: e.message);
    }
  }

  Future<ApiResponse<String>> resetPassword({
    required String oldPassword,
    required String newPassword,
  }) async {
    try {
      final res = await _apiService.post(
        "/reset_password",
        data: {
          "old_password": oldPassword,
          "new_password": newPassword,
        },
      );
      return ApiResponse.fromJson(res)
        ..success = true
        ..message = "Success"
        ..data = res["message"];
    } on ApiFailure catch (e) {
      return ApiResponse(success: false, message: e.message);
    }
  }

  Future<ApiResponse<String>> updatePasscode({
    required String oldPassword,
    required String newPassword,
  }) async {
    try {
      final res = await _apiService.put(
        "/update_passcode",
        data: {
          "oldPasscode": oldPassword,
          "newPasscode": newPassword,
        },
      );
      return ApiResponse.fromJson(res)
        ..success = true
        ..message = "Success"
        ..data = res["message"];
    } on ApiFailure catch (e) {
      return ApiResponse(success: false, message: e.message);
    }
  }

  Future<ApiResponse<String>> updatePin({
    required String oldPassword,
    required String newPassword,
  }) async {
    try {
      final res = await _apiService.put(
        "/update_pin",
        data: {
          "oldPin": oldPassword,
          "newPin": newPassword,
        },
      );
      return ApiResponse.fromJson(res)
        ..success = true
        ..message = "Success"
        ..data = res["message"];
    } on ApiFailure catch (e) {
      return ApiResponse(success: false, message: e.message);
    }
  }

  Future<ApiResponse<String>> setTransactionPin({
    required String code,
  }) async {
    try {
      final res =
          await _apiService.post("/set_transaction_pin", data: {"pin": code});
      return ApiResponse.fromJson(res)
        ..success = true
        ..message = "Success"
        ..data = res["message"];
    } on ApiFailure catch (e) {
      return ApiResponse(success: false, message: e.message);
    }
  }

  Future<ApiResponse<bool>> checkUsername({
    required String username,
  }) async {
    try {
      final res = await _apiService.get(
        "/check_username/$username",
      );
      return ApiResponse.fromJson(res)
        ..success = true
        ..message = "Success"
        ..data = res["message"];
    } on ApiFailure catch (e) {
      return ApiResponse(success: false, message: e.message);
    }
  }
}
