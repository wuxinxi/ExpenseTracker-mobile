import 'package:app_component/app_component.dart';
import 'package:flutter/material.dart';

///
/// @date: 2023/7/14 17:43
/// @author: Sensi
/// @remark:
///

class PageChangeNotifier extends LifecycleChangeNotifier {
  late final PageController _pageController = PageController();
  int _index = 0;

  int get index => _index;

  PageController get pageController => _pageController;

  set bottomBarIndex(int value) {
    print('bottomBarIndex - PageChangeNotifier:19 -> index=$index,value=$value');
    if (index != value) {
      _index = value;
      notifyListeners();
    }
  }

  void bodyIndex(int page) {
    _pageController.jumpToPage(page);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
