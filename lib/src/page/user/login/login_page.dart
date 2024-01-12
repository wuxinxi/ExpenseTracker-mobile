import 'package:app_common/app_common.dart';
import 'package:app_component/app_component.dart';
import 'package:expense_tracker/generated/l10n.dart';
import 'package:expense_tracker/src/constants/router_path.dart';
import 'package:flutter/material.dart';

import 'repository/login_repository.dart';

///
/// @data: 2023/7/7 20:11
/// @author: Sensi
/// @remark:
///
class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends LifecycleState<LoginPage> {
  late final TextEditingController _emailController = TextEditingController();
  late final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      hideBack: true,
      centerTitle: true,
      dismissKeyboardOnTouch: true,
      titleText: S.current.login,
      resizeToAvoidBottomInset: true,
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        children: [
          SizedBox(height: 60.h),
          const Center(child: AppLogo()),
          SizedBox(height: 60.h),
          MaterialEditText(
            leading: Icons.email_outlined,
            hint: S.current.input_email,
            controller: _emailController,
          ),
          SizedBox(height: 20.h),
          MaterialEditText(
            leading: Icons.lock_outline,
            hint: S.current.input_password,
            inputType: InputType.password,
            controller: _passwordController,
          ),
          SizedBox(height: 20.h),
          CommonButtonDelegate.primaryAnimated(S.current.login, onPressed: () async {
            final user = await LoginRepository().login(_emailController.text, _passwordController.text);
            toast(message: user.msg, success: user.success);
            user.success.ok(() => AppRouter.navigateTo(homePagePath,clearStack: true));
          }),
          SizedBox(height: 20.h),
          Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            S.current.app_register_new_user.textButton(onPressed: () => context.push(userRegister)),
            S.current.app_find_password.textButton(onPressed: () => context.push(userVerifyEmail)),
          ]),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
