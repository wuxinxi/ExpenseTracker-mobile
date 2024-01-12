import 'package:app_component/app_component.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

///
/// @date: 2023/7/16 10:54
/// @author: Sensi
/// @remark:
///
const double _kTabHeight = 46.0;
const double _kTextAndIconTabHeight = 72.0;

class AppActionTabBar extends StatelessWidget implements PreferredSizeWidget {
  final List<Widget> tabs;
  final bool isScrollable;
  final TabController? controller;
  final EdgeInsetsGeometry? padding;
  final Color? indicatorColor;
  final double indicatorWeight;
  final EdgeInsetsGeometry indicatorPadding;
  final Decoration? indicator;
  final bool automaticIndicatorColorAdjustment;
  final TabBarIndicatorSize? indicatorSize;
  final Color? dividerColor;
  final Color? labelColor;
  final Color? unselectedLabelColor;
  final EdgeInsetsGeometry? labelPadding;
  final TextStyle? labelStyle;
  final TextStyle? unselectedLabelStyle;
  final ValueChanged<int>? onTap;
  final ScrollPhysics? physics;
  final InteractiveInkFeatureFactory? splashFactory;
  final BorderRadius? splashBorderRadius;
  final MaterialStateProperty<Color?>? overlayColor;

  final List<Widget>? actions;

  const AppActionTabBar({
    Key? key,
    required this.tabs,
    this.controller,
    this.isScrollable = false,
    this.padding,
    this.indicatorColor,
    this.automaticIndicatorColorAdjustment = true,
    this.indicatorWeight = 2.0,
    this.indicatorPadding = EdgeInsets.zero,
    this.indicator,
    this.indicatorSize,
    this.dividerColor,
    this.labelColor,
    this.labelStyle,
    this.labelPadding,
    this.unselectedLabelColor,
    this.unselectedLabelStyle,
    this.onTap,
    this.physics,
    this.splashFactory,
    this.splashBorderRadius,
    this.overlayColor,
    this.actions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(width: double.infinity),
      Center(
          child: TabBar(
        tabs: tabs,
        controller: controller,
        isScrollable: isScrollable,
        padding: padding,
        indicatorColor: indicatorColor,
        indicatorWeight: indicatorWeight,
        indicatorPadding: indicatorPadding,
        indicator: indicator,
        automaticIndicatorColorAdjustment: automaticIndicatorColorAdjustment,
        indicatorSize: indicatorSize,
        dividerColor: dividerColor,
        labelColor: labelColor,
        unselectedLabelColor: unselectedLabelColor,
        labelPadding: labelPadding,
        labelStyle: labelStyle,
        unselectedLabelStyle: unselectedLabelStyle,
        onTap: onTap,
        physics: physics,
        splashFactory: splashFactory,
        splashBorderRadius: splashBorderRadius,
        overlayColor: overlayColor,
      )),
      if (actions != null && actions!.isNotEmpty)
        Positioned(
          top: 0,
          bottom: 0,
          right: 0,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: Theme.of(context).useMaterial3 ? CrossAxisAlignment.start : CrossAxisAlignment.stretch,
            children: actions!,
          ),
        )
    ]);
  }

  @override
  Size get preferredSize {
    double maxHeight = _kTabHeight;
    for (final Widget item in tabs) {
      if (item is PreferredSizeWidget) {
        final double itemHeight = item.preferredSize.height;
        maxHeight = math.max(itemHeight, maxHeight);
      }
    }
    return Size.fromHeight(maxHeight + indicatorWeight);
  }
}
