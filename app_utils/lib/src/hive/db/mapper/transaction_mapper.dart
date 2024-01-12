import 'package:app_utils/src/hive/db/constants/table_name.dart';
import 'package:app_utils/src/hive/db/table/transaction.dart';

import 'base/mapper.dart';

///
/// @date: 2023/8/6 10:04
/// @author: Sensi
/// @remark:
///

class TransactionMapper extends Mapper<Transaction> {
  @override
  String tableName() => transactionTableName;
}
