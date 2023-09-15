import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:pay_me_mobile/data/constants/environment_initializer.dart';

import '../constants/enum/request_type.dart';

class NetworkManager {
  static BaseOptions options = BaseOptions(
      connectTimeout: 30000,
      receiveTimeout: 30000,
      headers: {'Accept': 'application/json'}
  );

  Dio? client = Dio(options);

  Future<Map<String, dynamic>?> networkRequestManager(
      RequestType requestType,
      String requestUrl, {
        dynamic body,
        queryParameters,
        bool useAuth = true,
        bool addToHeader = false,
        bool addPinToHeader = false,
        String? detailsToAdd,
        String? pin,
        File? backFile,
        bool retrieveResponse = true,
        bool retrieveUnauthorizedResponse = false,
      }) async {
    Map<String, dynamic> apiResponse;

    String? token = "token"; //await SecureStorageUtils.retrieveToken();
    var baseUrl = EnvironmentInitializer.BASE_URL;
    String url = '$baseUrl$requestUrl';

    // print("Bearer: $token, Url: $url, Body: $body, Query: $queryParameters");

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
          var response =
          await client!.get(url, queryParameters: queryParameters);
          // log("get ....: ${response.data.toString()}");
          apiResponse = response.data;
          break;

        case RequestType.POST:
          var response = await client!
              .post(url, data: body, queryParameters: queryParameters,);
          //log("post ....: ${response.data.toString()}");
          apiResponse = response.data;
          break;

        case RequestType.PUT:
          var response = await client!
              .put(url, data: body, queryParameters: queryParameters);
          //log("put ....: ${response.data.toString()}");
          apiResponse = response.data;
          break;

        case RequestType.PATCH:
          var response = await client!
              .patch(url, data: body, queryParameters: queryParameters);
          //log("patch ....: ${response.data.toString()}");
          apiResponse = response.data;
          break;

        case RequestType.DELETE:
          var response = await client!
              .delete(url, data: body, queryParameters: queryParameters);
          //log("delete ....: ${response.data.toString()}");
          apiResponse = response.data;
          break;
        default:
          var response = await client!
              .post(url, data: body, queryParameters: queryParameters);
          apiResponse = response.data;
          break;
      }
      return apiResponse;
    } on TimeoutException catch (_) {
      throw ("Network timed out, please check your network connection and try again");
    } on DioError catch (e) {

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

    } catch (e) {
      throw ("An error occurred while processing this request");
    }
    return null;
  }
}
