import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';

import '../../core/constants/api_routes.dart';
import '../../core/constants/enum/request_type.dart';
import '../model/auth/app_response.dart';
import '../network_manager/network_manager.dart';

class AuthenticationDataProvider {
  NetworkManager networkManager = NetworkManager();

  Future<AppResponse> login(Map<String, dynamic> loginDetails) async {
    var completer = Completer<AppResponse>();
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
        var result = AppResponse.fromJson(response);
        completer.complete(result);
      } else {
        completer.completeError("Network error or no response received.");
      }
    } catch (e) {
      completer.completeError(e);
    }
    return completer.future;
  }

  Future<AppResponse> enterPasscode(BuildContext context, Map<String, dynamic> passcodeDetails) async {
    var completer = Completer<AppResponse>();
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
        if (response['message'] == true) {
          //TODO: Navigate to home page
            //navigateToHome(context);
        }
        else {
          print('Incorrect passcode. Please try again.');
        }

        var result = AppResponse.fromJson(response);
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
