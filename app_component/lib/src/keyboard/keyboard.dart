import 'package:app_common/app_common.dart';
import 'package:app_component/app_component.dart';
import 'package:app_component/src/keyboard/keyboard_date.dart';
import 'package:app_component/src/keyboard/strategy/delete_strategy.dart';
import 'package:app_component/src/keyboard/strategy/dot_strategy.dart';
import 'package:app_component/src/keyboard/strategy/num_strategy.dart';
import 'package:app_utils/app_utils.dart';
import 'package:flutter/material.dart';

import 'keyboard_completed.dart';
import 'keyboard_operation.dart';
import 'keyboard_value.dart';
import 'strategy/add_strategy.dart';
import 'strategy/sub_strategy.dart';

part 'controller/keyboard_controller.dart';

part 'keyboard_child.dart';

part 'keyboard_content.dart';

///
/// @date: 2023/07/16 15:20
/// @author: LovelyCoder
/// @remark:
///

final kKeyboardHeight = 300.h;
final kKeyboardValueHeight = 60.h;

class Keyboard extends StatefulWidget {
  final KeyboardController controller;
  final Function(double)? onChange;
  final VoidCallback? onFirst;
  final VoidCallback? onSecond;
  final ValueNotifier<String> firstOperationController;
  final ValueNotifier<String> secondOperationController;
  final VoidCallback? onDay;

  const Keyboard({
    Key? key,
    required this.controller,
    this.onChange,
    this.onFirst,
    this.onSecond,
    required this.firstOperationController,
    required this.secondOperationController,
    this.onDay,
  }) : super(key: key);

  @override
  State<Keyboard> createState() => _KeyboardState();
}

class _KeyboardState extends LifecycleState<Keyboard> {
  late final KeyboardDateController _keyboardDateController = KeyboardDateController();
  late final KeyboardCompleteController _keyboardCompleteController = KeyboardCompleteController();
  late final KeyboardValueController _keyboardValueController = KeyboardValueController();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.themeColor.whiteColor,
      height: kKeyboardHeight,
      child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
        KeyboardValue(controller: _keyboardValueController),
        KeyboardContent(
          keyboardDateController: _keyboardDateController,
          keyboardCompleteController: _keyboardCompleteController,
          onNum: (value) {
            final currentValue = _keyboardValueController.value;
            _keyboardValueController.value = NumStrategy(value).processor(currentValue);
          },
          onDelete: () {
            final currentValue = _keyboardValueController.value;
            _keyboardValueController.value = DeleteStrategy().processor(currentValue);
          },
          onDot: () {
            final currentValue = _keyboardValueController.value;
            _keyboardValueController.value = DotStrategy().processor(currentValue);
          },
          onDay: widget.onDay,
          onCompleted: () {
            widget.onChange?.call(double.tryParse(_keyboardValueController.value) ?? 0.0);
          },
          onEqual: () {},
          onFirst: widget.onFirst,
          onSecond: widget.onSecond,
          firstOperationController: widget.firstOperationController,
          secondOperationController: widget.secondOperationController,
        ),
      ]),
    );
  }
}

enum _KeyboardValueType {
  num,
  today,
  complete,
  delete,
}

class _KeyboardValue extends StatelessWidget {
  final _KeyboardValueType valueType;
  final String value;
  final VoidCallback? onPressed;

  const _KeyboardValue({
    Key? key,
    required this.value,
    this.valueType = _KeyboardValueType.num,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget child = switch (valueType) {
      _KeyboardValueType.today =>
        IconLabel(direction: Axis.horizontal, icon: const Icon(Icons.calendar_month), label: value, space: 3),
      _KeyboardValueType.complete => Container(
          color: context.themeColor.primaryColor,
          alignment: Alignment.center,
          child: value.text(tag: TextTag.h3Medium, fontColor: context.themeColor.whiteColor)),
      _KeyboardValueType.delete => const Icon(Icons.backspace_outlined),
      _ => value.text(tag: TextTag.h3Medium),
    };
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: kKeyboardValueHeight,
        alignment: Alignment.center,
        child: child,
      ),
    );
  }
}
