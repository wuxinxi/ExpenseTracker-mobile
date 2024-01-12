import 'package:app_common/app_common.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'toast_component.dart';

///
/// @date: 2022/10/15 12:19
/// @author: Sensi
/// @remark:
///

void toast({required String message, bool success = true}) {
  final context = Application.context;
  final fToast = FToast()..init(context);
  fToast.showToast(
    gravity: ToastGravity.CENTER,
    child: ToastComponent(
      message: message,
      success: success,
    ),
  );
}
