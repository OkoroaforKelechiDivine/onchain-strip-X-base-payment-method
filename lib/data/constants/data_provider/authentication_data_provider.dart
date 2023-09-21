import 'dart:async';
import 'dart:convert';

import '../../model/auth/login_response.dart';
import '../../network_manager/network_manager.dart';
import '../api_routes.dart';
import '../enum/request_type.dart';

class AuthenticationDataProvider {
  NetworkManager networkManager = NetworkManager();

  Future<LoginResponse> login(Map<String, dynamic> loginDetails) async {
    var completer = Completer<LoginResponse>();
    try {
      Map<String, dynamic>? response = await networkManager.networkRequestManager(
        RequestType.POST,
        ApiRoutes.login,
        body: json.encode(loginDetails),
        useAuth: false,
        retrieveResponse: false,
        retrieveUnauthorizedResponse: false,
      );
      if (response != null) {
        var result = LoginResponse.fromJson(response);
        completer.complete(result);
      } else {
        completer.completeError("Network error or no response received.");
      }
    } catch (e) {
      completer.completeError(e);
    }
    return completer.future;
  }

  Future<EnterPasscodeResponse> enterPasscode(Map<String, dynamic> passcodeDetails) async {
    var completer = Completer<EnterPasscodeResponse>();
    try {
      Map<String, dynamic>? response = await networkManager.networkRequestManager(
        RequestType.POST,
        ApiRoutes.enterPasscode,
        body: json.encode(passcodeDetails),
        useAuth: true,
        retrieveResponse: true,
        retrieveUnauthorizedResponse: false,
      );
      if (response != null) {
        var result = EnterPasscodeResponse.fromJson(response);
        completer.complete(result);
      } else {
        completer.completeError("Network error or no response received.");
      }
    } catch (e) {
      completer.completeError(e);
    }
    return completer.future;
  }

}
