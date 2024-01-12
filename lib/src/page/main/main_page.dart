import 'package:app_common/app_common.dart';
import 'package:app_component/app_component.dart';
import 'package:flutter/material.dart';

import '../home/detail/detail_page.dart';
import '../home/transaction/transaction_page.dart';
import 'component/bottom_navigation_bar_items.dart';
import 'page_controller/page_change_notifier.dart';

part 'component/main_screen.dart';

///
/// @data: 2023/7/7 17:04
/// @author: Sensi
/// @remark:
///
class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainScreen(onCenterTap: () {
      AppRouter.navigateTo('',targetPage: TransactionPage(),transition: TransitionType.inFromBottom);
    });
  }
}
