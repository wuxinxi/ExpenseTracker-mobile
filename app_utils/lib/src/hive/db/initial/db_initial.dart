import 'package:app_utils/src/hive/db/table/category.dart';
import 'package:app_utils/src/hive/db/table/member.dart';
import 'package:app_utils/src/hive/db/table/transaction.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

///
/// @date: 2023/8/6 10:39
/// @author: Sensi
/// @remark:
///
const _childDir = '/database/hive';

hiveInitial() async {
  final appDir = await getApplicationDocumentsDirectory();
  final path = '${appDir.path}$_childDir';

  Hive
    ..init(path)
    ..registerAdapter(TransactionAdapter())
    ..registerAdapter(CategoryAdapter())
    ..registerAdapter(MemberAdapter());
}

addHiveAdapter<T>(
  TypeAdapter<T> adapter, {
  bool internal = false,
  bool override = false,
}) {
  Hive.registerAdapter(adapter, internal: internal, override: override);
}
