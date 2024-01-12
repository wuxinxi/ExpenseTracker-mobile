import 'package:app_component/app_component.dart';
import 'package:flutter/material.dart';

const successAssets = "assets/images/icon_success_ticker.svg";
const failedAssets = "assets/images/icon_failed.svg";

class ToastComponent extends StatelessWidget {
  final String message;
  final bool success;

  const ToastComponent({Key? key, required this.message, this.success = true}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        constraints: BoxConstraints(minWidth: 150.w, minHeight: 80.h, maxHeight: 150.h, maxWidth: 225.w),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20.r)),
            color: const Color(0xFFFCFCFC),
            boxShadow: [BoxShadow(color: const Color(0x40000000), blurRadius: 10.r)]),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          SizedBox(height: 25.h),
          if (success)
            Container(
              height: 40,
              width: 40,
              alignment: Alignment.center,
              decoration: BoxDecoration(shape: BoxShape.circle, color: Theme.of(context).primaryColor),
              child: ImageHelper.load(successAssets, package: 'app_component'),
            ),
          if (!success) ImageHelper.load(failedAssets, size: 40.r, package: 'app_component'),
          SizedBox(height: 15.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            child: message.text(maxLines: 2, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center),
          ),
          SizedBox(height: 15.h),
        ]));
  }
}
