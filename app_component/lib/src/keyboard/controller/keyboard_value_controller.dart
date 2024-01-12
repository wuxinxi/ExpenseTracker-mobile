part of '../keyboard_value.dart';

///
/// @date: 2023/7/16 21:15
/// @author: Sensi
/// @remark:
///

class KeyboardValueController extends LifecycleChangeNotifier {
  late String _value;

  String get value => _value;

  set value(String value) {
    if (this.value != value) {
      _value = value;
      notifyListeners();
    }
  }

  KeyboardValueController({String value = '0.00'}) : _value = value;

}
