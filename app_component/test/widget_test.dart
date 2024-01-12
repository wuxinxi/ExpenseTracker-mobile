// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';


void main() {
  print('main - :12 -> ${hasTwoDecimalPlaces('0.03')}');
  print('main - :12 -> ${hasTwoDecimalPlaces('0.1')}');
  print('main - :12 -> ${hasTwoDecimalPlaces('0')}');
}

bool hasTwoDecimalPlaces(String str) {
  if (str.contains('.')) { // 判断字符串是否包含小数点
    List<String> parts = str.split('.'); // 将字符串以小数点分割成两个部分
    if (parts.length == 2 && parts[1].length == 2) { // 判断小数点后面的部分是否有两个数字
      return true;
    }
  }
  return false;
}