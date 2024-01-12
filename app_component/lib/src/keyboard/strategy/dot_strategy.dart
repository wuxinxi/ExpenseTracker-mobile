import 'package:app_component/src/keyboard/strategy/input_strategy.dart';

///
/// @date: 2023/7/25 21:42
/// @author: Sensi
/// @remark: 
///

class DotStrategy extends InputStrategy{
  @override
  String processor(String currentValue) {
    String value = currentValue;
    if (value.isEmpty) {
      return '';
    }

    if (value.endsWith('.')) {
      return value;
    }

    if (value.length == 1) {
      return '$value.';
    }

    if (!value.contains('+') && !value.contains('-') && value.contains('.')) {
      return value;
    }

    if (value.contains('+') && value.endsWith('+')) {
      return value;
    }

    if (value.contains('-') && value.endsWith('-')) {
      return value;
    }

    String? symbol;
    if (value.contains('+')) {
      symbol = '+';
    } else if (value.contains('-')) {
      symbol = '-';
    }
    if (symbol != null) {
      final values = value.split(symbol);
      final endValue = values[1];
      if (endValue.contains('.')) {
        return value;
      }
    }
    return '$value.';
  }
}