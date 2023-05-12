import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ApiInterceptors extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    debugPrint(
        "${options.method} | ${options.baseUrl}  | ${options.headers} | ${options.path} | ${options.uri} | ${options.data}");
    super.onRequest(options, handler); //add this line
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    handler.next(err);
    // do something to error
    super.onError(err, handler); //add this line
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // do something before response
    super.onResponse(response, handler); //add this line
  }
}
