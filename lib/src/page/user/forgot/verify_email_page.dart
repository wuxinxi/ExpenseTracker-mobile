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
class VerifyEmailPage extends StatelessWidget {
  const VerifyEmailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      centerTitle: true,
      dismissKeyboardOnTouch: true,
      titleText: S.current.app_find_password,
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
              ),

              /// verify code
              MaterialEditText(
                leading: Icons.health_and_safety_outlined,
                hint: S.current.get_verify_code,
                keyboardType: TextInputType.number,
                countdownButtonLabel: S.current.send_verify_code,
                inputType: InputType.verify,
                countdown: 10,
                onCountdownPressed: () async {
                  await Future.delayed(const Duration(seconds: 3));
                },
              ),
            ]),
          ),
          SizedBox(height: 20.h),
          CommonButtonDelegate.primaryAnimated(S.current.next, onPressed: () async {
            await Future.delayed(const Duration(seconds: 3));
            AppRouter.navigateTo(userRestPassword);
          }),
        ],
      ),
    );
  }
}
