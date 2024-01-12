import 'package:app_component/app_component.dart';
import 'package:app_common/app_common.dart';
import 'package:app_utils/app_utils.dart';
import 'package:expense_tracker/generated/l10n.dart';
import 'package:flutter/material.dart';

part 'component/detail_list.dart';

part 'component/detail_header.dart';

///
/// @date: 2023/07/14 19:28
/// @author: LovelyCoder
/// @remark:
///

class DetailPage extends StatelessWidget {
  final String label;

  const DetailPage({Key? key, required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      hideAppbar: true,
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverPersistentHeader(
              pinned: true,
              delegate: SliverHeaderSliverDelegate(maxHeight: 245.h, child: const DetailHeader()),
            ),
          ];
        },

        body: ValueListenableBuilder<Box<Transaction>>(
            valueListenable: Hive.box<Transaction>(transactionTableName).listenable(),
            builder: (context, value, child) {
              final transactions = value.values.toList().cast<Transaction>();
              return DetailList(
                transactions: transactions,
              );
            }),
      ),
    );
  }
}
