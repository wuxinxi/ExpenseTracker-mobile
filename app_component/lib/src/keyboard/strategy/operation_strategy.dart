import 'package:app_component/src/keyboard/strategy/input_strategy.dart';

import '../keyboard_completed.dart';

///
/// @date: 2023/7/26 20:38
/// @author: Sensi
/// @remark:
///
RegExp _regex = RegExp(r'^-?\d+(\.\d+)?[+-]\d+(\.\d+)?$');
class OperationStrategy extends InputStrategy {
  final KeyboardCompleteController controller;

  OperationStrategy(this.controller);

  @override
  String processor(String currentValue) {
    if(_regex.hasMatch(currentValue)){
      controller.showComplete = false;
    }else{
      controller.showComplete = true;
    }


    return currentValue;
  }
}
