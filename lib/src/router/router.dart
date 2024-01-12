import 'package:app_common/app_common.dart';

import '../constants/router_path.dart';
import '../page/page.dart';

final Map<String, Handler> pageHandler = {
  initPagePath: Handler(handlerFunc: (context, params) => const SplashPage()),
  homePagePath: Handler(handlerFunc: (context, params) => const MainPage()),
  userLogin: Handler(handlerFunc: (context, params) => const LoginPage()),
  userRegister: Handler(handlerFunc: (context, params) => const RegisterPage()),
  userVerifyEmail: Handler(handlerFunc: (context, params) => const VerifyEmailPage()),
  userRestPassword: Handler(handlerFunc: (context, params) => const ResetPasswordPage()),
};

void setupRouter() {
  pageHandler.forEach((path, handler) => AppRouter.define(path, handler: handler));
}
