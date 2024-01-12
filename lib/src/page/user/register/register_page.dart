import 'package:app_common/app_common.dart';
import 'package:app_component/app_component.dart';
import 'package:expense_tracker/generated/l10n.dart';
import 'package:expense_tracker/src/constants/router_path.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

part 'component/user_agreement.dart';

///
/// @data: 2023/7/7 23:31
/// @author: Sensi
/// @remark:
///
class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends LifecycleState<RegisterPage> {
  late final TextEditingController _emailController = TextEditingController();
  late final TextEditingController _passwordController = TextEditingController();
  late final TextEditingController _codeController = TextEditingController();
  late final TextEditingController _confirmPasswordController = TextEditingController();
  late final UserAgreementController _agreementController = UserAgreementController();

  bool _agreeCheckBox = false;

  bool get agreeCheckBox => _agreeCheckBox;

  set agreeCheckBox(bool value) {
    _agreeCheckBox = value;
    rebuild();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      hideBack: false,
      centerTitle: true,
      dismissKeyboardOnTouch: true,
      titleText: S.current.app_new_user_register,
      resizeToAvoidBottomInset: true,
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        children: [
          SizedBox(height: 60.h),
          const Center(child: AppLogo()),
          SizedBox(height: 60.h),
          Container(
            decoration: const BoxDecoration(
                border: Border(
              left: BorderSide(color: Colors.black12),
              top: BorderSide(color: Colors.black12),
              right: BorderSide(color: Colors.black12),
            )),
            child: Column(children: [
              /// email
              MaterialEditText(
                leading: Icons.email_outlined,
                hint: S.current.input_email,
                controller: _emailController,
              ),

              /// verify code
              MaterialEditText(
                leading: Icons.health_and_safety_outlined,
                hint: S.current.get_verify_code,
                keyboardType: TextInputType.number,
                controller: _codeController,
                countdownButtonLabel: S.current.send_verify_code,
                inputType: InputType.verify,
                countdown: 10,
                onCountdownPressed: () async {
                  await Future.delayed(const Duration(seconds: 3));
                },
              ),

              /// password
              MaterialEditText(
                leading: Icons.lock_outline,
                hint: S.current.set_login_password,
                inputType: InputType.password,
                controller: _passwordController,
              ),

              /// confirm password
              MaterialEditText(
                leading: Icons.lock_outline,
                hint: S.current.confirm_login_password,
                inputType: InputType.password,
                controller: _confirmPasswordController,
              ),
            ]),
          ),
          SizedBox(height: 20.h),
          UserAgreement(controller: _agreementController, onPressed: () {}),
          SizedBox(height: 20.h),
          CommonButtonDelegate.primaryAnimated(S.current.register, onPressed: () async {
            await Future.delayed(const Duration(seconds: 3));
          }),
          SizedBox(height: 20.h),
          RichTextCompat(
              textAlign: TextAlign.center,
              spanCompat: '${S.current.exist_account}，'.textSpanCompat(children: [
                S.current.go_login
                    .textSpanCompat(fontColor: Theme.of(context).primaryColor, onPressed: () => context.go(userLogin)),
              ])),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _codeController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }
}
