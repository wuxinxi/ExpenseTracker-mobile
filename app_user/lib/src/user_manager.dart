import 'package:app_common/app_common.dart';
import 'package:app_user/src/data/user_data.dart';
import 'package:app_utils/app_utils.dart';
import 'package:flutter/material.dart';

import 'exception/non_login_exception.dart';

///
/// @date: 2023/7/12 20:36
/// @author: Sensi
/// @remark:
///
const _userDataBoxName = '_user_data_table';
const _userDataKey = '_user_data_key';
const _loginPath = '/user/login';

class UserManager extends ChangeNotifier {
  late Box<UserData> _userDataBox;
  UserData? _userData;

  late bool _isLogin = false;

  bool get isLogin => _isLogin;

  bool get nonLogin => !isLogin;

  set isLogin(bool value) {
    _isLogin = value;
    notifyListeners();
  }

  UserManager._();

  static final UserManager _instance = UserManager._();

  factory UserManager() {
    return _instance;
  }

  Future setupUserManager() async {
    addHiveAdapter(UserDataAdapter());
    _userDataBox = await Hive.openBox(_userDataBoxName);
    _userData = _userDataBox.get(_userDataKey);
    _isLogin = _userData != null;
  }

  login(Map<String, dynamic> userMap) {
    _userData = UserData.fromMap(userMap);
    _userDataBox.put(_userDataKey, _userData!);
    isLogin = true;
  }

  updateToken(String newToken) async {
    (_userData == null).ok(() => logout());
    await _userData?.let((userData) async {
      userData.accessToken = newToken;
      await _userDataBox.put(_userDataKey, userData);
    });
  }

  String? get accessToken => _userData?.accessToken;

  String? get refreshToken => _userData?.refreshToken;

  logout() async {
    await _userDataBox.delete(_userDataKey);
    isLogin = false;
    AppRouter.hasRoute(_loginPath).failed(() => AppRouter.navigateTo(_loginPath, clearStack: true));
  }

  UserData get userData {
    if (_userData == null) {
      isLogin = false;
      throw NonLoginException();
    }
    return _userData!;
  }

  @override
  void dispose() {
    Hive.close();
    super.dispose();
  }
}
