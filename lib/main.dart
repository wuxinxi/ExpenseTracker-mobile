import 'package:app_common/app_common.dart';
import 'package:app_component/app_component.dart';
import 'package:app_user/app_user.dart';
import 'package:app_utils/app_utils.dart';
import 'package:expense_tracker/src/constants/router_path.dart';
import 'package:expense_tracker/src/global/theme/app_theme.dart';
import 'package:expense_tracker/src/router/router.dart';
import 'package:flutter/material.dart';

import 'generated/l10n.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await hiveInitial();
  await UserManager().setupUserManager();
  setupRouter();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
          theme: appTheme,
          navigatorKey: Application.globalKey,
          initialRoute: initPagePath,
          onGenerateRoute: AppRouter.generator,
          debugShowCheckedModeBanner: false,
          navigatorObservers: [AppRouteObserver()],
          builder: (context, widget) {
            Application.context = context;
            return Overlay(initialEntries: [
              OverlayEntry(
                  builder: (context) =>
                      MediaQuery(data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0), child: widget!))
            ]);
          },
          supportedLocales: S.delegate.supportedLocales,
          localizationsDelegates: const [S.delegate],
        );
      },
    );
  }
}
