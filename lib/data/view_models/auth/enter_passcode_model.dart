import 'package:flutter/cupertino.dart';
import 'package:pay_me_mobile/data/states/auth/enter_passcode_state.dart';
import '../../../src/locator.dart';
import '../../constants/enum/view_state.dart';
import '../../data_provider/authentication_data_provider.dart';
import '../../utilities/secure_storage/secure_storage_utils.dart';

class EnterPasscodeModel extends EnterPasscodeState {
  final AuthenticationDataProvider _authDataProvider = locator<AuthenticationDataProvider>();
  String? _message;

  String? get message => _message;

  enterPasscode(BuildContext context, {String? passcode}) async {
    setState(ViewState.Busy);
    final data = {
      "passcode": passcode,
    };
    try {
      final response = await _authDataProvider.enterPasscode(context, data);
      SecureStorageUtils.saveToken(token: response.token ?? "null");
      setState(ViewState.Retrieved);
    } catch (e) {
      _message = "Incorrect passcode, please try again";
      setState(ViewState.Error);
    }
  }
}
