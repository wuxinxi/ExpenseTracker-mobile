import 'package:flutter/cupertino.dart';

///
/// @date: 2023/4/13 21:08
/// @author: Sensi
/// @remark:
///

///Kotlin->let,null safe
extension Let<T> on T {
  R? let<R>(R? Function(T) block) {
    return this != null ? block(this) : null;
  }
}

withTryCatch(Function body) {
  try {
    return body();
  } catch (e) {
    debugPrint('withTryCatch>>(:20)>>${body.runtimeType} -> $e');
    return null;
  }
}
