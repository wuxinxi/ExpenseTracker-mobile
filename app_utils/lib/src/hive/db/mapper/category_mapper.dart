import 'package:app_utils/src/hive/db/constants/table_name.dart';
import 'package:app_utils/src/hive/db/table/category.dart';

import 'base/mapper.dart';

///
/// @date: 2023/8/6 10:04
/// @author: Sensi
/// @remark:
///

class CategoryMapper extends Mapper<Category> {
  @override
  String tableName() => categoryTableName;
}
