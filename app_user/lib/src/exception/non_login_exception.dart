///
/// @date: 2023/7/12 21:52
/// @author: Sensi
/// @remark:
///

class NonLoginException implements Exception {
  final String message;

  NonLoginException({this.message = 'Non Login'});
}
