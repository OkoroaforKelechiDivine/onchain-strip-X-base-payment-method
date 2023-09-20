import 'dart:async';
import 'dart:convert';

import '../../model/auth/login_response.dart';
import '../../network_manager/network_manager.dart';
import '../api_routes.dart';
import '../enum/request_type.dart';

class AuthenticationDataProvider {
  NetworkManager networkManager =  NetworkManager();

  ///Send phone Otp
  ///Verify phone otp
  ///login
  ///change password
  Future<LoginResponse> login(Map<String, dynamic> loginDetails) async {
    var completer = Completer<LoginResponse>();
    try {
      Map<String, dynamic>? response = await networkManager
          .networkRequestManager(RequestType.POST, ApiRoutes.login,
          body: json.encode(loginDetails),
          useAuth: false,
          retrieveResponse: false,
          retrieveUnauthorizedResponse: false);
      print(response);
      var result = LoginResponse.fromJson(response ?? {"message": null});
      completer.complete(result);
    } catch (e) {
      completer.completeError(e);
    }
    return completer.future;
  }
}