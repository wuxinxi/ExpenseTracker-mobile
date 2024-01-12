import 'package:app_component/app_component.dart';
import 'package:flutter/material.dart';

import '../../../common/common.dart';
import 'app_font_weight.dart';

///
/// @date: 2022/12/9 16:45
/// @author: Sensi
/// @remark:
///

class AppTextStyle {
  final String fontFamily;
  final FontWeight fontWeight;
  double _fontSize = 0;
  final Color fontColor;

  double get fontSize => _fontSize;

  AppTextStyle(
      {required this.fontFamily,
      required this.fontWeight,
      required double fontSize,
      this.fontColor = const Color(0xFF4C4C4C)}) {
    _fontSize = fontSize.h;
  }

  ///Used when the UI design has no tag
  AppTextStyle.custom(
      {this.fontFamily = AppGlobalConfig.fontFamily,
      this.fontWeight = AppFontWeight.medium,
      required double fontSize,
      this.fontColor = const Color(0xFF4C4C4C)}) {
    _fontSize = fontSize;
  }

  AppTextStyle copyWith({
    String? fontFamily,
    FontWeight? fontWeight,
    double? fontSize,
    Color? fontColor,
  }) {
    return AppTextStyle(
      fontFamily: fontFamily ?? this.fontFamily,
      fontWeight: fontWeight ?? this.fontWeight,
      fontSize: fontSize ?? this.fontSize,
      fontColor: fontColor ?? this.fontColor,
    );
  }

  TextStyle get toTextStyle => TextStyle(fontSize: fontSize, fontFamily: fontFamily, fontWeight: fontWeight);
}
