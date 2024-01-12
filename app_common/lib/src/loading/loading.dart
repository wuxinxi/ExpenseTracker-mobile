import 'package:app_common/app_common.dart';
import 'package:app_common/src/loading/loading_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

///
/// @date: 2023/7/11 19:51
/// @author: Sensi
/// @remark:
///
const _loading = "/loading";
const _requestLoading = "/request/loading";

showRequestLoading() {
  showLoading(path: _requestLoading);
}

dismissRequestLoading() {
  dismissLoading(path: _requestLoading);
}

showLoading({String path = _loading}) {
  if (AppRouter.hasRoute(path)) return;
  AppRouter.navigateToDialog(
      path: _loading,
      builder: (context) {
        return const LoadingComponent();
      });
}

dismissLoading({String path = _loading}) {
  AppRouter.popRoute(path);
}
