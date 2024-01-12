import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'keyboard.dart';

///
/// @date: 2023/08/05 22:03
/// @author: LovelyCoder
/// @remark:
///

class GridViewCompat extends StatelessWidget {
  final SliverGridDelegate gridDelegate;
  final int? itemCount;
  final NullableIndexedWidgetBuilder itemBuilder;
  final KeyboardController keyboardController;
  final EdgeInsetsGeometry? padding;

  final Function(double)? onChange;
  final VoidCallback? onDay;
  final VoidCallback? onFirst;
  final VoidCallback? onSecond;
  final ValueNotifier<String> firstOperationController;
  final ValueNotifier<String> secondOperationController;

  const GridViewCompat({
    Key? key,
    required this.gridDelegate,
    required this.itemBuilder,
    required this.keyboardController,
    this.itemCount,
    this.padding,
    this.onChange,
    this.onFirst,
    this.onSecond,
    required this.firstOperationController,
    required this.secondOperationController,
    this.onDay,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
        listenable: keyboardController,
        builder: (context, child) {
          return Stack(children: [
            GridView.builder(
                padding: padding ??
                    EdgeInsets.only(
                        left: 10.w,
                        right: 10.w,
                        top: 10.h,
                        bottom: keyboardController.visible ? kKeyboardHeight + 30 : 10.h),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  mainAxisSpacing: 10.r,
                ),
                itemCount: itemCount ?? 0,
                itemBuilder: itemBuilder),

            /// keyboard
            Visibility(
                visible: keyboardController.visible,
                child: Positioned(
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: Keyboard(
                      controller: keyboardController,
                      onFirst: onFirst,
                      onSecond: onSecond,
                      onDay: onDay,
                      onChange: onChange,
                      firstOperationController: firstOperationController,
                      secondOperationController: secondOperationController,
                    )))
          ]);
        });
  }
}
