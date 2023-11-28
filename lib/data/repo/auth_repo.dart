import 'dart:developer';

import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:pay_me_mobile/core/states/app_state.dart';
import 'package:pay_me_mobile/data/datasources/remote/authentication_data_provider.dart';
import 'package:pay_me_mobile/data/datasources/remote/base/api_response.dart';
import 'package:pay_me_mobile/data/model/params/signup_param.dart';
import 'package:pay_me_mobile/data/model/user_model.dart';

import '../../core/cores.dart';
import '../model/response/auth/login_response.dart';
import '../model/response/auth/passcode_response.dart';

class AuthRepo {
  final _authApi = AuthenticationDataProvider();

  Future<ApiResponse<LoginResponse?>> login(
      {required String username, required String password}) async {
    final res = await _authApi.loginAPI(username: username, password: password);
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

  Future<ApiResponse<PasscodeResponse>> validatePascode(
      {required String code, required bool isFirstLogin}) {
    return _authApi.validatePascode(code: code, isFirstLogin: isFirstLogin);
  }
}
