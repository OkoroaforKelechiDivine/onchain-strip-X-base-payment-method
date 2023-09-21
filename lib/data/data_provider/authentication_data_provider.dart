import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';

import '../constants/api_routes.dart';
import '../constants/enum/request_type.dart';
import '../constants/enum/view_state.dart';
import '../model/auth/enter_passcode_response.dart';
import '../model/auth/login_response.dart';
import '../network_manager/network_manager.dart';
import '../view_models/auth/enter_passcode_model.dart';

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
        if (response['message'] == true) {
          print("Now at home screen");
        }
        else {
          print('Incorrect passcode. Please try again.');
        }

        var result = EnterPasscodeResponse.fromJson(response);
        completer.complete(result);
      } else {
        completer.completeError("Network error or no response received.");
      }
    } catch (e) {
      print('An error occurred while verifying the passcode, please check your internet connection.');
      completer.completeError(e);
    }
    return completer.future;
  }


}
