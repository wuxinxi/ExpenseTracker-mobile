import 'package:flutter/material.dart';

import '../../text.dart';

///
/// @date: 2022/12/9 17:00
/// @author: Sensi
/// @remark:
///

enum TextTag {
  h0Emphasise,
  h0Medium,
  h1Emphasise,
  h1Medium,
  h2Emphasise,
  h2Title,
  h2Medium,
  h2Regular,
  h3Emphasise,
  h3Medium,
  h3Regular,
  h4MediumBody,
  h4Regular,
  h5RegularRemarks,
}

extension TextTagExtension on TextTag {
  TextStyle toTextStyle() {
    final appTextStyle = globalStyle.map[this] ?? globalStyle.defaultStyle();
    return TextStyle(
        fontSize: appTextStyle.fontSize, fontWeight: appTextStyle.fontWeight, fontFamily: appTextStyle.fontFamily);
  }

  AppTextStyle toAppTextStyle() {
    final appTextStyle = globalStyle.map[this] ?? globalStyle.defaultStyle();
    return AppTextStyle(
        fontSize: appTextStyle.fontSize, fontWeight: appTextStyle.fontWeight, fontFamily: appTextStyle.fontFamily);
  }
}
