import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sportify/env/env.dart';
import 'package:sportify/src/repositories/api_repository/api_repository.dart';
import 'package:sportify/src/repositories/api_repository/interceptor.dart';
import 'package:sportify/src/repositories/errors/exceptions/exceptions.dart';
import 'package:sportify/src/repositories/errors/failure.dart';

final dioRepository = Provider<ApiRepository>((_) => DioImpl());

class DioImpl implements ApiRepository {
  

  DioImpl() {
    dio = Dio(
      BaseOptions(
          connectTimeout: const Duration(seconds: 10),
          receiveTimeout: const Duration(seconds: 10),
          headers: <String, dynamic>{
            // HttpHeaders.accessControlAllowCredentialsHeader:
            //     true, // Required for cookies, authorization headers with HTTPS
            // HttpHeaders.accessControlAllowHeadersHeader:
            //     "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token",
            // HttpHeaders.accessControlAllowMethodsHeader: "GET, POST, OPTIONS",
            // HttpHeaders.contentTypeHeader: "application/json",
            // HttpHeaders.acceptHeader: "application/json"

          }),
    );
    dio.interceptors.add(ApiInterceptors());
  }

  late Dio dio;

  @override
  Future<T> getData<T>({
    required String path,
    Map<String, dynamic>? headers,
    Map<String, String>? queryParameters,
    required T Function(dynamic data) builder,
  }) async {
    try {
      dio.options.headers = headers;
      Response response = await dio.get(path, queryParameters: queryParameters);
      return builder(response.data);
    } catch (e) {
      debugPrint(e.toString());
      log(e.toString());
      final _failure = ServerFailure(
        message: Exceptions.errorMessage(e),
        statusCode: Exceptions.statusCode(e),
      );
      return builder(_failure);
    }
  }

  @override
  Future<T> postData<T>({
    required String path,
    required Map<String, dynamic>? headers,
    dynamic data,
    required T Function(dynamic data) builder,
  }) async {
    try {
      dio.options.headers = headers;
      Response response = await dio.post(path, data: data);
      return builder(response.data);
    } catch (e) {
      log(e.toString());
      final _failure = ServerFailure(
        message: Exceptions.errorMessage(e),
        statusCode: Exceptions.statusCode(e),
      );
      return builder(_failure);
    }
  }

  @override
  Future<T> patchData<T>({
    required String path,
    required Map<String, dynamic>? headers,
    dynamic data,
    required T Function(dynamic data) builder,
  }) async {
    try {
      dio.options.headers = headers;
      Response response = await dio.patch(path, data: data);
      return builder(response.data);
    } catch (e) {
      log(e.toString());
      final _failure = ServerFailure(
        message: Exceptions.errorMessage(e),
        statusCode: Exceptions.statusCode(e),
      );
      return builder(_failure);
    }
  }

  @override
  Future<T> putData<T>({
    required String path,
    required Map<String, dynamic>? headers,
    dynamic data,
    required T Function(dynamic data) builder,
  }) async {
    try {
      dio.options.headers = headers;
      Response response = await dio.put(path, data: data);
      return builder(response.data);
    } catch (e) {
      log(e.toString());
      final _failure = ServerFailure(
        message: Exceptions.errorMessage(e),
        statusCode: Exceptions.statusCode(e),
      );
      return builder(_failure);
    }
  }

  @override
  Future<T> deleteData<T>({
    required String path,
    required Map<String, dynamic>? headers,
    dynamic data,
    required T Function(dynamic data) builder,
  }) async {
    try {
      dio.options.headers = headers;
      Response response = await dio.delete(path, data: data);
      return builder(response.data);
    } catch (e) {
      log(e.toString());
      final _failure = ServerFailure(
        message: Exceptions.errorMessage(e),
        statusCode: Exceptions.statusCode(e),
      );
      return builder(_failure);
    }
  }
}
