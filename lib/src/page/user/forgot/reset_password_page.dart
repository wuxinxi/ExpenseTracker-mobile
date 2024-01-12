import 'package:app_common/app_common.dart';
import 'package:app_component/app_component.dart';
import 'package:expense_tracker/generated/l10n.dart';
import 'package:expense_tracker/src/constants/router_path.dart';
import 'package:flutter/material.dart';

///
/// @data: 2023/7/8 16:06
/// @author: Sensi
/// @remark:
///
class ResetPasswordPage extends StatelessWidget {
  const ResetPasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      centerTitle: true,
      titleText: S.current.app_find_password,
      dismissKeyboardOnTouch: true,
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
              /// password
              MaterialEditText(
                leading: Icons.lock_outline,
                hint: S.current.set_login_password,
                inputType: InputType.password,
              ),

              /// confirm password
              MaterialEditText(
                leading: Icons.lock_outline,
                hint: S.current.confirm_login_password,
                inputType: InputType.password,
              ),
            ]),
          ),
          SizedBox(height: 20.h),
          CommonButtonDelegate.primaryAnimated(S.current.commit, onPressed: () async {
            await Future.delayed(const Duration(seconds: 3));
            AppRouter.navigateTo(userLogin);
          }),
        ],
      ),
    );
  }
}
