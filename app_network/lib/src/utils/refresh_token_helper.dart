import 'dart:convert';
import 'dart:io';

import 'package:app_user/app_user.dart';
import 'package:flutter/cupertino.dart';

import '../../app_network.dart';

///
/// @date: 2022/4/26 15:24
/// @author: Sensi
/// @remark:
///

class RefreshTokenHelper {
  static const _maxCount = 3;

  static Future<TokenResponse> refreshToken() async {
    return multiSyncRefreshTokenRetry(TokenResponse());
  }

  static Future<TokenResponse> multiSyncRefreshTokenRetry(TokenResponse response) async {
    if (response.tokenErrorCount >= _maxCount || response.failedCount >= _maxCount) {
      debugPrint('${DateTime.now()} multiSyncRefreshTokenRetry>>(RefreshTokenHelper:25)>>Failed to refresh 3 times');
      return response;
    }

    TokenResponse token = await singleSyncRefreshToken(response);
    if (token.code == HttpStatus.ok) {
      UserManager().updateToken(token.content!);
      return token;
    }
    return multiSyncRefreshTokenRetry(response);
  }

  static Future<TokenResponse> singleSyncRefreshToken(TokenResponse tokenResponse) async {
    HttpClient? client;
    try {
      client = HttpClient();
      HttpClientRequest request = await client.postUrl(Uri.parse(refreshTokenUrl));
      request.headers.set('Authorization', '${UserManager().refreshToken}');
      request.headers.set('Content-Type', 'application/json');
      HttpClientResponse response = await request.close();
      int statusCode = response.statusCode;

      debugPrint('${DateTime.now()} singleSyncRefreshToken>>(RefreshTokenHelper:48)>>statusCode=$statusCode ');

      if (statusCode == HttpStatus.unauthorized) {
        return tokenResponse.failed(tokenResponse.tokenErrorCount + 1 >= _maxCount ? HttpCode.requireLogin : statusCode,
            tokenResponse.failedCount + 1, tokenResponse.tokenErrorCount + 1, 'token invalid');
      }

      if (statusCode == HttpStatus.ok) {
        var responseBody = await response.transform(utf8.decoder).join();
        const JsonDecoder decoder = JsonDecoder();
        var convert = decoder.convert(responseBody);
        String token = convert["data"];
        UserManager().updateToken(token);
        return TokenResponse.success(token);
      }
    } catch (_) {
    } finally {
      try {
        client?.close();
      } catch (_) {}
    }
    return tokenResponse.failed(
        -1, tokenResponse.failedCount + 1, tokenResponse.tokenErrorCount, 'refresh token failed');
  }
}

class TokenResponse {
  int failedCount = 0;
  int tokenErrorCount = 0;
  int code = -1;
  String? content;

  TokenResponse failed(int code, int failedCount, int tokenErrorCount, String? content) {
    this.code = code;
    this.failedCount = failedCount;
    this.tokenErrorCount = tokenErrorCount;
    this.content = content;
    return this;
  }

  TokenResponse();

  TokenResponse.success(this.content, {this.code = 200});
}
