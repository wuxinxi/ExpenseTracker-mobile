import 'dart:io';

import 'package:app_network/src/interceptor/loading_interceptor.dart';
import 'package:app_network/src/interceptor/token_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import '../constants/api_config.dart';
import '../constants/constants.dart';
import 'method.dart';

///
/// @data: 2023/7/8 22:46
/// @author: Sensi
/// @remark:

BaseOptions options = BaseOptions(
    connectTimeout: const Duration(seconds: 15),
    receiveTimeout: const Duration(seconds: 15),
    sendTimeout: const Duration(seconds: 15),
    headers: {'content-type': 'application/json'},
    responseType: ResponseType.json,
    baseUrl: baseUrl,
    validateStatus: (_) => true);

TokenInterceptor tokenInterceptor = TokenInterceptor();

LoadingInterceptor loadingInterceptor = LoadingInterceptor();

PrettyDioLogger logInterceptor = PrettyDioLogger(
    requestHeader: true,
    requestBody: true,
    responseBody: true,
    responseHeader: true,
    error: true,
    compact: true,
    maxWidth: 90);

final methodValues = {
  Method.get: Method.get.name,
  Method.post: Method.post.name,
  Method.put: Method.put.name,
  Method.delete: Method.delete.name,
  Method.patch: Method.patch.name,
  Method.head: Method.head.name
};

Map<String, dynamic> tokenHeader() {
  return {authorizationHeader: 'Bearer '};
}
