import 'package:app_common/app_common.dart';
import 'package:app_component/app_component.dart';
import 'package:app_user/app_user.dart';
import 'package:app_utils/app_utils.dart';
import 'package:expense_tracker/generated/l10n.dart';
import 'package:expense_tracker/src/page/home/transaction/components/icon_item.dart';
import 'package:expense_tracker/src/page/home/transaction/components/transaction_icon.dart';
import 'package:flutter/material.dart';

import '../../../data/transaction_icon_data.dart';

part 'transaction_screen.dart';

///
/// @date: 2023/07/16 10:03
/// @author: LovelyCoder
/// @remark:
///

class TransactionPage extends StatefulWidget {
  const TransactionPage({Key? key}) : super(key: key);

  @override
  State<TransactionPage> createState() => _TransactionPageState();
}

class _TransactionPageState extends State<TransactionPage> with SingleTickerProviderStateMixin {
  late final TabController _tabController = TabController(length: 2, vsync: this);

  late final List<Widget> _tabs = [
    Tab(child: S.current.expense.text(tag: TextTag.h2Regular)),
    Tab(child: S.current.income.text(tag: TextTag.h2Regular)),
  ];

  late final List<Widget> _tabBarViews = const [
    KeepAliveWrapper(child: TransactionScreen(icons: defaultExpenseTransactionIcon)),
    KeepAliveWrapper(child: TransactionScreen(icons: defaultIncomeTransactionIcon)),
  ];

  @override
  void initState() {
    super.initState();
    _tabController.addListener(_pageScrollListener);
  }

  _pageScrollListener() {
    if (_tabController.index == 0) {

    }
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: AppActionBar(
        actions: [S.current.cancel.textButton(onPressed: () {})],
        bottom: AppActionTabBar(
          tabs: _tabs,
          controller: _tabController,
          isScrollable: true,
          indicatorColor: context.themeColor.blackColor,
          actions: [S.current.cancel.textButton(onPressed: () => AppRouter.pop())],
        ),
      ),
      body: TabBarView(controller: _tabController, children: _tabBarViews),
    );
  }

  @override
  void dispose() {
    _tabController.removeListener(_pageScrollListener);
    _tabController.dispose();
    super.dispose();
  }
}
