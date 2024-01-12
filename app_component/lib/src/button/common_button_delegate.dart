import 'package:app_common/app_common.dart';
import 'package:app_component/app_component.dart';
import 'package:flutter/material.dart';

///
/// @date: 2022/9/13 14:01
/// @author: Sensi
/// @remark:
///

class CommonButtonDelegate {
  static CommonButton light(
    String text, {
    TextTag? tag,
    double? width,
    double? height,
    VoidCallback? onPressed,
    EdgeInsetsGeometry? margin,
    BorderRadiusGeometry? borderRadius,
    Map<String, String> Function()? params,
    String? eventName,
  }) {
    return CommonButton(
      text: text,
      tag: tag,
      width: width,
      height: height,
      onPressed: onPressed,
      margin: margin,
      borderRadius: borderRadius,
      textColor: Theme.of(Application.context).primaryColor,
      disableTextColor: Theme.of(Application.context).primaryColor.withOpacity(.5),
      params: params,
      eventName: eventName,
    );
  }

  static CommonButton primary(
    String text, {
    TextTag? tag,
    double? width,
    double? height,
    VoidCallback? onPressed,
    EdgeInsetsGeometry? margin,
    BorderRadiusGeometry? borderRadius,
    Map<String, String> Function()? params,
    String? eventName,
  }) {
    return CommonButton(
      text: text,
      tag: tag,
      gradient: LinearGradient(
          colors: [Theme.of(Application.context).primaryColor, Theme.of(Application.context).secondaryHeaderColor]),
      overlayColor: Colors.white10,
      textColor: Colors.white,
      disableTextColor: Colors.white.withOpacity(.5),
      width: width,
      height: height,
      onPressed: onPressed,
      margin: margin,
      borderRadius: borderRadius,
      params: params,
      eventName: eventName,
    );
  }

  static CommonButton border(
    String text, {
    TextTag? tag,
    double? width,
    double? height,
    VoidCallback? onPressed,
    EdgeInsetsGeometry? margin,
    Color? borderColor,
    Map<String, String> Function()? params,
    String? eventName,
    Color? textColor,
  }) {
    return CommonButton(
      text: text,
      tag: tag,
      side: BorderSide(color: borderColor ?? Theme.of(Application.context).primaryColor.withOpacity(.5)),
      width: width,
      height: height,
      onPressed: onPressed,
      margin: margin,
      params: params,
      eventName: eventName,
      textColor: textColor,
    );
  }

  static Widget borderAnimated(
    String text, {
    TextTag? tag,
    double? width,
    double? height,
    required Future Function()? onPressed,
    ButtonState initState = ButtonState.normal,
    EdgeInsetsGeometry? margin,
    Color? borderColor,
    BorderRadiusGeometry? borderRadius,
    Map<String, String> Function()? params,
    String? eventName,
    int? countdown,
  }) {
    return CommonLoadingButton(
      text: text,
      tag: tag,
      side: BorderSide(color: borderColor ?? Theme.of(Application.context).primaryColor.withOpacity(.5)),
      width: width,
      height: height,
      onPressed: onPressed,
      initState: initState,
      margin: margin,
      borderRadius: borderRadius,
      isPrimary: false,
      textColor: Theme.of(Application.context).primaryColor,
      disableTextColor: Theme.of(Application.context).primaryColor.withOpacity(.5),
      params: params,
      eventName: eventName,
      countdown: countdown,
    );
  }

  static Widget lightAnimated(
    String text, {
    TextTag? tag,
    double? width,
    double? height,
    required Future Function()? onPressed,
    ButtonState initState = ButtonState.normal,
    EdgeInsetsGeometry? margin,
    BorderRadiusGeometry? borderRadius,
    Map<String, String> Function()? params,
    String? eventName,
  }) {
    return CommonLoadingButton(
      text: text,
      tag: tag,
      width: width,
      height: height,
      onPressed: onPressed,
      initState: initState,
      margin: margin,
      borderRadius: borderRadius,
      isPrimary: false,
      textColor: Theme.of(Application.context).primaryColor,
      disableTextColor: Theme.of(Application.context).primaryColor.withOpacity(.5),
      params: params,
      eventName: eventName,
    );
  }

  static Widget primaryAnimated(
    String text, {
    TextTag? tag,
    double? width,
    double? height,
    double? fontSize,
    required Future Function()? onPressed,
    ButtonState initState = ButtonState.normal,
    EdgeInsetsGeometry? margin,
    BorderRadiusGeometry? borderRadius,
    Map<String, String> Function()? params,
    String? eventName,
    String? loadingText,
    Color? loadingTextColor,
  }) {
    return CommonLoadingButton(
      text: text,
      tag: tag,
      gradient: LinearGradient(
          colors: [Theme.of(Application.context).primaryColor, Theme.of(Application.context).secondaryHeaderColor]),
      overlayColor: Colors.white10,
      textColor: Colors.white,
      disableTextColor: Colors.white.withOpacity(.5),
      width: width,
      height: height,
      onPressed: onPressed,
      initState: initState,
      margin: margin,
      borderRadius: borderRadius,
      isPrimary: true,
      params: params,
      eventName: eventName,
      loadingText: loadingText,
      loadingTextColor: loadingTextColor,
    );
  }
}
