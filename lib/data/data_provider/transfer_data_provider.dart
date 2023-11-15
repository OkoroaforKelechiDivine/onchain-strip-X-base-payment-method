import 'dart:async';
import 'dart:convert';
import 'package:flutter/cupertino.dart';

import '../../core/constants/api_routes.dart';
import '../../core/constants/enum/request_type.dart';
import '../model/auth/app_response.dart';
import '../network_manager/network_manager.dart';


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

class Biller{
  final String id;
  final String name;
  final String division;
  final String product;
  final String category;

  Biller(this.id, this.name, this.division, this.product, this.category);
  factory Biller.fromJson(Map<String, dynamic> json) {
    return Biller(
      json["id"] as String,
      json["name"] as String,
      json["division"] as String,
      json["product"] as String,
      json["category"] as String,
    );
  }
}

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

  Future<List<Biller>> fetchAllBillers(BuildContext context) async {
    var completer = Completer<List<Biller>>();
    try {
      Map<String, dynamic>? response = await networkManager.networkRequestManager(
        RequestType.GET,
        ApiRoutes.getAllBillers,
        useAuth: true,
        retrieveResponse: true,
        retrieveUnauthorizedResponse: false,
      );

      if (response != null) {
        if (response.containsKey('data') && response['data'] is List) {
          List<dynamic> billerList = response['data'];
          List<Biller> billers = billerList.map((billerJson) => Biller.fromJson(billerJson)).toList();
          print(billers);
          completer.complete(billers);
        } else {
          completer.completeError("Invalid response format.");
        }
      } else {
        completer.completeError("Network error or no response received.");
      }
    } catch (e) {
      print("An Error Occurred: $e");
      completer.completeError("An error occurred while fetching billers: $e");
    }
    return completer.future;
  }

  Future<List<Map<String, dynamic>>> fetchBillerItems(
      BuildContext context, String billerId, String divisionId, String productId) async {
    var completer = Completer<List<Map<String, dynamic>>>();
    try {
      String routes = ApiRoutes.getBillerItems(billerId, divisionId, productId);
      Map<String, dynamic>? response = await networkManager.networkRequestManager(
        RequestType.GET,
        routes,
        useAuth: true,
        retrieveResponse: true,
        retrieveUnauthorizedResponse: false,
      );

      if (response != null) {
        if (response.containsKey('data') && response['data'] is Map<String, dynamic>) {
          Map<String, dynamic> data = response['data'];
          if (data.containsKey('paymentitems') && data['paymentitems'] is List) {
            List<dynamic> paymentItemsList = data['paymentitems'];
            List<Map<String, dynamic>> paymentItems =
            paymentItemsList.map((item) => item as Map<String, dynamic>).toList();
            completer.complete(paymentItems);
          } else {
            completer.completeError("Invalid response format: 'paymentitems' not found.");
          }
        } else {
          completer.completeError("Invalid response format: 'data' not found or not a Map.");
        }
      } else {
        completer.completeError("Network error or no response received.");
      }
    } catch (e) {
      print("An Error Occurred: $e");
      completer.completeError("An error occurred while fetching biller items: $e");
    }
    return completer.future;
  }

  Future<AppResponse> payBill(BuildContext context, Map<String, dynamic> payBillsDetails) async {
    var completer = Completer<AppResponse>();
    try {
      print("Request Body: ${json.encode(payBillsDetails)}");
      var data = {
        "customerId":"08011111122",
        "amount":"2000",
        "division":"C",
        "paymentItem":null,
        "productId":"425",
        "billerId":"mtnng"
      };

      Map<String, dynamic>? response = await networkManager.networkRequestManager(
        RequestType.POST,
        ApiRoutes.payBills,
        body: data,
        useAuth: true,
        retrieveResponse: true,
        retrieveUnauthorizedResponse: false,
      );
      print("++++++++++++++++");
      print(response);
      print("++++++++++++++++");

      if (response != null) {
        if (response.containsKey('status') && response['status'] == '200') {
          print("Response Message: ${response["message"]}");
          print("Response Data - Reference: ${response["data"]["reference"]}");
          completer.complete(AppResponse.fromJson(response));
        } else {
          String errorMessage = response.containsKey("message") ? response["message"] : "Payment Failed";
          print(errorMessage);
        }
      } else {
        completer.completeError("Network error or no response received.");
      }
    } catch (e) {
      print("Error occurred: $e");
      completer.completeError("An error occurred: $e");
    }
    return completer.future;
  }


}