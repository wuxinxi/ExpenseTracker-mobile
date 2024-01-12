///
/// @date: 2023/7/16 18:10
/// @author: Sensi
/// @remark:
///

abstract class DateHelper {
  static String getDateTime() {
    final time = DateTime.now();
    String year = '${time.year}';
    String month = '${time.month}'.padLeft(2, '0');
    String day = '${time.day}'.padLeft(2, '0');
    String hour = '${time.hour}'.padLeft(2, '0');
    String minute = '${time.minute}'.padLeft(2, '0');
    String second = '${time.second}'.padLeft(2, '0');
    return '$year-$month-$day $hour:$minute:$second';
  }

  static String getDate() {
    final time = DateTime.now();
    String year = '${time.year}';
    String month = '${time.month}'.padLeft(2, '0');
    String day = '${time.day}'.padLeft(2, '0');
    return '$year-$month-$day';
  }
}
