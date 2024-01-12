import 'dart:math';

import 'package:flutter/material.dart';

///
/// @date: 2022/11/4 14:47
/// @author: Sensi
/// @remark:
///

class SliverHeaderSliverDelegate extends SliverPersistentHeaderDelegate {
  final double? minHeight;
  final double maxHeight;
  final Widget child;

  SliverHeaderSliverDelegate({
    this.minHeight,
    required this.maxHeight,
    required this.child,
  });

  @override
  double get minExtent => minHeight ?? maxHeight;

  @override
  double get maxExtent => max(maxHeight, minHeight ?? maxHeight);

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(SliverHeaderSliverDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight || minHeight != oldDelegate.minHeight || child != oldDelegate.child;
  }
}
