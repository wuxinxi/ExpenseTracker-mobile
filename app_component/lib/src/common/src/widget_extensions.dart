import 'package:app_common/app_common.dart';
import 'package:flutter/material.dart';

///
/// @date: 2022/12/28 13:58
/// @author: Sensi
/// @remark:
///

extension WidgetExtensions on Widget {
  Widget padding(EdgeInsetsGeometry padding) {
    return Padding(padding: padding, child: this);
  }

  Widget margin(EdgeInsetsGeometry? margin) {
    return Container(margin: margin, child: this);
  }

  Positioned bottom({double bottom = 0}) {
    return Positioned(left: 0, right: 0, bottom: bottom, child: this);
  }

  Positioned right({double right = 0}) {
    return Positioned(right: right, top: 0, bottom: 0, child: this);
  }

  Widget appendTight({required Widget child}) {
    return Row(children: [Expanded(child: this), child]);
  }

  Widget center() {
    return Center(child: this);
  }

  Future showDialog({
    String? path,
    Color? barrierColor,
    bool barrierDismissible = false,
  }) async {
    await AppRouter.showDialog(
        path: path,
        barrierColor: barrierColor,
        barrierDismissible: barrierDismissible,
        builder: (context, path) => this);
  }

  Card addTopShadow({double elevation = 10}) {
    return Card(margin: EdgeInsets.zero, elevation: elevation, shape: const RoundedRectangleBorder(), child: this);
  }
}

extension DoubleExtensions on double {
  Widget spaceV() {
    return SizedBox(height: this);
  }

  Widget spaceH() {
    return SizedBox(width: this);
  }
}
