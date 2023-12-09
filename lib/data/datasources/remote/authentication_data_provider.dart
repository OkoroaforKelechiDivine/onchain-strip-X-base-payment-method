import 'dart:async';
import 'dart:developer';

import 'package:pay_me_mobile/core/di/locator.dart';
import 'package:pay_me_mobile/data/datasources/remote/base/api_failure.dart';
import 'package:pay_me_mobile/data/datasources/remote/base/api_response.dart';
import 'package:pay_me_mobile/data/datasources/remote/base/api_service.dart';
import 'package:pay_me_mobile/data/model/params/signup_param.dart';
import 'package:pay_me_mobile/data/model/response/auth/passcode_response.dart';

import '../../model/response/auth/login_response.dart';

class AuthenticationDataProvider {
  final _apiService = ApiService(path: '/auth');

  Future<ApiResponse<LoginResponse?>> loginAPI(
      {required String username, required String password}) async {
    try {
      final res = await _apiService
          .post('/login', data: {'username': username, 'password': password});
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
      final res = await _apiService.post('/signup', data: param.toJson());
      return ApiResponse.fromJson(res);
    } on ApiFailure catch (e) {
      return ApiResponse(success: false, message: e.message);
    }
  }

  Future<ApiResponse<PasscodeResponse>> validatePascode({
    required String code,
  }) async {
    try {
      final firstLogin = appGlobals.user?.isFirstLogin ?? false;
      log(firstLogin.toString());
      final res = await _apiService.post(

          ///firstLogin ? "/set_passcode" : '/validate_passcode',
          "/validate_passcode",
          data: {"passcode": code});
      return ApiResponse.fromJson(res)
        ..success = true
        ..message = "Success"
        ..data = PasscodeResponse.fromJson(res);
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

  Future<ApiResponse<bool>> validatePin({
    required String code,
  }) async {
    try {
      final res = await _apiService.post("/validate_pin", data: {"pin": code});
      return ApiResponse.fromJson(res)
        ..success = true
        ..message = "Success"
        ..data = res["message"];
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
      final res = await _apiService.post(
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
      final res = await _apiService.post(
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
}
