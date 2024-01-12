import 'package:app_common/app_common.dart';
import 'package:app_component/app_component.dart';
import 'package:flutter/material.dart';

///
/// @data: 2023/7/7 13:57
/// @author: Sensi
/// @remark:
///

Color get primaryColor => const Color(0xFF57C88C);

Color get secondPrimaryColor => const Color(0xFF57C89F);

Color get primaryColorLight => const Color(0xFFA7E1C2);

Color get primaryColorDark => const Color(0xFF304A36);

Color get error => const Color(0xFFED0047);

ThemeData get appTheme => ThemeData(
        primaryColor: primaryColor,
        secondaryHeaderColor: secondPrimaryColor,
        primaryColorLight: primaryColorLight,
        primaryColorDark: primaryColorDark,
        useMaterial3: true,
        appBarTheme: _appBarTheme,
        checkboxTheme: _checkboxTheme,
        textButtonTheme: _textButtonTheme,
        progressIndicatorTheme: _progressIndicatorTheme,
        bottomNavigationBarTheme: _bottomNavigationBarThemeData,
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        extensions: [
          ColorTheme(
            primaryColor: primaryColor,
            secondPrimaryColor: secondPrimaryColor,
            greyColor: Colors.black38,
            secondGreyColor: const Color(0xFFB4B4B4),
            blackColor: const Color(0xFF4C4C4C),
            whiteColor: const Color(0xFFFCFCFC),
          )
        ]);

AppBarTheme get _appBarTheme => AppBarTheme(
    color: primaryColor,
    shadowColor: Colors.transparent,
    scrolledUnderElevation: 0.0,
    titleTextStyle: TextTag.h3Emphasise.toTextStyle().copyWith(color: Colors.white),
    iconTheme: const IconThemeData(color: Colors.white));

CheckboxThemeData get _checkboxTheme =>
    CheckboxThemeData(shape: const CircleBorder(), fillColor: MaterialStateProperty.all(primaryColor));

TextButtonThemeData get _textButtonTheme =>
    TextButtonThemeData(style: ButtonStyle(overlayColor: MaterialStateProperty.all(Colors.transparent)));

ProgressIndicatorThemeData get _progressIndicatorTheme => ProgressIndicatorThemeData(color: primaryColor);

BottomNavigationBarThemeData get _bottomNavigationBarThemeData => BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed, backgroundColor: Colors.white, selectedItemColor: primaryColor);
