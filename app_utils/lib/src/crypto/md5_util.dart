///
/// @data: 2023/7/9 11:46
/// @author: Sensi
/// @remark:
import 'dart:convert';
import 'package:crypto/crypto.dart';

String calculateMD5(String value) {
  final bytes = utf8.encode(value);
  final digest = md5.convert(bytes);
  return digest.toString();
}
