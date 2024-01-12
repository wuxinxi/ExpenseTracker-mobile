import 'dart:io';

import 'package:app_network/app_network.dart';
import 'package:app_user/app_user.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../constants/constants.dart';
import '../utils/dart_queue_base.dart';
import '../utils/refresh_token_helper.dart';

///
/// @data: 2023/7/8 22:40
/// @author: Sensi
/// @remark:
class TokenInterceptor extends Interceptor {
  final Queue _queue = Queue();

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) async {
    if (response.statusCode == HttpStatus.unauthorized) {
      if (!response.requestOptions.headers.containsKey(authorizationHeader)) {
        return super.onResponse(response, handler);
      }

      if (UserManager().nonLogin) {
        UserManager().logout();
        return super.onResponse(response, handler);
      }

      TokenResponse tokenResponse = await _refresh(response);

      if (tokenResponse.code == HttpStatus.ok) {
        return await _retryRequest('${tokenResponse.content}', response, handler);
      }

      if (tokenResponse.code == HttpCode.requireLogin) {
        UserManager().logout();
        debugPrint('${DateTime.now()} onResponse>>(TokenAuthenticatorInterceptor:39)>>logout');
      }
    }
    return super.onResponse(response, handler);
  }

  Future<TokenResponse> _refresh(Response response) async {
    return await _queue.add(() async {
      if (UserManager().nonLogin) {
        return TokenResponse();
      }
      String lastToken = response.requestOptions.headers[authorizationHeader];
      String curToken = UserManager().accessToken!;
      if (lastToken == curToken) {
        //refresh token
        return await RefreshTokenHelper.refreshToken();
      }
      return TokenResponse.success(curToken);
    });
  }

  Future<void> _retryRequest(token, Response response, handler) async {
    var requestOptions = response.requestOptions;
    requestOptions.headers[authorizationHeader] = token;
    Options options = Options(
        method: requestOptions.method,
        extra: requestOptions.extra,
        headers: requestOptions.headers,
        contentType: requestOptions.contentType,
        listFormat: requestOptions.listFormat);

    final endResponse = await AsyncHttp().dio.request(requestOptions.path,
        queryParameters: requestOptions.queryParameters, options: options, data: requestOptions.data);
    debugPrint('${DateTime.now()} _retryRequest>>(TokenAuthenticatorInterceptor:72)>>重新发起请求');
    return handler.resolve(endResponse);
  }
}
