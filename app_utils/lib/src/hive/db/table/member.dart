import 'package:app_utils/src/hive/db/table/table.dart';
import 'package:hive/hive.dart';

part 'member.g.dart';

///
/// @date: 2023/8/6 9:28
/// @author: Sensi
/// @remark:
///
@HiveType(typeId: 2)
class Member extends Table {
  @override
  @HiveField(0)
  int id;
  @HiveField(1)
  int userId;
  @HiveField(2)
  String memberName;
  @HiveField(3)
  String? memberAvatarUrl;

  Member({
    required this.id,
    required this.userId,
    required this.memberName,
    this.memberAvatarUrl,
  }):super(id: id);
}
