import 'dart:io';

import 'package:app_network/src/core/dio_config.dart';
import 'package:dio/dio.dart';
import 'package:async/async.dart';
import 'package:flutter/cupertino.dart';
import '../base/api_response.dart';
import '../constants/constants.dart';
import '../constants/http_code.dart';
import 'method.dart';

///
/// @data: 2023/7/8 16:47
/// @author: Sensi
/// @remark:
class AsyncHttp {
  late final Dio _dio;

  AsyncHttp._() {
    _dio = Dio(options);
    _dio.interceptors.add(loadingInterceptor);
    _dio.interceptors.add(tokenInterceptor);
    _dio.interceptors.add(logInterceptor);
  }

  static final AsyncHttp _instance = AsyncHttp._();

  factory AsyncHttp() {
    return _instance;
  }

  Dio get dio => _dio;

  CancelableOperation<T> cancellableRequest<T extends ApiResponse>(
    T model,
    String path, {
    Method method = Method.get,
    Map<String, dynamic>? params,
    Map<String, dynamic>? headers,
    data,
    bool enableToken = false,
    bool enableLoading = true,
    CancelToken? cancelToken,
    Options? options,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
    Function(T t)? onSuccess,
    Function(int code, String msg)? onFailed,
  }) {
    cancelToken ??= CancelToken();
    final r = request(model, path,
        method: method,
        headers: headers,
        data: data,
        params: params,
        enableToken: enableToken,
        enableLoading: enableLoading,
        options: options,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
        onSuccess: onSuccess,
        cancelToken: cancelToken,
        onFailed: onFailed);
    CancelableOperation<T> cancelableOperation =
        CancelableOperation.fromFuture(r, onCancel: () => cancelToken?.cancel('request canceled'));
    return cancelableOperation;
  }

  Future<T> request<T extends ApiResponse>(
    T model,
    String path, {
    Method method = Method.get,
    Map<String, dynamic>? params,
    Map<String, dynamic>? headers,
    data,
    bool enableToken = false,
    bool enableLoading = false,
    CancelToken? cancelToken,
    Options? options,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
    Function(T t)? onSuccess,
    Function(int code, String msg)? onFailed,
  }) async {
    options ??= Options(method: methodValues[method]);
    if (headers != null && enableToken) {
      headers.addAll(tokenHeader());
    }
    options.headers = headers ?? (enableToken ? tokenHeader() : headers);
    if (enableLoading) {
      if (options.headers == null) {
        options.headers = {enableLoadingHeader: enableLoading};
      } else {
        options.headers?.addAll({enableLoadingHeader: enableLoading});
      }
    }
    try {
      Response response = await _dio.request(path,
          data: data,
          queryParameters: params,
          cancelToken: cancelToken,
          options: options,
          onSendProgress: onSendProgress,
          onReceiveProgress: onReceiveProgress);

      final jsonMap = response.data;
      model.fromJsonConvert(jsonMap);

      /// handler callback
      if (model.success) {
        onSuccess?.call(model.data);
      } else {
        onFailed?.call(model.code, model.msg);
      }
      return model;
    } on DioException catch (e) {
      if (e.error is SocketException) {
        debugPrint("Dio socket exception");
        model.code = HttpCode.netError;
        model.msg = "Socket Exception";
        onFailed?.call(model.code, model.msg);
        return model;
      }
      debugPrint("Dio exception => ${e.message}");
      model.code = HttpCode.dioError;
      model.msg = e.runtimeType.toString();
      onFailed?.call(model.code, model.msg);
      return model;
    } catch (e) {
      debugPrint("Exception => ${e.toString()}");
      model.code = HttpCode.error;
      model.msg = e.runtimeType.toString();
      onFailed?.call(model.code, model.msg);
      return model;
    }
  }
}
