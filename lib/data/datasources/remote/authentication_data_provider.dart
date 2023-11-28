import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:pay_me_mobile/data/datasources/remote/base/api_failure.dart';
import 'package:pay_me_mobile/data/datasources/remote/base/api_response.dart';
import 'package:pay_me_mobile/data/datasources/remote/base/api_service.dart';
import 'package:pay_me_mobile/data/model/params/signup_param.dart';
import 'package:pay_me_mobile/data/model/response/auth/passcode_response.dart';

import '../../../core/constants/api_routes.dart';
import '../../../core/constants/enum/request_type.dart';
import '../../model/response/auth/app_response.dart';
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

  Future<ApiResponse<PasscodeResponse>> validatePascode(
      {required String code, required bool isFirstLogin}) async {
    try {
      final res = await _apiService.post(
          isFirstLogin ? "/set_passcode" : '/validate_passcode',
          data: {"passcode": code});
      return ApiResponse.fromJson(res)
        ..success = true
        ..message = "Success"
        ..data = PasscodeResponse.fromJson(res);
    } on ApiFailure catch (e) {
      return ApiResponse(success: false, message: e.message);
    }
  }
}
