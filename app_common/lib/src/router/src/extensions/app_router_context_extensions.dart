import 'package:app_common/app_common.dart';
import 'package:flutter/material.dart';
import '../bundle/app_bundle.dart';

///
/// @date: 2022/4/19 08:54
/// @author: Sensi
/// @remark:
///
extension AppRouterContext on BuildContext {
  Bundle? _bundle() {
    final arguments = ModalRoute.of(this)?.settings.arguments;
    if (arguments != null) {
      return arguments as Bundle;
    }
    return null;
  }

  Bundle? get bundle => _bundle();

  void go(String path, {Bundle? bundle}) => AppRouter.navigateTo(path, bundle: bundle, clearStack: true);

  Future push(String path, {Bundle? bundle}) => AppRouter.navigateTo(path, bundle: bundle);

  void pop<T extends Object?>({String? path, T? result}) =>
      path == null ? AppRouter.pop(result: result) : AppRouter.popRoute(path, result);
}
