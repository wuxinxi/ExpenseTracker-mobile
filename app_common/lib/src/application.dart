import 'package:flutter/cupertino.dart';

///
/// @data: 2023/7/7 13:52
/// @author: Sensi
/// @remark:
///
class Application {
  static final GlobalKey<NavigatorState> globalKey = GlobalKey();

  static BuildContext? _context;

  static set context(BuildContext value) {
    _context = value;
  }

  static BuildContext get context => globalKey.currentState?.context ?? _context!;
}
