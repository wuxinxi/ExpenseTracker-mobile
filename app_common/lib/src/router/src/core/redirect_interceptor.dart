import 'package:flutter/material.dart';

///
/// @date: 2022/4/8 12:08
/// @author: Sensi
/// @remark:
///
abstract class RedirectInterceptor {
  Future<bool> requiresInterception();

  Future navigateTo(BuildContext context);
}
