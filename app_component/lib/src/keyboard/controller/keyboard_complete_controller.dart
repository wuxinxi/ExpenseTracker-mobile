part of '../keyboard_completed.dart';

///
/// @date: 2023/7/16 19:10
/// @author: Sensi
/// @remark:
///

class KeyboardCompleteController extends LifecycleChangeNotifier {
  bool _showComplete = true;

  bool get showComplete => _showComplete;

  set showComplete(bool value) {
    if (_showComplete != value) {
      _showComplete = value;
      notifyListeners();
    }
  }
}
