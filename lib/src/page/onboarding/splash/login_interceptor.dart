import 'package:app_common/app_common.dart';
import 'package:app_user/app_user.dart';
import 'package:expense_tracker/src/constants/router_path.dart';
import 'package:flutter/src/widgets/framework.dart';

///
/// @date: 2023/7/12 22:01
/// @author: Sensi
/// @remark:
///

class LoginInterceptor extends RedirectInterceptor {
  @override
  Future navigateTo(BuildContext context) async {
    return AppRouter.navigateTo(userLogin, replace: true);
  }

  @override
  Future<bool> requiresInterception() async {
    return !UserManager().isLogin;
  }
}
