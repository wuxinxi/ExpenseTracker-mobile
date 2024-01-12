import 'dart:io';

///
/// @data: 2023/7/8 17:00
/// @author: Sensi
/// @remark:
class HttpCode {
  static const ok = HttpStatus.ok;

  static const error = -1;

  static const canceled = -2;

  static const netError = -3;

  static const dioError = -4;

  static const tokenTimeout = -10005;

  static const requireLogin = -10007;
}
