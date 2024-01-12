import 'package:app_component/src/keyboard/strategy/input_strategy.dart';

///
/// @date: 2023/7/25 21:42
/// @author: Sensi
/// @remark: 
///

class DeleteStrategy extends InputStrategy{
  @override
  String processor(String currentValue) {
    String value = currentValue;
    if (value.length == 1) {
      return '0';
    }
    if (value.isNotEmpty && value != '0') {
      value = value.substring(0, value.length - 1);
    }
    return value;
  }
}