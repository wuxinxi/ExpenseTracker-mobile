///
/// @date: 2023/7/11 21:05
/// @author: Sensi
/// @remark:
///

extension BoolExtensions on bool {
  void ok(Function() action) {
    if (this) {
      action();
    }
  }

  void failed(Function() action) {
    if (!this) {
      action();
    }
  }
}
