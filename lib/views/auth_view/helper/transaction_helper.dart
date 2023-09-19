import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../../../token/token_provider.dart';

class TransactionHelper{

  static const String baseUrl = 'https://dzbilqfc4qszv.cloudfront.net/transaction';

  static Future<List<Bank>> fetchBanks(BuildContext context) async {
    final token = Provider.of<TokenProvider>(context, listen: false).token;

    final options = BaseOptions(
      headers: {
        'Authorization': 'Bearer $token',
      },
    );
    final dio = Dio(options);
    const url = '$baseUrl/get-all-banks';
    print(url);

    try {
      final response = await dio.get(url);

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = response.data;
        final List<dynamic> bankData = responseData['data']['bank'];
        List<Bank> banks = bankData.map((data) => Bank.fromJson(data)).toList();
        return banks;
      } else {
        throw Exception('Failed to load banks');
      }
    } catch (exception) {
      throw Exception('Error fetching banks: $exception');
    }
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