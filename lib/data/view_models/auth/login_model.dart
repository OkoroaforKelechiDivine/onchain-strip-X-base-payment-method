import 'package:pay_me_mobile/core/constants/enum/view_state.dart';
import 'package:pay_me_mobile/data/model/response/auth/login_response.dart';

import '../../../core/di/locator.dart';
import '../../datasources/remote/authentication_data_provider.dart';
import '../../states/auth/login_state.dart';
import '../../utilities/secure_storage/secure_storage_utils.dart';

class LoginViewModel extends LoginState {
  final AuthenticationDataProvider _authDataProvider = locator<AuthenticationDataProvider>();
  String? _message;
  String? get message => _message;

  bool _hidePassword = true;
  bool get hidePassword => _hidePassword;
  set hidePassword(bool val) {
    _hidePassword = val;
    notifyListeners();
  }

  bool _enableButton = false;
  bool get enableButton => _enableButton;
  set enableButton(bool val) {
    _enableButton = val;
    notifyListeners();
  }
  String? _phone;
  String? get phone => _phone;

  String? _pwd;
  String? get pwd => _pwd;


//Login Implementation
  void appLogin({required String username, required String password}) async {
    final res = await authRepo.login(email: username, password: password);
    if(res.success){
      LoginResponse(
        token: res.data?.token,
        user: res.data?.user,
      );
    }else{
      
    }
  }

  login({String? username, String? password}) async {
    setState(ViewState.Busy);
    final data = {
      "username": username,
      "password": password,
    };
    try {
      final response = await _authDataProvider.login(data);
      SecureStorageUtils.saveToken(token: response.token ?? "null");
      setState(ViewState.Retrieved);
    } catch (e) {
      _message = "Incorrect username or password";
      setState(ViewState.Error);
    }
  }

}