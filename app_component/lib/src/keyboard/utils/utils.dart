///
/// @date: 2023/7/16 21:50
/// @author: Sensi
/// @remark:
///

bool isValidFormat(String str) {
  if (str.contains('.') && !str.contains('+') && !str.contains('-')) {
    List<String> parts = str.split('.');
    if (parts.length == 2 && parts[1].length == 2) {
      return true;
    }
  }
  return false;
}

String formatDouble(double num) {
  String result = num.toStringAsFixed(2);
  if (result.endsWith('0')) {
    return result.substring(0, result.length - 1);
  } else if (result.endsWith('.00')) {
    return result.substring(0, result.length - 3);
  } else if (result.contains('.') && result.endsWith('0')) {
    return result.substring(0, result.length - 1);
  } else {
    return result;
  }
}
