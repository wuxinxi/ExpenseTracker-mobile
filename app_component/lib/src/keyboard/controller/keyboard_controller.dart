part of '../keyboard.dart';

///
/// @date: 2023/7/16 15:25
/// @author: Sensi
/// @remark:
///

class KeyboardController extends LifecycleChangeNotifier {
  late double _value;
  late String defaultDate;
  bool _visible = false;

  KeyboardController({double value = 0.00})
      : _value = value,
        defaultDate = DateHelper.getDateTime();

  double get value => _value;

  set value(double value) {
    _value = value;
    notifyListeners();
  }

  bool get visible => _visible;

  set visible(bool value) {
    if (_visible != value) {
      _visible = value;
      notifyListeners();
    }
  }
}
