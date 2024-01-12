import 'package:app_user/app_user.dart';

import 'dart_queue_base.dart';
import 'refresh_token_helper.dart';

///
/// @date: 2023/7/13 20:16
/// @author: Sensi
/// @remark:
///

class SyncRefreshToken {
  final Queue _queue = Queue();
  static final SyncRefreshToken _instance = SyncRefreshToken._();

  SyncRefreshToken._();

  static SyncRefreshToken instance() => _instance;

  Future<TokenResponse> syncRefresh({String? lastToken}) async {
    return await _queue.add(() async {
      if (UserManager().nonLogin) {
        return TokenResponse();
      }
      if (lastToken == null) {
        return await RefreshTokenHelper.refreshToken();
      }
      String curToken = UserManager().accessToken!;
      if (lastToken == curToken) {
        //refresh token
        return await RefreshTokenHelper.refreshToken();
      }
      return TokenResponse.success(curToken);
    });
  }
}
