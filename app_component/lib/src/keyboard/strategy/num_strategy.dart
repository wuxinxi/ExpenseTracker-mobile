import 'package:app_component/src/keyboard/function/state/input_state.dart';
import 'package:app_component/src/keyboard/strategy/input_strategy.dart';

///
/// @date: 2023/7/25 21:42
/// @author: Sensi
/// @remark:
///

class NumStrategy extends InputStrategy {
  final int input;

  NumStrategy(this.input);

  @override
  String processor(String currentValue) {
    String value = currentValue;
    if (value == '0' || value == '0.0' || value == '0.00') {
      return '$input';
    }
    if (currentValue.contains('.')) {
      final split = currentValue.split('.');
      if (split.length == 2 && split[1].length >= 2) {
        return value;
      }
    }

    if (currentValue.contains('.') && currentValue.length >= 9) {
      return value;
    }

    if (!currentValue.contains('.') && currentValue.length >= 6) {
      return value;
    }

    return '$value$input';
  }
}
