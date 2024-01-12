import 'package:app_component/app_component.dart';
import 'package:flutter/material.dart';

///
/// @date: 2022/5/27 11:39
/// @author: Sensi
/// @remark:
///
class CommonButton extends StatelessWidget {
  final String text;
  final TextTag? tag;
  final Color? textColor;
  final Color? backgroundColor;
  final Color? disableTextColor;
  final Color? disableBackgroundColor;
  final Color? overlayColor;
  final EdgeInsetsGeometry? margin;
  final double? width;
  final double? height;
  final Future Function()? onAsyncPressed;
  final VoidCallback? onPressed;

  final Widget? child;
  final ButtonStyle? style;
  final BorderSide? side;
  final Gradient? gradient;
  final MaterialStateProperty<double?>? elevation;
  final BorderRadiusGeometry? borderRadius;

  final Map<String, String> Function()? params;
  final String? eventName;
  final String? loadingText;

  const CommonButton({
    Key? key,
    required this.text,
    this.onPressed,
    this.onAsyncPressed,
    this.child,
    this.style,
    this.disableTextColor,
    this.textColor,
    this.tag,
    this.backgroundColor,
    this.disableBackgroundColor,
    this.overlayColor,
    this.margin,
    this.width,
    this.height,
    this.side,
    this.gradient,
    this.elevation,
    this.borderRadius,
    this.params,
    this.eventName,
    this.loadingText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final defaultHeight = 45.h;
    return Container(
      height: height ?? defaultHeight,
      width: width == 0 ? null : width ?? double.infinity,
      margin: margin,
      decoration: BoxDecoration(
          gradient: gradient, borderRadius: borderRadius ?? BorderRadius.circular((height ?? defaultHeight) / 2)),
      child: ElevatedButton(
          style: style ??
              ButtonStyle(
                  textStyle: MaterialStateProperty.all<TextStyle>(
                    const TextStyle(letterSpacing: 0.18),
                  ),
                  elevation: elevation ?? MaterialStateProperty.all(0),
                  backgroundColor: MaterialStateColor.resolveWith((states) {
                    if (states.contains(MaterialState.disabled)) {
                      return disableBackgroundColor ?? const Color.fromRGBO(252, 252, 252, .5);
                    }
                    return gradient == null
                        ? (backgroundColor ?? const Color.fromRGBO(252, 252, 252, .6))
                        : Colors.transparent;
                  }),
                  foregroundColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
                    if (states.contains(MaterialState.disabled)) {
                      return disableTextColor ?? Theme.of(context).primaryColor.withOpacity(.5);
                    }
                    return textColor ?? Theme.of(context).primaryColor;
                  }),
                  overlayColor: MaterialStateProperty.all(overlayColor ?? Colors.grey.shade200),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      side: side ?? BorderSide.none,
                      borderRadius: BorderRadius.circular((height ?? defaultHeight) / 2)))),
          onPressed: _onPressed(),
          child: child ?? _buttonText(context, _onPressed() == null)),
    );
  }

  VoidCallback? _onPressed() {
    if (onAsyncPressed != null) {
      return () async => await onAsyncPressed?.call();
    }

    if (onPressed != null) {
      return () => onPressed?.call();
    }
    return null;
  }

  _buttonText(BuildContext context, bool disable) {
    return text.text(
        fontColor: (disable ? disableTextColor ?? textColor : textColor) ?? Theme.of(context).primaryColor,
        tag: tag ?? TextTag.h3Emphasise,
        textAlign: TextAlign.center);
  }
}
