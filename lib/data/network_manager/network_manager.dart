import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:pay_me_mobile/data/constants/environment_initializer.dart';

import '../constants/enum/request_type.dart';
import '../utilities/secure_storage/secure_storage_utils.dart';

class NetworkManager {
  static BaseOptions options = BaseOptions(
      connectTimeout: 30000,
      receiveTimeout: 30000,
      headers: {'Accept': 'application/json'}
  );

  Dio? client = Dio(options);
  Response<dynamic>? response;

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
    print(url);
    print(body);

    if (useAuth) {
      client!.interceptors.add(InterceptorsWrapper(onRequest:
          (RequestOptions options, RequestInterceptorHandler handler) async {
        options.headers["Authorization"] = "Bearer $token";
        return handler.next(options);
      }));
    }
    try {
      switch (requestType) {
        case RequestType.GET:
           response =
          await client!.get(url, queryParameters: queryParameters);
          // log("get ....: ${response.data.toString()}");
          apiResponse = response?.data;
          break;

        case RequestType.POST:
          response = await client!
              .post(url, data: body, queryParameters: queryParameters,);

          apiResponse = response?.data;
          break;

        case RequestType.PUT:
          response = await client!
              .put(url, data: body, queryParameters: queryParameters);
          apiResponse = response?.data;
          break;

        case RequestType.PATCH:
         response = await client!
              .patch(url, data: body, queryParameters: queryParameters);
          apiResponse = response?.data;
          break;

        case RequestType.DELETE:
         response = await client!
              .delete(url, data: body, queryParameters: queryParameters);
          apiResponse = response?.data;
          break;
        default:
         response = await client!
              .post(url, data: body, queryParameters: queryParameters);
          apiResponse = response?.data;
          break;
      }
      print(apiResponse);
      return apiResponse;
    } on TimeoutException catch (_) {
      print("timeout");
      throw ("Network timed out, please check your network connection and try again");
    } on DioError catch (e) {
      print("status code ===> ${response?.statusCode}");

      if (DioErrorType.receiveTimeout == e.type ||
          DioErrorType.connectTimeout == e.type) {
        throw ("Network timed out, please check your network connection and try again");
      }

      if (DioErrorType.other == e.type) {
        if (e.message.contains('SocketException')) {
          throw ("No internet connection, please check your network connection and try again");
        } else {
          throw ("An error occurred processing this request, please try again later");
        }
      }

      if(response?.statusCode == 400){
        print("Unauthorirzed Error");
      }
      if(response?.statusCode == 500){
        print("Internal Server Error");
      }

    } catch (e) {
      print("catched error");
      throw ("An error occurred while processing this request");
    }
    return null;
  }
}
