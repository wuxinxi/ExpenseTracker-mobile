import 'package:app_component/app_component.dart';
import 'package:app_utils/app_utils.dart';
import 'package:flutter/material.dart';

part 'controller/keyboard_date_controller.dart';

///
/// @date: 2023/07/16 18:49
/// @author: LovelyCoder
/// @remark:
///

class KeyboardDate extends StatelessWidget {
  final KeyboardDateController controller;
  final VoidCallback? onPressed;

  const KeyboardDate({
    Key? key,
    required this.controller,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
        listenable: controller,
        builder: (context, child) {
          return KeyboardChild(
            onPressed: onPressed,
            value: controller.defaultDate == controller.currentDate ? '今日' : controller.currentDate,
            valueType: controller.defaultDate == controller.currentDate
                ? KeyboardChildType.today
                : KeyboardChildType.otherDate,
          );
        });
  }
}
