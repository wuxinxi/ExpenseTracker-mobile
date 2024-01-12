import 'package:app_utils/src/hive/db/constants/table_name.dart';

import '../table/member.dart';
import 'base/mapper.dart';

///
/// @date: 2023/8/6 10:04
/// @author: Sensi
/// @remark:
///

class MemberMapper extends Mapper<Member> {
  @override
  String tableName() => memberTableName;
}
