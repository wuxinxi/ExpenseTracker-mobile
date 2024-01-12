import 'package:app_common/app_common.dart';
import 'package:app_component/app_component.dart';
import 'package:expense_tracker/src/constants/image_path.dart';
import 'package:flutter/material.dart';

import '../../../../generated/l10n.dart';

///
/// @date: 2023/7/14 17:00
/// @author: Sensi
/// @remark:
///

final List<BottomNavigationBarItem> homeItems = [
  _barItem(assets: ImagePath.iconHomeDetail, label: S.current.home_detail),
  _barItem(assets: ImagePath.iconHomeAnalytics, label: S.current.home_analytics),
  _centerItem(),
  _barItem(assets: ImagePath.iconHomeFind, label: S.current.home_find),
  _barItem(assets: ImagePath.iconHomeMe, label: S.current.home_me),
];

BottomNavigationBarItem _barItem({required String assets, required String label}) {
  return BottomNavigationBarItem(
    icon: ImageHelper.load(assets, size: 30),
    activeIcon: ImageHelper.load(assets, size: 30, color: Theme.of(Application.context).primaryColor),
    label: label,
  );
}

BottomNavigationBarItem _centerItem() => BottomNavigationBarItem(
    icon: const Icon(Icons.add, color: Colors.transparent, size: 30), label: S.current.home_record);
