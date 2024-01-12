import 'package:app_network/app_network.dart';
import 'package:app_user/app_user.dart';
import 'package:app_utils/app_utils.dart';

///
/// @date: 2023/7/9 12:10
/// @author: Sensi
/// @remark:
///

class LoginRepository {
  Future<UserModel> login(String email, String password) async {
    final userModel = await AsyncHttp().request(
        UserModel(),
        enableLoading: true,
        method: Method.post,
        loginUrl,
        data: LoginRequestModel(email, password.toMD5()).toJson());
    if (userModel.success) {
      UserManager().login(userModel.toJson());
    }
    return userModel;
  }
}
