import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pay_me_mobile/data/constants/environment_initializer.dart';

import '../constants/enum/request_type.dart';
import '../utilities/secure_storage/secure_storage_utils.dart';

class NetworkManager {
  static BaseOptions options = BaseOptions(
      connectTimeout: const Duration(seconds: 20),
      receiveTimeout: const Duration(seconds: 20),
      headers: {
        'Accept': '*/*',
        'Content-Type': 'application/json',
        'Connection': 'keep-alive'
      }
  );

  Dio client = Dio(options);

  Future<Map<String, dynamic>?> networkRequestManager(
      RequestType requestType,
      String requestUrl, {
        dynamic body,
        queryParameters,
        bool useAuth = true,
        bool retrieveResponse = true,
        bool retrieveUnauthorizedResponse = false,
      }) async {
    Map<String, dynamic> apiResponse;

    String? token = await SecureStorageUtils.retrieveToken();
    var baseUrl = EnvironmentInitializer.BASE_URL;
    String url = '$baseUrl$requestUrl';
    if (kDebugMode) {
      print(url);
      print(body);
    }

    if (useAuth) {
      client.interceptors.add(InterceptorsWrapper(onRequest:
          (RequestOptions options, RequestInterceptorHandler handler) async {
        options.headers["Authorization"] = "Bearer $token";
        return handler.next(options);
      }));
    }
    try {
      switch (requestType) {
        case RequestType.GET:
          var response =
          await client.get(url, queryParameters: queryParameters);
          apiResponse = response?.data;
          break;

        case RequestType.POST:
         var response = await client!
              .post(url, data: body, queryParameters: queryParameters,);

          apiResponse = response?.data;
          break;

        case RequestType.PUT:
         var response = await client!
              .put(url, data: body, queryParameters: queryParameters);
          apiResponse = response?.data;
          break;

        case RequestType.PATCH:
         var response = await client!
              .patch(url, data: body, queryParameters: queryParameters);
          apiResponse = response?.data;
          break;

        case RequestType.DELETE:
         var response = await client!
              .delete(url, data: body, queryParameters: queryParameters);
          apiResponse = response?.data;
          break;
        default:
         var response = await client!
              .post(url, data: body, queryParameters: queryParameters);
          apiResponse = response?.data;
          break;
      }
      print("This is response:");
      print(apiResponse);
      return apiResponse;
    } on TimeoutException catch (_) {
      print("timeout");
      throw ("Network timed out, please check your network connection and try again");
    } on DioException catch (e) {
      print("error message ===> ${e.message}");
    } catch (e) {
      print("catched error");
      throw ("An error occurred while processing this request");
    }
    return null;
  }
}
