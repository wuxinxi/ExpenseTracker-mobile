import '../crypto/md5_util.dart';

///
/// @date: 2023/7/11 21:13
/// @author: Sensi
/// @remark:
///

extension StringExtensions on String {
  String toMD5() {
    assert(isNotEmpty, "Empty string can't convert MD5");
    return calculateMD5(this);
  }
}
