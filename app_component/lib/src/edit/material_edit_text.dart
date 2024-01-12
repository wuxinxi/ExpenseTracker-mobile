import 'package:app_component/app_component.dart';
import 'package:flutter/material.dart';

///
/// @date: 2022/10/15 12:26
/// @author: Sensi
/// @remark:
///

enum InputType {
  password,
  plaintext,
  verify,
}

class MaterialEditText extends StatefulWidget {
  final String hint;
  final Color lineColor;
  final EdgeInsetsGeometry? contentMargin;
  final EdgeInsetsGeometry? margin;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final FocusNode? focusNode;
  final bool visible;
  final Color iconColor;
  final IconData leading;
  final InputType? inputType;
  final int maxLength;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final int? countdown;
  final String? countdownButtonLabel;
  final Future Function()? onCountdownPressed;

  const MaterialEditText({
    Key? key,
    required this.leading,
    required this.hint,
    this.lineColor = Colors.black12,
    this.margin,
    this.contentMargin,
    this.controller,
    this.onChanged,
    this.focusNode,
    this.visible = false,
    this.iconColor = Colors.black12,
    this.inputType = InputType.plaintext,
    this.maxLength = 50,
    this.keyboardType,
    this.textInputAction,
    this.countdown,
    this.countdownButtonLabel,
    this.onCountdownPressed,
  })  : assert(inputType != InputType.verify ||
            (countdownButtonLabel != null && onCountdownPressed != null && countdown != null)),
        super(key: key);

  @override
  State<MaterialEditText> createState() => _MaterialEditTextState();
}

class _MaterialEditTextState extends State<MaterialEditText> {
  bool _visible = true;
  late final TextEditingController _controller = widget.controller ?? TextEditingController();

  @override
  void initState() {
    _visible = widget.visible;
    super.initState();
  }

  @override
  void dispose() {
    if (widget.controller == null) {
      _controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: widget.margin,
        child: Stack(children: [
          TextField(
            keyboardType: widget.keyboardType,
            textInputAction: widget.textInputAction,
            obscureText: widget.inputType != InputType.password ? false : !_visible,
            onChanged: (value) {
              widget.onChanged?.call(value);
              if (widget.inputType == InputType.password && value.length <= 1) {
                setState(() {});
              }
            },
            focusNode: widget.focusNode,
            textAlign: TextAlign.start,
            maxLength: widget.maxLength,
            cursorColor: Theme.of(context).secondaryHeaderColor,
            cursorWidth: 1.w,
            style: TextTag.h4MediumBody
                .toTextStyle()
                .copyWith(letterSpacing: _letterSpacing(), color: Colors.black87.withOpacity(.8)),
            controller: _controller,
            enableInteractiveSelection: false,
            decoration: InputDecoration(
              errorText: null,
              errorStyle: TextTag.h5RegularRemarks.toTextStyle(),
              hintText: widget.hint,
              hintStyle: TextTag.h4MediumBody.toTextStyle().copyWith(color: Colors.black26),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: widget.lineColor),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Theme.of(context).secondaryHeaderColor),
              ),
              counterText: '',
              prefixIcon: Icon(widget.leading, color: widget.iconColor),
              suffixIcon: widget.inputType != InputType.password ? null : _suffixIcon(),
            ),
          ),
          if (widget.inputType == InputType.verify) _verifyButton(),
        ]));
  }

  double _letterSpacing() {
    final plain = widget.inputType != InputType.password;
    if (plain) return 0;
    if (_controller.text.isEmpty) return 0;
    return _visible ? 0 : 5.0;
  }

  Widget _suffixIcon() {
    return Padding(
        padding: EdgeInsets.only(right: 8.w),
        child: GestureDetector(
          onTap: () => setState(() => _visible = !_visible),
          child: SizedBox.square(
            dimension: 50.r,
            child: Icon(
              _visible ? Icons.visibility_outlined : Icons.visibility_off_outlined,
              color: Colors.grey.shade400,
            ),
          ),
        ));
  }

  Widget _verifyButton() {
    return Container(
        alignment: Alignment.center,
        margin: EdgeInsets.only(right: 10.w),
        child: VerifyCodeButton(
          onPressed: widget.onCountdownPressed!,
          tag: TextTag.h5RegularRemarks,
          text: widget.countdownButtonLabel ?? '',
          countdown: widget.countdown!,
        )).right();
  }
}
