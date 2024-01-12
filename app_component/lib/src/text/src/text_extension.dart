import 'package:app_component/app_component.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'style/cera_pro_style.dart';
import '../text.dart';

///
/// @date: 2022/5/26 12:06
/// @author: Sensi
/// @remark:
///

CeraProStyle globalStyle = CeraProStyle();

extension TextExtension on String {
  Text text(
      {Key? key,
      int? maxLines,
      Color? fontColor,
      TextAlign? textAlign,
      TextOverflow? overflow,
      double? letterSpacing,
      double? height,
      AppTextStyle? textStyle,
      TextDecoration? decoration,
      double textScaleFactor = 1.0,
      TextTag tag = TextTag.h4MediumBody}) {
    final style = textStyle ?? globalStyle.map[tag] ?? globalStyle.defaultStyle();
    return Text(this,
        key: key,
        textScaleFactor: textScaleFactor,
        maxLines: maxLines,
        textAlign: textAlign,
        style: TextStyle(
          fontSize: style.fontSize,
          fontFamily: style.fontFamily,
          fontWeight: style.fontWeight,
          letterSpacing: letterSpacing ?? 0,
          height: height ?? 1,
          overflow: maxLines != null ? overflow ?? TextOverflow.ellipsis : overflow,
          decoration: decoration,
          color: fontColor ?? style.fontColor,
        ));
  }

  TextSpanCompat textSpanCompat(
      {int? maxLines,
      Color? fontColor,
      TextOverflow? overflow,
      VoidCallback? onPressed,
      double? letterSpacing,
      double? height,
      List<InlineSpan>? children,
      AppTextStyle? textStyle,
      TextTag tag = TextTag.h4MediumBody}) {
    final style = textStyle ?? globalStyle.map[tag] ?? globalStyle.defaultStyle();
    return TextSpanCompat(
        text: this,
        children: children,
        onPressed: onPressed,
        style: TextStyle(
          fontSize: style.fontSize,
          fontFamily: style.fontFamily,
          fontWeight: style.fontWeight,
          letterSpacing: letterSpacing ?? 0,
          height: height ?? 1,
          overflow: overflow,
          color: fontColor ?? style.fontColor,
        ));
  }

  TextSpan textSpan(
      {int? maxLines,
      Color? fontColor,
      TextOverflow? overflow,
      GestureRecognizer? recognizer,
      double? letterSpacing,
      double? height,
      List<InlineSpan>? children,
      AppTextStyle? textStyle,
      TextTag tag = TextTag.h4MediumBody}) {
    final style = textStyle ?? globalStyle.map[tag] ?? globalStyle.defaultStyle();
    return TextSpan(
        text: this,
        children: children,
        recognizer: recognizer,
        style: TextStyle(
          fontSize: style.fontSize,
          fontFamily: style.fontFamily,
          fontWeight: style.fontWeight,
          letterSpacing: letterSpacing ?? 0,
          height: height ?? 1,
          overflow: overflow,
          color: fontColor ?? style.fontColor,
        ));
  }

  TextButton textButton(
      {Key? key,
      required VoidCallback onPressed,
      int? maxLines,
      Color? fontColor,
      TextAlign? textAlign,
      TextOverflow? overflow,
      double? letterSpacing,
      double? height,
      AppTextStyle? textStyle,
      TextDecoration? decoration,
      double textScaleFactor = 1.0,
      TextTag tag = TextTag.h4MediumBody}) {
    return TextButton(
        onPressed: onPressed,
        child: text(
          key: key,
          maxLines: maxLines,
          fontColor: fontColor ?? textStyle?.fontColor,
          textAlign: textAlign,
          overflow: overflow,
          letterSpacing: letterSpacing,
          height: height,
          textStyle: textStyle,
          decoration: decoration,
          textScaleFactor: textScaleFactor,
          tag: tag,
        ));
  }
}
