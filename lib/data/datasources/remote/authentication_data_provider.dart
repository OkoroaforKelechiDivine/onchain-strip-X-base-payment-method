import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:pay_me_mobile/data/datasources/remote/base/api_failure.dart';
import 'package:pay_me_mobile/data/datasources/remote/base/api_response.dart';
import 'package:pay_me_mobile/data/datasources/remote/base/api_service.dart';

import '../../../core/constants/api_routes.dart';
import '../../../core/constants/enum/request_type.dart';
import '../../model/response/auth/app_response.dart';
import '../../model/response/auth/login_response.dart';
import '../../network_manager/network_manager.dart';

class AuthenticationDataProvider {
  final _apiService = ApiService(path: '/auth');

  Future<ApiResponse<LoginResponse?>> loginAPI(
      {required String email, required String password}) async {
    try {
      final res = await _apiService
          .post('/login', data: {'email': email, 'password': password});
      return ApiResponse.fromJson(res)
        ..success = true
        ..data = LoginResponse.fromJson(res['data']);
    } on ApiFailure catch (e) {
      return ApiResponse(success: false, message: e.message);
    }
  }
  
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

  //   static const String baseUrl = 'https://dzbilqfc4qszv.cloudfront.net/auth';

//   static Future<void> verifyPassCode(BuildContext context, String passcode) async {
//     final token = Provider.of<TokenProvider>(context, listen: false).token;
//     final options = BaseOptions(
//       headers: {
//         'Authorization': 'Bearer $token',
//       },
//     );
//     final dioWithToken = Dio(options);
//     const url = '$baseUrl/validate_passcode';

//     try {
//       final response = await dioWithToken.post(
//         url,
//         data: {
//           'passcode': passcode,
//         },
//       );
//       if (response.data['message'] == true) {
//         _startProcessingAndNavigate(context);
//       } else {
//         _showErrorDialog(context, 'Incorrect passcode. Please try again.');
//       }
//     } catch (e) {
//       _showErrorDialog(context, 'An error occurred while verifying the passcode, please check your internet connection.');
//     }
//   }

//   static void _showErrorDialog(BuildContext context, String errorMessage) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: const Text("Error"),
//           content: Text(errorMessage),
//           actions: <Widget>[
//             TextButton(
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//               child: const Text("OK"),
//             ),
//           ],
//         );
//       },
//     );
//   }

//   static void _startProcessingAndNavigate(BuildContext context) {
//     Future.delayed(const Duration(seconds: 5), () {
//       Navigator.of(context).pushReplacementNamed("/home");
//     });
//   }

//   static Future<void> savePasscodeToEndpoint(BuildContext context, String passcode) async {
//     final token = Provider.of<TokenProvider>(context, listen: false).token;
//     final options = BaseOptions(
//       headers: {
//         'Authorization': 'Bearer $token',
//       },
//     );
//     final dioWithToken = Dio(options);
//     const url = '$baseUrl/set_passcode';

//     try {
//       final response = await dioWithToken.post(
//         url,
//         data: {
//           'passcode': passcode,
//         },
//       );

//       if (response.statusCode == 200) {
//         _startProcessingAndNavigate(context);
//       }
//     } catch (exception) {
//       _showErrorDialog(context, "Passcode doesn't match.'");
//     }
//   }

//   static Future<void> login(BuildContext context, String username, String password) async {
//     final dio = Dio();
//     final connectivityResult = await Connectivity().checkConnectivity();

//     if (connectivityResult == ConnectivityResult.none) {
//       _showErrorDialog(context, "Network problem. Please check your internet connection.");
//       return;
//     }

//     try {
//       Response response = await dio.post(
//         "$baseUrl/login",
//         data: {
//           "username": username,
//           "password": password,
//         },
//       );

//       if (response.statusCode == 200) {
//         final Map<String, dynamic> responseData = response.data;
//         final String token = responseData['token'];
//         context.read<TokenProvider>().setToken(token);

//         Map<String, dynamic> payload = Jwt.parseJwt(token);
//         if (payload['is_first_login']) {
//           Navigator.pushReplacementNamed(context, "/set_pass_code");
//         } else {
//           Navigator.pushReplacementNamed(context, "/enter_pass_code");
//         }
//         return;
//       }
//     } catch (exception) {
//       _showErrorDialog(context, "Login Failed, please try again.");
//     }
//   }

}
