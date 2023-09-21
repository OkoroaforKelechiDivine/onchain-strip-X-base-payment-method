import 'package:pay_me_mobile/data/states/auth/enter_passcode_state.dart';

import '../../../locator.dart';
import '../../constants/data_provider/authentication_data_provider.dart';
import '../../constants/enum/view_state.dart';
import '../../utilities/secure_storage/secure_storage_utils.dart';

class EnterPasscodeModel extends EnterPasscodeState{

  final AuthenticationDataProvider _authDataProvider = locator<AuthenticationDataProvider>();
  String? _message;
  String? get message => _message;

  enterPasscode({String? pin}) async {
    setState(ViewState.Busy);
    final data = {
      "pin": pin,
    };
    try {
      final response = await _authDataProvider.enterPasscode(data);
      SecureStorageUtils.saveToken(token: response.token ?? "null");
      setState(ViewState.Retrieved);
    } catch (e) {
      _message = "Incorrect username or password";
      setState(ViewState.Error);
    }
  }


}