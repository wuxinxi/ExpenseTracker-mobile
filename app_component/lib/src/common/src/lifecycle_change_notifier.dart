import 'package:flutter/material.dart';

///
/// @date: 2023/7/6 14:56
/// @author: Sensi
/// @remark:
///

class LifecycleChangeNotifier extends ChangeNotifier {
  bool _recycled = false;

  bool get recycled => _recycled;

  @override
  void notifyListeners() {
    if (_recycled) {
      debugPrint('notifyListeners>>(LifecycleChangeNotifier:17)>> is recycled !!!');
    } else {
      super.notifyListeners();
    }
  }

  @override
  void dispose() {
    _recycled = true;
    super.dispose();
  }
}
