import 'package:pay_me_mobile/data/constants/enum/view_state.dart';

import '../../../locator.dart';
import '../../constants/data_provider/authentication_data_provider.dart';
import '../../states/auth/login_state.dart';
import '../../utilities/secure_storage/secure_storage_utils.dart';

class LoginViewModel extends LoginState {
  ///data provider
  final AuthenticationDataProvider _authDataProvider = locator<AuthenticationDataProvider>();
  /// message
  String? _message;
  String? get message => _message;

  ///password visibility flag
  bool _hidePassword = true;
  bool get hidePassword => _hidePassword;
  set hidePassword(bool val) {
    _hidePassword = val;
    notifyListeners();
  }

  ///enable button flag
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

  ///login
  login(
  {String? username,
  String? password,}) async {
  setState(ViewState.Busy);
  final data = {
    "username": username,
    "password": password,
  };
  await _authDataProvider.login(data).then((response) {
    setState(ViewState.Retrieved);
    ///save user token to secure storage
    SecureStorageUtils.saveToken(token: response.token ?? "null");
  });
  }
}