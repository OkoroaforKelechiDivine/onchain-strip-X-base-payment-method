import 'dart:developer';

import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:pay_me_mobile/core/states/app_state.dart';
import 'package:pay_me_mobile/data/datasources/remote/authentication_data_provider.dart';
import 'package:pay_me_mobile/data/datasources/remote/base/api_response.dart';
import 'package:pay_me_mobile/data/model/params/login_param.dart';
import 'package:pay_me_mobile/data/model/params/save_beneficiary_param.dart';
import 'package:pay_me_mobile/data/model/params/signup_param.dart';
import 'package:pay_me_mobile/data/model/response/auth/beneficiary.dart';
import 'package:pay_me_mobile/data/model/user_model.dart';

import '../../core/cores.dart';
import '../model/response/auth/login_response.dart';
import '../model/response/auth/passcode_response.dart';

class AuthRepo {
  final _authApi = AuthenticationDataProvider();

  Future<ApiResponse<LoginResponse?>> login({required LoginParam param}) async {
    final res = await _authApi.loginAPI(param: param);
    if (res.success) {
      authLocalStorage.saveToken(res.data?.token);
      appLocalStorage.saveAppState(AppState.authenticated);
      Map<String, dynamic> decodedToken = JwtDecoder.decode(res.data!.token!);
      final user = User.fromJson(decodedToken);
      log(decodedToken.toString());
      log(user.business!);
      appLocalStorage.saveUser(user);
      appGlobals.user = user;
      appGlobals.token = res.data?.token;
    }
    return res;
  }

  Future<ApiResponse> register({required SignUpParam param}) {
    return _authApi.register(param: param);
  }

  Future<ApiResponse<List<BankBeneficiaryListRes>?>>
      getBeneficiaryList() async {
    return _authApi.getBeneficiaryList();
  }

  Future<ApiResponse<String>> deleteBeneficiary({
    required String accountNumber,
    required String bankName,
  }) async {
    return _authApi.deleteBeneficiary(
        accountNumber: accountNumber, bankName: bankName);
  }

  Future<ApiResponse<String>> saveBeneficiary({
    required SaveBeneficiaryParam beneficiary,
  }) async {
    return _authApi.saveBeneficiary(beneficiary: beneficiary);
  }

  Future<ApiResponse<String>> setPascode({
    required String code,
  }) async {
    return _authApi.setPascode(code: code);
  }

  Future<ApiResponse<bool>> validatePascode({
    required String code,
  }) {
    return _authApi.validatePascode(
      code: code,
    );
  }

  Future<ApiResponse<bool>> validatePin(String pin) {
    return _authApi.validatePin(code: pin);
  }

  Future<ApiResponse<String>> setNotificationToken({
    required String code,
  }) async {
    return _authApi.setNotificationToken(code: code);
  }

  Future<ApiResponse<String>> resetPassword({
    required String oldPassword,
    required String newPassword,
  }) async {
    return _authApi.resetPassword(
      oldPassword: oldPassword,
      newPassword: newPassword,
    );
  }

  Future<ApiResponse<String>> updatePasscode({
    required String oldPassword,
    required String newPassword,
  }) async {
    return _authApi.updatePasscode(
      oldPassword: oldPassword,
      newPassword: newPassword,
    );
  }

  Future<ApiResponse<String>> updatePin({
    required String oldPassword,
    required String newPassword,
  }) async {
    return _authApi.updatePin(
      oldPassword: oldPassword,
      newPassword: newPassword,
    );
  }

  Future<ApiResponse<String>> setTransactionPin({
    required String code,
  }) async {
    return _authApi.setTransactionPin(code: code);
  }

  Future<ApiResponse<String>> sendResetPassordEmail({
    required String username,
  }) async {
    return _authApi.sendResetPassordEmail(username: username);
  }

  Future<ApiResponse<String>> updatePassword({
    required String username,
    required int token,
    required String password,
  }) async {
    return _authApi.updatePassword(
        username: username, token: token, password: password);
  }

  Future<ApiResponse<bool>> checkUsername({
    required String username,
  }) async {
    return _authApi.checkUsername(username: username);
  }
}
