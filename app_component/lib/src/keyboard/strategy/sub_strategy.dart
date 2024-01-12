import 'package:app_component/src/keyboard/strategy/input_strategy.dart';

import '../utils/utils.dart';

///
/// @date: 2023/7/25 21:42
/// @author: Sensi
/// @remark:
///

class SubStrategy extends InputStrategy {
  @override
  String processor(String currentValue) {
    String value = currentValue;
    if (value.isEmpty) {
      return value;
    }
    if (value.endsWith('+')) {
      return value.replaceAll('+', '-');
    }
    if (value.endsWith('-')) {
      return value;
    }
    if (value.contains('-') && double.tryParse(value) == null) {
      if (value.startsWith('-')) {
        if (value.contains('+')) {
          currentValue = currentValue.substring(1);
          final numList = currentValue.split('+');
          final res = -double.parse(numList[0]) + double.parse(numList[1]);
          return '${formatDouble(res)}-';
        }
        currentValue = currentValue.substring(1);
        final numList = currentValue.split('-');
        final res = -double.parse(numList[0]) - double.parse(numList[1]);
        return '${formatDouble(res)}-';
      }
      final numList = currentValue.split('-');
      final res = double.parse(numList[0]) - double.parse(numList[1]);
      return '${formatDouble(res)}-';
    }
    if (value.contains('+')) {
      final numList = currentValue.split('+');
      final res = double.parse(numList[0]) + double.parse(numList[1]);
      return '${formatDouble(res)}-';
    }
    return '$value-';
  }
}
