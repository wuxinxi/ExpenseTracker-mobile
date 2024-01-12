import '../constants/http_code.dart';

///
/// @data: 2023/7/8 16:59
/// @author: Sensi
/// @remark:

class ApiResponse<T> {
  int code = -1;
  String msg = '';
  T? data;

  ApiResponse fromJsonConvert(Map<String, dynamic> json) {
    code = json['code'] ?? -1;
    msg = json['msg'] ?? 'ERROR';
    if (code == HttpCode.ok && json.containsKey('data')) {
      data = fromJson(json['data']);
    }
    return this;
  }

  T? fromJson(dynamic json) => json;

  bool get success => code == HttpCode.ok;

  void cancel() {
    code = HttpCode.canceled;
    msg = 'request canceled';
  }
}
