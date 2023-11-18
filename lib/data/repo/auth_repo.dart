import 'package:pay_me_mobile/core/states/app_state.dart';
import 'package:pay_me_mobile/data/datasources/remote/authentication_data_provider.dart';
import 'package:pay_me_mobile/data/datasources/remote/base/api_response.dart';

import '../../core/cores.dart';
import '../model/response/auth/login_response.dart';

class AuthRepo {
  final _authApi = AuthenticationDataProvider();

  Future<ApiResponse<LoginResponse?>> login(
      {required String email, required String password}) async {
    final res = await _authApi.loginAPI(email: email, password: password);
    if (res.success) {
      authLocalStorage.saveToken(res.data?.token);
      appLocalStorage.saveAppState(AppState.authenticated);
      appLocalStorage.saveUser(res.data?.user);
      appGlobals.user = res.data?.user;
      appGlobals.token = res.data?.token;
    }
    return res;
  }
}