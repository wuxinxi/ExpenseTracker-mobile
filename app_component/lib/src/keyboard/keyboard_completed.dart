import 'package:flutter/material.dart';

import '../../app_component.dart';

part 'controller/keyboard_complete_controller.dart';

///
/// @date: 2023/7/16 19:09
/// @author: Sensi
/// @remark:
///

class KeyboardCompleted extends StatelessWidget {
  final KeyboardCompleteController keyboardCompleteController;
  final VoidCallback? onCompleted;
  final VoidCallback? onEqual;

  const KeyboardCompleted({
    Key? key,
    required this.keyboardCompleteController,
    this.onCompleted,
    this.onEqual,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
        listenable: keyboardCompleteController,
        builder: (context, child) {
          final value = keyboardCompleteController.showComplete ? '完成' : '=';
          return KeyboardChild(
              value: value,
              valueType: KeyboardChildType.complete,
              onPressed: keyboardCompleteController.showComplete ? onCompleted : onEqual);
        });
  }
}
