import 'package:app_component/app_component.dart';
import 'package:flutter/material.dart';

///
/// @data: 2023/7/8 12:06
/// @author: Sensi
/// @remark:
///
class VerifyCodeButton extends StatefulWidget {
  final String text;
  final TextTag? tag;
  final int countdown;
  final double? height;
  final Future Function() onPressed;

  const VerifyCodeButton({
    Key? key,
    required this.text,
    required this.countdown,
    required this.onPressed,
    this.tag,
    this.height,
  }) : super(key: key);

  @override
  State<VerifyCodeButton> createState() => _VerifyCodeButtonState();
}

class _VerifyCodeButtonState extends LifecycleState<VerifyCodeButton> {
  double _width = 0;

  @override
  void readyListener() {
    setState(() => _width = context.size?.width ?? 0);
  }

  @override
  Widget build(BuildContext context) {
    return CommonButtonDelegate.borderAnimated(
      widget.text,
      countdown: widget.countdown,
      onPressed: widget.onPressed,
      width: _width,
      height: widget.height ?? 30.h,
      tag: widget.tag,
    );
  }
}
