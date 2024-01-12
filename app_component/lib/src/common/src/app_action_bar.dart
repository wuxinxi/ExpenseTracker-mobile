import 'package:app_common/app_common.dart';
import 'package:app_component/app_component.dart';
import 'package:flutter/material.dart';

///
/// @date: 2022/08/01 11:49
/// @author: Sensi
/// @remark:
///

class AppActionBar extends StatelessWidget implements PreferredSizeWidget {
  final double? toolbarHeight;
  final Widget? leading;
  final IconData? leadingIcon;
  final double? leadingWidth;
  final bool hideBack;

  final VoidCallback? onBackPressed;
  final List<Widget>? actions;
  final Widget? title;
  final String? titleText;
  final bool needCenterLogo;
  final double? logoImageWidth;
  final bool? centerTitle;
  final bool scaffoldFull;
  final BorderRadiusGeometry? borderRadius;
  final String? imagePath;
  final PreferredSizeWidget? bottom;

  const AppActionBar({
    Key? key,
    this.toolbarHeight,
    this.leading,
    this.leadingIcon,
    this.leadingWidth,
    this.hideBack = false,
    this.onBackPressed,
    this.title,
    this.titleText,
    this.needCenterLogo = false,
    this.logoImageWidth,
    this.centerTitle = true,
    this.actions,
    this.scaffoldFull = false,
    this.borderRadius,
    this.imagePath,
    this.bottom,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: _boxDecoration(),
        child: Stack(
          children: [
            imagePath != null
                ? ImageHelper.load(imagePath!, fit: BoxFit.fitWidth, width: ScreenUtil().screenWidth)
                : Container(),
            AppBar(
              toolbarHeight: toolbarHeight,
              automaticallyImplyLeading: false,
              backgroundColor: Colors.transparent,
              foregroundColor: Colors.transparent,
              shadowColor: Colors.transparent,
              leading: _leading(),
              leadingWidth: leadingWidth,
              centerTitle: centerTitle,
              title: _title(),
              actions: actions,
              bottom: bottom,
            )
          ],
        ));
  }

  Widget? _leading() {
    if (leading == null) {
      return hideBack
          ? null
          : IconButton(onPressed: onBackPressed, icon: Icon(leadingIcon ?? Icons.arrow_back_ios), color: Colors.white);
    }
    return leading;
  }

  Widget? _title() {
    if (titleText != null) {
      return titleText!.text(tag: TextTag.h3Emphasise, fontColor: Colors.white);
    }
    return title;
  }

  BoxDecoration? _boxDecoration() {
    return scaffoldFull
        ? null
        : BoxDecoration(
            borderRadius: borderRadius,
            gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [
              Theme.of(Application.context).primaryColor,
              Theme.of(Application.context).secondaryHeaderColor
            ]));
  }

  @override
  Size get preferredSize => _PreferredAppBarSize(toolbarHeight);
}

class _PreferredAppBarSize extends Size {
  _PreferredAppBarSize(this.toolbarHeight) : super.fromHeight((toolbarHeight ?? kToolbarHeight));

  final double? toolbarHeight;
}
