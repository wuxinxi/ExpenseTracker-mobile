import 'package:app_component/app_component.dart';
import 'package:flutter/material.dart';

///
/// @data: 2023/7/7 20:20
/// @author: Sensi
/// @remark:
///
class AppLogo extends StatelessWidget {
  const AppLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text.rich("AP".textSpan(
        fontColor: Colors.black,
        textStyle: AppTextStyle.custom(fontWeight: AppFontWeight.bold, fontSize: 60.sp),
        children: [
          "P".textSpan(
            fontColor: Theme.of(context).primaryColor,
            textStyle: AppTextStyle.custom(fontWeight: AppFontWeight.bold, fontSize: 60.sp),
          )
        ]));
  }
}
