import 'package:app_component/app_component.dart';
import 'package:flutter/material.dart';

///
/// @date: 2023/7/15 13:50
/// @author: Sensi
/// @remark:
///

class IconLabel extends StatelessWidget {
  final Widget icon;
  final String label;
  final AppTextStyle? textStyle;
  final VoidCallback? onPressed;
  final double space;
  final Axis direction;

  const IconLabel({
    Key? key,
    required this.icon,
    required this.label,
    this.textStyle,
    this.onPressed,
    this.space = 7,
    this.direction = Axis.vertical,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final placeholder = switch (direction) {
      Axis.vertical => SizedBox(height: space),
      Axis.horizontal => SizedBox(width: space),
    };
    final s = SizedBox(height: space);
    return GestureDetector(
      onTap: onPressed,
      child: Flex(
          direction: direction,
          mainAxisAlignment: direction == Axis.vertical ? MainAxisAlignment.spaceBetween : MainAxisAlignment.center,
          children: [icon, placeholder, label.text(textStyle: textStyle)]),
    );
  }
}
