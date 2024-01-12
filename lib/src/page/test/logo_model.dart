import 'package:flutter/material.dart';

///
/// @date: 2023/8/4 11:06
/// @author: Sensi
/// @remark:
///

class LogoModel extends ChangeNotifier {
  double _size = 50;
  bool _flipX = true;
  bool _flipY = false;

  double get size => _size;

  set size(double value) {
    _size = value;
    notifyListeners();
  }

  bool get flipX => _flipX;

  set flipX(bool value) {
    _flipX = value;
    notifyListeners();
  }

  bool get flipY => _flipY;

  set flipY(bool value) {
    _flipY = value;
    notifyListeners();
  }
}
