import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_action_bar.dart';

///
/// @date: 2022/08/01 11:27
/// @author: Sensi
/// @remark:
///

const double kToolbarMaxHeight = kToolbarHeight + 15;

class AppScaffold extends StatelessWidget {
  final PreferredSizeWidget? appBar;

  final double? toolbarHeight;
  final bool hideBack;
  final bool hideAppbar;
  final Widget? leading;
  final IconData? leadingIcon;
  final double? leadingWidth;
  final VoidCallback? onBackPressed;
  final Function? onBackListener;
  final List<Widget>? actions;
  final Widget? title;
  final String? titleText;
  final bool needCenterLogo;
  final double? logoImageWidth;
  final bool? centerTitle;
  final bool extendBody;

  final Widget? bottomNavigationBar;
  final BorderRadiusGeometry? appBarBorderRadius;
  final bool enableAppBarRadius;
  final String? appBarBackgroundImagePath;

  final Widget? body;
  final bool full;
  final bool dismissKeyboardOnTouch;
  final Widget? floatingActionButton;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  final FloatingActionButtonAnimator? floatingActionButtonAnimator;

  final bool? resizeToAvoidBottomInset;

  const AppScaffold({
    Key? key,
    this.full = false,
    this.hideBack = false,
    this.hideAppbar = false,
    this.appBar,
    this.toolbarHeight,
    this.leading,
    this.leadingIcon,
    this.leadingWidth,
    this.onBackPressed,
    this.onBackListener,
    this.title,
    this.needCenterLogo = false,
    this.logoImageWidth,
    this.titleText,
    this.centerTitle = true,
    this.extendBody = false,
    this.bottomNavigationBar,
    this.appBarBorderRadius,
    this.enableAppBarRadius = false,
    this.appBarBackgroundImagePath,
    this.actions,
    this.body,
    this.dismissKeyboardOnTouch = false,
    this.resizeToAvoidBottomInset = false,
    this.floatingActionButton,
    this.floatingActionButtonAnimator,
    this.floatingActionButtonLocation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Colors.white,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
      child: GradientBackground(
        colors: _colors(context),
        child: Scaffold(
          floatingActionButton: floatingActionButton,
          floatingActionButtonAnimator: floatingActionButtonAnimator,
          floatingActionButtonLocation: floatingActionButtonLocation,
          extendBody: extendBody,
          backgroundColor: _backgroundColor(),
          appBar: _appbar(context),
          body: _body(),
          bottomNavigationBar: bottomNavigationBar,
          resizeToAvoidBottomInset: resizeToAvoidBottomInset,
        ),
      ),
    );
  }

  Widget? _body() {
    if (dismissKeyboardOnTouch) {
      return GestureDetector(child: body, onTap: () => FocusManager.instance.primaryFocus?.unfocus());
    }
    return body;
  }

  PreferredSizeWidget? _appbar(BuildContext context) {
    if (appBar == null && !hideAppbar) {
      return AppActionBar(
        toolbarHeight: enableAppBarRadius ? kToolbarHeight + 15.h : toolbarHeight,
        leading: leading,
        leadingIcon: leadingIcon,
        leadingWidth: leadingWidth,
        hideBack: hideBack,
        onBackPressed: onBackPressed ??
            () {
              onBackListener?.call();
              Navigator.maybePop(context);
            },
        title: title,
        needCenterLogo: needCenterLogo,
        logoImageWidth: logoImageWidth,
        titleText: titleText,
        centerTitle: centerTitle,
        actions: actions,
        scaffoldFull: full,
        borderRadius: enableAppBarRadius ? appBarBorderRadius ?? _defaultRadius() : null,
        imagePath: appBarBackgroundImagePath,
      );
    }
    return appBar;
  }

  List<Color>? _colors(BuildContext context) {
    return full ? [Theme.of(context).primaryColor, Theme.of(context).secondaryHeaderColor] : null;
  }

  Color? _backgroundColor() {
    return full ? Colors.transparent : null;
  }

  BorderRadiusGeometry _defaultRadius() {
    return BorderRadius.only(
      bottomLeft: Radius.circular(12.r),
      bottomRight: Radius.circular(12.r),
    );
  }
}

class GradientBackground extends StatelessWidget {
  final Widget child;
  final List<Color>? colors;

  const GradientBackground({Key? key, required this.child, this.colors}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: _boxDecoration(),
      child: child,
    );
  }

  BoxDecoration? _boxDecoration() {
    return colors != null
        ? BoxDecoration(
            gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: colors!))
        : null;
  }
}
