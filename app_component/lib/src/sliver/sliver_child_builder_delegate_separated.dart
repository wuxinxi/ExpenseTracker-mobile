import 'dart:math';

import 'package:flutter/material.dart';

///
/// @date: 2022/10/21 12:07
/// @author: Sensi
/// @remark:
///

class SliverChildBuilderDelegateSeparated extends SliverChildBuilderDelegate {
  final NullableIndexedWidgetBuilder itemBuilder;
  final NullableIndexedWidgetBuilder separatorBuilder;
  final int itemCount;
  final bool endDivider;

  SliverChildBuilderDelegateSeparated({required this.itemBuilder, required this.separatorBuilder, required this.itemCount, this.endDivider = true})
      : super((context, index) {
          final int itemIndex = index ~/ 2;
          final Widget? widget;
          if (index.isEven) {
            widget = itemBuilder(context, itemIndex);
          } else {
            widget = separatorBuilder(context, itemIndex);
          }
          return widget;
        }, childCount: _computeActualChildCount(itemCount, endDivider));

  static int _computeActualChildCount(int itemCount, bool endDivider) {
    return max(0, itemCount * 2 - (endDivider ? 0 : 1));
  }
}
