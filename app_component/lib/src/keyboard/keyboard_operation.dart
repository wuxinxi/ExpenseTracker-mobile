import 'package:flutter/material.dart';

import '../../app_component.dart';

///
/// @date: 2023/8/6 11:04
/// @author: Sensi
/// @remark:
///

class KeyboardOperation extends StatelessWidget {
  final ValueNotifier<String> operationController;
  final VoidCallback? onPressed;

  const KeyboardOperation({
    Key? key,
    required this.operationController,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
        listenable: operationController,
        builder: (context, child) {
          return KeyboardChild(
            onPressed: onPressed,
            value: operationController.value,
          );
        });
  }
}
