import 'package:connectivity/connectivity.dart';
import 'package:dio/dio.dart';
import 'package:jwt_decode/jwt_decode.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import '../../../token/token_provider.dart';

class AuthHelper {

  static const String baseUrl = 'https://dzbilqfc4qszv.cloudfront.net/auth';

  static Future<void> verifyPassCode(BuildContext context, String passcode) async {
    final token = Provider.of<TokenProvider>(context, listen: false).token;
    final options = BaseOptions(
      headers: {
        'Authorization': 'Bearer $token',
      },
    );
    final dioWithToken = Dio(options);
    const url = '$baseUrl/validate_passcode';

    try {
      final response = await dioWithToken.post(
        url,
        data: {
          'passcode': passcode,
        },
      );
      if (response.data['message'] == true) {
        _startProcessingAndNavigate(context);
      } else {
        _showErrorDialog(context, 'Incorrect passcode. Please try again.');
      }
    } catch (e) {
      _showErrorDialog(context, 'An error occurred while verifying the passcode, please check your internet connection.');
    }
  }

  static void _showErrorDialog(BuildContext context, String errorMessage) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Error"),
          content: Text(errorMessage),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("OK"),
            ),
          ],
        );
      },
    );
  }

  static void _startProcessingAndNavigate(BuildContext context) {
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.of(context).pushReplacementNamed("/home");
    });
  }

  static Future<void> savePasscodeToEndpoint(BuildContext context, String passcode) async {
    final token = Provider.of<TokenProvider>(context, listen: false).token;
    final options = BaseOptions(
      headers: {
        'Authorization': 'Bearer $token',
      },
    );
    final dioWithToken = Dio(options);
    const url = '$baseUrl/set_passcode';

    try {
      final response = await dioWithToken.post(
        url,
        data: {
          'passcode': passcode,
        },
      );

      if (response.statusCode == 200) {
        _startProcessingAndNavigate(context);
      }
    } catch (exception) {
      _showErrorDialog(context, "Passcode doesn't match.'");
    }
  }

  static Future<void> login(
      BuildContext context, String username, String password) async {
    final dio = Dio();
    final connectivityResult = await Connectivity().checkConnectivity();

    if (connectivityResult == ConnectivityResult.none) {
      _showErrorDialog(context, "Network problem. Please check your internet connection.");
      return;
    }

    try {
      Response response = await dio.post(
        "$baseUrl/login",
        data: {
          "username": username,
          "password": password,
        },
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = response.data;
        final String token = responseData['token'];
        context.read<TokenProvider>().setToken(token);

        Map<String, dynamic> payload = Jwt.parseJwt(token);
        if (payload['is_first_login']) {
          Navigator.pushReplacementNamed(context, "/set_pass_code");
        } else {
          Navigator.pushReplacementNamed(context, "/enter_pass_code");
        }
        return;
      }
    } catch (exception) {
      _showErrorDialog(context, "Login Failed, please try again.");
    }
  }
}
