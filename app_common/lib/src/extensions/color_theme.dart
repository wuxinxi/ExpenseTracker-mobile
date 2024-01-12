import 'package:flutter/material.dart';

///
/// @date: 2023/7/15 20:48
/// @author: Sensi
/// @remark:
///

extension ColorThemeConExtension on BuildContext {
  ColorTheme get themeColor {
    return Theme.of(this).extension<ColorTheme>()!;
  }
}

class ColorTheme extends ThemeExtension<ColorTheme> {
  final Color primaryColor;
  final Color secondPrimaryColor;
  final Color greyColor;
  final Color secondGreyColor;
  final Color blackColor;
  final Color whiteColor;

  ColorTheme({
    required this.primaryColor,
    required this.secondPrimaryColor,
    required this.greyColor,
    required this.secondGreyColor,
    required this.blackColor,
    required this.whiteColor,
  });

  @override
  ColorTheme copyWith({
    Color? primaryColor,
    Color? secondPrimaryColor,
    Color? greyColor,
    Color? secondGreyColor,
    Color? blackColor,
    Color? whiteColor,
  }) {
    return ColorTheme(
      primaryColor: primaryColor ?? this.primaryColor,
      secondPrimaryColor: secondPrimaryColor ?? this.secondPrimaryColor,
      greyColor: greyColor ?? this.greyColor,
      secondGreyColor: secondGreyColor ?? this.secondGreyColor,
      blackColor: blackColor ?? this.blackColor,
      whiteColor: whiteColor ?? this.whiteColor,
    );
  }

  @override
  ThemeExtension<ColorTheme> lerp(covariant ThemeExtension<ColorTheme>? other, double t) {
    if (other is! ColorTheme) return this;
    return ColorTheme(
      primaryColor: primaryColor,
      secondPrimaryColor: secondPrimaryColor,
      greyColor: greyColor,
      secondGreyColor: secondGreyColor,
      blackColor: blackColor,
      whiteColor: whiteColor,
    );
  }
}
