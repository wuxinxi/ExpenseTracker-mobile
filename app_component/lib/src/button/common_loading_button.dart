import 'dart:async';

import 'package:app_component/app_component.dart';
import 'package:flutter/material.dart';

///
/// @date: 2022/12/1 14:22
/// @author: Sensi
/// @remark:
///
enum ButtonState { normal, disable, loading }

class CommonLoadingButton extends StatefulWidget {
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
  final Future Function()? onPressed;
  final ButtonState initState;
  final Widget? child;
  final Widget? loadingChild;
  final ButtonStyle? style;
  final BorderSide? side;
  final Gradient? gradient;
  final MaterialStateProperty<double?>? elevation;
  final BorderRadiusGeometry? borderRadius;

  final bool isPrimary;

  final Map<String, String> Function()? params;
  final String? eventName;
  final String? loadingText;
  final Color? loadingTextColor;

  final int? countdown;

  const CommonLoadingButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.initState = ButtonState.normal,
    this.child,
    this.loadingChild,
    this.style,
    this.tag,
    this.disableTextColor,
    this.textColor,
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
    this.isPrimary = true,
    this.eventName,
    this.params,
    this.loadingText,
    this.loadingTextColor,
    this.countdown,
  }) : super(key: key);

  @override
  State<CommonLoadingButton> createState() => _CommonLoadingButtonCompatState();
}

class _CommonLoadingButtonCompatState extends LifecycleState<CommonLoadingButton> with SingleTickerProviderStateMixin {
  late ButtonState _curState;
  late final AnimationController _repeatController;
  Timer? _countdownTimer;
  late String _text = widget.text;

  String get text => _text;

  set text(String value) {
    if (_text != value) {
      _text = value;
      rebuild();
    }
  }

  set curState(ButtonState value) {
    if (value != _curState && mounted) {
      if (mounted) {
        setState(() => _curState = value);
      }
    }
    if (value == ButtonState.loading && !_repeatController.isAnimating) {
      _repeatController.repeat();
    }

    if (value != ButtonState.loading && _repeatController.isAnimating) {
      _repeatController.stop();
    }
  }

  @override
  void initState() {
    super.initState();
    _curState = widget.initState;
    _repeatController = AnimationController(duration: const Duration(milliseconds: 1200), vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return CommonButton(
        text: widget.text,
        child: _child(),
        style: widget.style,
        tag: widget.tag,
        disableTextColor: widget.disableTextColor,
        textColor: widget.textColor,
        backgroundColor: widget.backgroundColor,
        disableBackgroundColor: widget.disableBackgroundColor,
        overlayColor: widget.overlayColor,
        margin: widget.margin,
        width: widget.width,
        height: widget.height,
        side: _side(),
        gradient: widget.gradient,
        elevation: widget.elevation,
        borderRadius: widget.borderRadius,
        params: widget.params,
        eventName: widget.eventName,
        loadingText: widget.loadingText,
        onAsyncPressed: _disable ? null : () async => await _asyncListener());
  }

  Future _asyncListener() async {
    return widget.countdown != null ? await _countdownAsyncListener() : _defaultAsyncListener();
  }

  Future _defaultAsyncListener() async {
    try {
      curState = ButtonState.loading;
      await widget.onPressed!.call();
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      curState = ButtonState.normal;
    }
  }

  Future _countdownAsyncListener() async {
    try {
      curState = ButtonState.loading;
      await widget.onPressed!.call();
      curState = ButtonState.disable;

      int countdown = widget.countdown!;
      text = text = '$countdown s';

      /// countdown timer rest
      _countdownTimer?.cancel();
      _countdownTimer = null;
      _countdownTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
        if (countdown > 1) {
          countdown--;
          text = '$countdown s';
        } else {
          curState = ButtonState.normal;
          _countdownTimer?.cancel();
          text = widget.text;
        }
      });
    } catch (e) {
      debugPrint(e.toString());
      curState = ButtonState.normal;
    }
  }

  bool get _disable => _curState == ButtonState.disable || widget.onPressed == null || _curState == ButtonState.loading;

  _child() {
    return _curState == ButtonState.loading
        ? _AnimationChild(
            isPrimary: widget.isPrimary,
            turns: _repeatController,
            textWidget: widget.loadingText == null
                ? Container()
                : Container(
                    padding: EdgeInsets.only(right: 10.w),
                    child: widget.loadingText!.text(
                        fontColor: (widget.loadingTextColor ?? widget.textColor) ?? Theme.of(context).primaryColor)))
        : _TextChild(
            text: _text,
            disable: _disable,
            tag: widget.tag,
            textColor: widget.textColor,
            disableTextColor: widget.disableTextColor,
            child: widget.child,
          );
  }

  BorderSide? _side() {
    final disable = _curState != ButtonState.normal;
    if (disable && widget.side != null) {
      return widget.side!.copyWith(color: Colors.black12);
    }
    return widget.side;
  }

  @override
  void dispose() {
    _repeatController.dispose();
    _countdownTimer?.cancel();
    super.dispose();
  }
}

class _AnimationChild extends StatelessWidget {
  final Animation<double> turns;
  final bool isPrimary;
  final Widget textWidget;

  const _AnimationChild({Key? key, required this.turns, required this.isPrimary, required this.textWidget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        textWidget,
        RotationTransition(
            alignment: Alignment.center,
            turns: turns,
            child: ImageHelper.load('assets/images/icon_loading_white.svg',
                package: 'app_component', color: isPrimary ? null : Theme.of(context).primaryColor, size: 24.r)),
      ],
    );
  }
}

class _TextChild extends StatelessWidget {
  final String text;
  final Widget? child;
  final TextTag? tag;
  final Color? textColor;
  final Color? disableTextColor;
  final bool disable;

  const _TextChild({
    Key? key,
    required this.text,
    required this.disable,
    this.child,
    this.tag,
    this.textColor,
    this.disableTextColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return child ??
        text.text(
          fontColor: (disable ? disableTextColor ?? textColor : textColor) ?? Theme.of(context).primaryColor,
          tag: tag ?? TextTag.h3Emphasise,
          textAlign: TextAlign.center,
        );
  }
}
