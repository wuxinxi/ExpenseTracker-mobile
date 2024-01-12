import 'package:app_common/app_common.dart';
import 'package:dio/dio.dart';

import '../constants/constants.dart';

///
/// @date: 2023/7/11 20:04
/// @author: Sensi
/// @remark:
///

class LoadingInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (err.requestOptions.headers.containsKey(enableLoadingHeader)) {
      dismissLoading();
    }
    super.onError(err, handler);
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (options.headers.containsKey(enableLoadingHeader)) {
      showLoading();
    }
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (response.requestOptions.headers.containsKey(enableLoadingHeader)) {
      dismissLoading();
    }
    super.onResponse(response, handler);
  }
}
