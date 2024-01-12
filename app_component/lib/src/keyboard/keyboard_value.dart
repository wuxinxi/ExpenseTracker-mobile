import 'package:app_component/app_component.dart';
import 'package:flutter/material.dart';

part 'controller/keyboard_value_controller.dart';

///
/// @date: 2023/07/16 21:14
/// @author: LovelyCoder
/// @remark:
///

class KeyboardValue extends StatelessWidget {
  final KeyboardValueController controller;

  const KeyboardValue({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
        listenable: controller,
        builder: (context, child) {
          return Container(
              alignment: Alignment.center,
              height: kKeyboardValueHeight,
              child: controller.value.text(textStyle: AppTextStyle.custom(fontSize: 35.sp)));
        });
  }
}
