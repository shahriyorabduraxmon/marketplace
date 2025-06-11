import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:marketplace/core/dio/singletons/api_constants.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioSettings {
  BaseOptions _dioBaseOptions = BaseOptions(
    baseUrl: ApiConstants.baseUrl,
    connectTimeout: const Duration(milliseconds: 35000),
    receiveTimeout: const Duration(milliseconds: 35000),
    followRedirects: false,
    headers: <String, dynamic>{
      'Accept-Language': '',
      'Authorization': 'Bearer '
    },
    validateStatus: (status) => status != null && status <= 500,
  );

  void setBaseOptions({String? lang}) {
    _dioBaseOptions = BaseOptions(
      baseUrl: ApiConstants.baseUrl,
      connectTimeout: const Duration(milliseconds: 35000),
      receiveTimeout: const Duration(milliseconds: 35000),
      headers: <String, dynamic>{
        'Accept-Language': lang,
        'Authorization': 'Bearer'},
      followRedirects: false,
      validateStatus: (status) => status != null && status <= 500,
    );
  }

  final BaseOptions _dioBaseOptionsForAuth = BaseOptions(
    baseUrl: ApiConstants.baseUrl,
    connectTimeout: const Duration(milliseconds: 35000),
    receiveTimeout: const Duration(milliseconds: 35000),
    followRedirects: false,
    headers: <String, dynamic>{
      'Accept-Language': '',
    },
    validateStatus: (status) => status != null && status <= 500,
  );

  void setBaseOptionsForAuth({String? lang}) {
    _dioBaseOptions = BaseOptions(
      baseUrl: ApiConstants.baseUrl,
      connectTimeout: const Duration(milliseconds: 35000),
      receiveTimeout: const Duration(milliseconds: 35000),
      headers: <String, dynamic>{
        'Accept-Language': lang,
      },
      followRedirects: false,
      validateStatus: (status) => status != null && status <= 500,
    );
  }

  BaseOptions get dioBaseOptions => _dioBaseOptions;

  BaseOptions get dioBaseOptionsForAuth => _dioBaseOptionsForAuth;

  Dio get dio => Dio(_dioBaseOptions)
    ..interceptors.addAll([
      PrettyDioLogger(
        requestBody: kDebugMode,
        request: kDebugMode,
        requestHeader: kDebugMode,
        responseBody: kDebugMode,
        responseHeader: kDebugMode,
        error: kDebugMode,
      ),
      ErrorHandlerInterceptor()
    ]);

  Dio get dioForAuth => Dio(_dioBaseOptionsForAuth)
    ..interceptors.addAll([
      LogInterceptor(
        requestBody: kDebugMode,
        request: kDebugMode,
        requestHeader: kDebugMode,
        responseBody: kDebugMode,
        responseHeader: kDebugMode,
        error: kDebugMode,
      ),
      ErrorHandlerInterceptor(),
      // CustomInterceptor()
    ]);
}

class ErrorHandlerInterceptor implements Interceptor {
  ErrorHandlerInterceptor._();

  static final _instance = ErrorHandlerInterceptor._();

  factory ErrorHandlerInterceptor() => _instance;

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    handler.next(err);
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) async {
    handler.next(response);
  }
}
