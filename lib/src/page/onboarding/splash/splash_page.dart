import 'dart:async';

import 'package:app_common/app_common.dart';
import 'package:app_component/app_component.dart';
import 'package:expense_tracker/src/constants/router_path.dart';
import 'package:expense_tracker/src/page/onboarding/splash/login_interceptor.dart';
import 'package:flutter/material.dart';

///
/// @data: 2023/7/7 16:48
/// @author: Sensi
/// @remark:
///
class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends LifecycleState<SplashPage> with SingleTickerProviderStateMixin {
  late Timer _timer;
  late final AnimationController _controller = AnimationController(duration: const Duration(seconds: 1), vsync: this);
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animation = Tween(begin: 1.0, end: 2.0).chain(CurveTween(curve: Curves.linear)).animate(_controller);
    _controller.forward();
    _timer = Timer(const Duration(seconds: 3),
        () => AppRouter.navigateTo(homePagePath, interceptor: LoginInterceptor(), replace: true));
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      hideAppbar: true,
      extendBody: true,
      full: true,
      body: Center(
        child: AnimatedBuilder(
          animation: _animation,
          builder: (BuildContext context, Widget? child) {
            return Transform.scale(
                scale: _animation.value,
                child: '记YI笔'.text(
                    letterSpacing: 3.0,
                    textStyle: AppTextStyle.custom(fontSize: 30.0, fontWeight: AppFontWeight.regular),
                    fontColor: Colors.white));
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    _controller.dispose();
    super.dispose();
  }
}
