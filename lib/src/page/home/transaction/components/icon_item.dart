import 'package:app_common/app_common.dart';
import 'package:app_component/app_component.dart';
import 'package:flutter/material.dart';

import '../../../../data/transaction_icon_data.dart';

///
/// @date: 2023/07/16 12:27
/// @author: LovelyCoder
/// @remark:
///

class IconItem extends StatelessWidget {
  final TransactionIconData iconData;
  final Function(int)? onPressed;
  final bool selected;

  const IconItem({
    Key? key,
    required this.iconData,
    this.onPressed,
    this.selected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onPressed?.call(iconData.id),
      child: Column(children: [
        Container(
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: selected ? context.themeColor.primaryColor : context.themeColor.secondGreyColor.withOpacity(.2)),
          child: Padding(
            padding: EdgeInsets.all(15.r),
            child: Icon(iconData.iconData,
                color: selected ? context.themeColor.whiteColor : context.themeColor.blackColor),
          ),
        ),
        5.h.spaceV(),
        iconData.name.text(),
      ]),
    );
  }
}
