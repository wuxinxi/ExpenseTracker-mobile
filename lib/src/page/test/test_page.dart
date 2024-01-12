import 'package:app_common/app_common.dart';
import 'package:app_component/app_component.dart';
import 'package:expense_tracker/src/page/test/logo_model.dart';
import 'package:flutter/material.dart';

///
/// @date: 2023/08/04 11:04
/// @author: LovelyCoder
/// @remark:
///

class TestPage extends StatelessWidget {
  const TestPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('build - TestPage:17 -> ');
    return SimpleProvider(
      create: () => LogoModel(),
      child: const AppScaffold(
          body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LogoScreen(),
            LogoControlScreen(),
          ],
        ),
      )),
    );
  }
}

class LogoScreen extends StatelessWidget {
  const LogoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.watch<LogoModel>();
    return Card(child: Transform.flip(flipX: model.flipX, flipY: model.flipY, child: FlutterLogo(size: model.size)));
  }
}

class LogoControlScreen extends StatelessWidget {
  const LogoControlScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.watch<LogoModel>();
    return Column(
      children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          'flipX'.text(),
          Switch(value: model.flipX, onChanged: (value) => model.flipX = value),
          'flipY'.text(),
          Switch(value: model.flipY, onChanged: (value) => model.flipY = value),
        ]),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          'Size'.text(),
          Slider(value: model.size, onChanged: (value) => model.size = value, min: 0, max: 100)
        ]),
      ],
    );
  }
}
