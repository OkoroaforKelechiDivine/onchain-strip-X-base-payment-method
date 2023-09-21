import 'package:flutter/cupertino.dart';
import '../../../locator.dart';
import '../../constants/enum/view_state.dart';
import '../../data_provider/authentication_data_provider.dart';
import '../../utilities/secure_storage/secure_storage_utils.dart';

class EnterPasscodeModel {
  final AuthenticationDataProvider _authDataProvider = locator<AuthenticationDataProvider>();
  String? _message;
  ViewState _viewState = ViewState.Idle;

  ViewState get viewState => _viewState;
  String? get message => _message;

  void setState(ViewState newState) {
    _viewState = newState;
  }

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
