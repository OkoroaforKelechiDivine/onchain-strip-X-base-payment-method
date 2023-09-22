import 'dart:async';
import 'package:flutter/cupertino.dart';

import '../constants/api_routes.dart';
import '../constants/enum/request_type.dart';
import '../model/auth/app_response.dart';
import '../network_manager/network_manager.dart';

class TransferDataProvider {
  NetworkManager networkManager = NetworkManager();

  Future<AppResponse> fetchBankList(BuildContext context) async {
    var completer = Completer<AppResponse>();
    try {
      Map<String, dynamic>? response = await networkManager.networkRequestManager(
        RequestType.GET,
        ApiRoutes.getAllBanks,
        useAuth: true,
        retrieveResponse: true,
        retrieveUnauthorizedResponse: false,
      );
      if (response != null) {
        if (response.containsKey('data') && response['data'] is List) {
          List<dynamic> bankList = response['data'];
          List<Bank> banks = bankList.map((bankJson) => Bank.fromJson(bankJson)).toList();
          completer.complete(AppResponse(token: "Success"));
        } else {
          completer.complete(AppResponse(token: "Invalid response format."));
        }
      } else {
        completer.complete(AppResponse(token: "Network error or no response received."));
      }
    } catch (e) {
      completer.complete(AppResponse(token: "An error occurred: $e"));
    }
    return completer.future;
  }
}

  class Bank {
  final String name;
  final String logo;
  final int id;
  final String code;

  Bank(this.name, this.logo, this.id, this.code);

  factory Bank.fromJson(Map<String, dynamic> json) {
    return Bank(
      json['name'] as String,
      json['logo'] as String,
      json['id'] as int,
      json['code'] as String,
    );
  }
}
