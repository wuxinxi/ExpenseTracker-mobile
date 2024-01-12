import 'package:flutter/material.dart';

///
/// @data: 2023/7/7 20:30
/// @author: Sensi
/// @remark:
///
class FillRemainingView extends StatelessWidget {
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? headerPadding;
  final Widget? child;
  final bool hasScrollBody;
  final bool fillOverscroll;

  const FillRemainingView({
    Key? key,
    this.margin,
    this.headerPadding,
    this.hasScrollBody = true,
    this.fillOverscroll = false,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: CustomScrollView(
        physics: const ClampingScrollPhysics(),
        slivers: [
          if (headerPadding != null) SliverPadding(padding: headerPadding!),
          SliverFillRemaining(
            hasScrollBody: hasScrollBody,
            fillOverscroll: fillOverscroll,
            child: child,
          )
        ],
      ),
    );
  }
}
