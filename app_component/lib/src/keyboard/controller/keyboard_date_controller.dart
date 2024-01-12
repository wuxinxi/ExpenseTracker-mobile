part of '../keyboard_date.dart';

///
/// @date: 2023/7/16 18:50
/// @author: Sensi
/// @remark:
///

class KeyboardDateController extends LifecycleChangeNotifier {
  late final String _defaultDate;
  late String _currentDate;

  String get currentDate => _currentDate;

  set currentDate(String value) {
    if (_currentDate != value) {
      _currentDate = value;
      notifyListeners();
    }
  }

  String get defaultDate => _defaultDate;

  KeyboardDateController()
      : _defaultDate = DateHelper.getDate(),
        _currentDate = DateHelper.getDate();
}
