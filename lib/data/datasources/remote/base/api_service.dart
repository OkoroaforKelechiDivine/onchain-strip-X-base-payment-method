import 'package:dio/dio.dart';
import 'package:pay_me_mobile/data/datasources/remote/base/api_failure.dart';

import '../../../../core/cores.dart';
import 'endpoints.dart';
import 'logging_interceptor.dart';

class ApiService {
  ApiService({required this.path});

  final String path;

  Dio get _dio => Dio(
        BaseOptions(
          headers: {
            "Authorization":
                appGlobals.token == null ? null : 'Bearer ${appGlobals.token}',
          },
          baseUrl: Endpoints.baseUrl + path,
          contentType: Headers.jsonContentType,
          responseType: ResponseType.json,
        ),
      )..interceptors.add(
          LoggingInterceptor(),
        );

  Future<dynamic> get(String path, {Map<String, dynamic>? queryParams}) async {
    try {
      final res = await _dio.get(path, queryParameters: queryParams);
      return res.data;
    } on DioError catch (e) {
      String errorMessage = e.response?.data["error"] ?? e.message;
      throw ApiFailure(_handleError(e));
    }
  }

  Future<dynamic> delete(String path,
      {Map<String, dynamic>? queryParams}) async {
    try {
      final res = await _dio.delete(path, queryParameters: queryParams);
      return res.data;
    } on DioError catch (e) {
      String errorMessage = e.response?.data["error"] ?? e.message;
      throw ApiFailure(_handleError(e));
    }
  }

  Future<dynamic> post(String path, {Object? data}) async {
    try {
      final res = await _dio.post(path, data: data);
      return res.data;
    } on DioError catch (e) {
      String errorMessage = e.response?.data["error"] ?? e.message;
      throw ApiFailure(_handleError(e));
    }
  }

  Future<dynamic> put(String path, {Object? data}) async {
    try {
      final res = await _dio.put(path, data: data);
      return res.data;
    } on DioError catch (e) {
      String errorMessage = e.response?.data["error"] ?? e.message;
      throw ApiFailure(_handleError(e));
    }
  }

  Future<dynamic> patch(String path, {Object? data}) async {
    try {
      final res = await _dio.patch(path, data: data);
      return res.data;
    } on DioError catch (e) {
      throw ApiFailure(e.message ?? 'Something went wrong!');
    }
  }

  String _handleError(DioError dioError) {
    String errorDescription = "";
    //if (error is DioError) {
    //DioError dioError = error as DioError;

    switch (dioError.type) {
      case DioErrorType.cancel:
        errorDescription = "Request to server was cancelled";
        break;
      case DioErrorType.connectionTimeout:
        errorDescription = "Connection timeout. Please try again!";
        break;
      case DioErrorType.unknown:
        errorDescription = "Something went wrong";
        break;
      case DioErrorType.receiveTimeout:
        errorDescription = "Receive timeout in connection with server";
        break;
      case DioErrorType.sendTimeout:
        errorDescription = "Send timeout in connection with server";
        break;
      case DioErrorType.connectionError:
        errorDescription = "Connection to server failed due to internet";
        break;
      case DioErrorType.badCertificate:
        errorDescription = "Bad certificate";
        break;
      case DioErrorType.badResponse:
        errorDescription = "Bad response";
        if (dioError.response?.data["meta"]['message'] != null) {
          errorDescription = dioError.response?.data["meta"]['message'];
        }

        if (dioError.response?.data["meta"]['message'] != null) {
          errorDescription = dioError.response?.data["meta"]['message'];
        }
        break;
    }

    return errorDescription;
  }
}
